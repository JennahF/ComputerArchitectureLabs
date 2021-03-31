

module cache_lru #(
    parameter  LINE_ADDR_LEN = 3, // line内地�?????长度，决定了每个line具有2^3个word
    parameter  SET_ADDR_LEN  = 3, // 组地�?????长度，决定了�?????共有2^3=8�?????
    parameter  TAG_ADDR_LEN  = 6, // tag长度
    parameter  WAY_LEN       = 4,  // 组相连度，决定了每组中有多少路line，这里是直接映射型cache，因此该参数没用�?????
    parameter  WAY_CNT       = 11
)(
    input  clk, rst,
    output miss,               // 对CPU发出的miss信号
    input  [31:0] addr,        // 读写请求地址
    input  rd_req,             // 读请求信�?????
    output reg [31:0] rd_data, // 读出的数据，�?????次读�?????个word
    input  wr_req,             // 写请求信�?????
    input  [31:0] wr_data      // 要写入的数据，一次写�?????个word
);

localparam MEM_ADDR_LEN    = TAG_ADDR_LEN + SET_ADDR_LEN ; // 计算主存地址长度 MEM_ADDR_LEN，主存大�?????=2^MEM_ADDR_LEN个line
localparam UNUSED_ADDR_LEN = 32 - TAG_ADDR_LEN - SET_ADDR_LEN - LINE_ADDR_LEN - 2 ;       // 计算未使用的地址的长�?????
localparam LINE_SIZE       = 1 << LINE_ADDR_LEN  ;         // 计算 line �????? word 的数量，�????? 2^LINE_ADDR_LEN 个word �????? line
localparam SET_SIZE        = 1 << SET_ADDR_LEN   ;         // 计算�?????共有多少组，�????? 2^SET_ADDR_LEN 个组


reg [            31:0] cache_mem    [SET_SIZE][WAY_CNT][LINE_SIZE]; // SET_SIZE个way，每个way有WAY_CNT个line,每个line有LINE_SIZE个word
reg [TAG_ADDR_LEN-1:0] cache_tags   [SET_SIZE][WAY_CNT];            // SET_SIZE个TAG
reg                    valid        [SET_SIZE][WAY_CNT];            // SET_SIZE个valid(有效�?????)
reg                    dirty        [SET_SIZE][WAY_CNT];            // SET_SIZE个dirty(脏位)
reg          [WAY_CNT-1:0] cmp          ;

wire [              2-1:0]   word_addr;                   // 将输入地�?????addr拆分成这5个部�?????
wire [  LINE_ADDR_LEN-1:0]   line_addr;
wire [   SET_ADDR_LEN-1:0]    set_addr;
wire [   TAG_ADDR_LEN-1:0]    tag_addr;
wire [UNUSED_ADDR_LEN-1:0] unused_addr;
reg  [        WAY_LEN-1:0]    way_addr;

wire [        WAY_LEN-1:0]swap_in_addr;

enum  {IDLE, SWAP_OUT, SWAP_IN, SWAP_IN_OK} cache_stat;    // cache 状�?�机的状态定�?????
                                                           // IDLE代表就绪，SWAP_OUT代表正在换出，SWAP_IN代表正在换入，SWAP_IN_OK代表换入后进行一周期的写入cache操作�?????

reg  [   SET_ADDR_LEN-1:0] mem_rd_set_addr = 0;
reg  [   TAG_ADDR_LEN-1:0] mem_rd_tag_addr = 0;
wire [   MEM_ADDR_LEN-1:0] mem_rd_addr = {mem_rd_tag_addr, mem_rd_set_addr};
reg  [   MEM_ADDR_LEN-1:0] mem_wr_addr = 0;

reg  [31:0] mem_wr_line [LINE_SIZE];
wire [31:0] mem_rd_line [LINE_SIZE];

wire mem_gnt;      // 主存响应读写的握手信�?????

assign {unused_addr, tag_addr, set_addr, line_addr, word_addr} = addr;  // 拆分 32bit ADDR

reg cache_hit = 1'b0;
reg [WAY_LEN-1:0]clear_addr;
reg clear_en;
reg  [        WAY_LEN-1:0]swap_old_addr;
always @ (*) begin              // 判断 输入的address 是否�????? cache 中命�?????
    for(integer m = 0; m < WAY_CNT; m++)begin
    if(valid[set_addr][m]&& cache_tags[set_addr][m] == tag_addr)begin   // 如果 cache line有效，并且tag与输入地�?????中的tag相等，则命中
        cmp[m] = 1'b1;
        way_addr = m;
    end
    else
        cmp[m] = 1'b0;
    end
end

always@(*)begin
    cache_hit=|cmp;
end
/*
always@(*)begin
    case(cmp)
        4'd1:way_addr=2'd0;
        4'd2:way_addr=2'd1;
        4'd4:way_addr=2'd2;
        4'd8:way_addr=2'd3;
        default:way_addr=2'd0;
    endcase
end
*/

always @ (posedge clk or posedge rst) 
begin     
    if(rst) begin
        cache_stat <= IDLE;
        for(integer i = 0; i < SET_SIZE; i++) begin
            for(integer j = 0; j < WAY_CNT; j++) begin

            dirty[i][j] = 1'b0;
            valid[i][j] = 1'b0;
            end
        end
        for(integer k = 0; k < LINE_SIZE; k++)begin
            mem_wr_line[k] <= 0;
        end
        mem_wr_addr <= 0;
        {mem_rd_tag_addr, mem_rd_set_addr} <= 0;
        rd_data <= 0;
    end else begin
        case(cache_stat)
        IDLE:       begin
                        if(cache_hit) begin
                            if(rd_req) begin    // 如果cache命中，并且是读请求，
                                rd_data <= cache_mem[set_addr][way_addr][line_addr];   //则直接从cache中取出要读的数据
                                clear_addr<=way_addr;
                            end else if(wr_req) begin // 如果cache命中，并且是写请求，
                                cache_mem[set_addr][way_addr][line_addr] <= wr_data;   // 则直接向cache中写入数�?????
                                dirty[set_addr][way_addr] <= 1'b1;                     // 写数据的同时置脏�?????
                                clear_addr<=way_addr;
                            end 
                        end else begin
                            swap_old_addr<=swap_in_addr;
                            if(wr_req | rd_req) begin   // 如果 cache 未命中，并且有读写请求，则需要进行换�?????
                                if(valid[set_addr][swap_in_addr] & dirty[set_addr][swap_in_addr]) begin    // 如果 要换入的cache line 本来有效，且脏，则需要先将它换出
                                    cache_stat  <= SWAP_OUT;

                                    mem_wr_addr <= {cache_tags[set_addr][swap_in_addr], set_addr};
                                    mem_wr_line <= cache_mem[set_addr][swap_in_addr];
                                    clear_addr  <=swap_in_addr;
                                end else begin                                   // 反之，不�?????要换出，直接换入
                                    cache_stat  <= SWAP_IN;
                                    clear_addr  <=swap_in_addr;
                                end
                                {mem_rd_tag_addr, mem_rd_set_addr} <= {tag_addr, set_addr};
                            end
                        end
                        clear_en<=1'b1;
                    end
        SWAP_OUT:   begin
                        if(mem_gnt) begin           // 如果主存握手信号有效，说明换出成功，跳到下一状�??
                            cache_stat <= SWAP_IN;
                        end
                        clear_en<=1'b0;
                    end
        SWAP_IN:    begin
                        if(mem_gnt) begin           // 如果主存握手信号有效，说明换入成功，跳到下一状�??
                            cache_stat <= SWAP_IN_OK;
                        end
                        clear_en<=1'b0;
                    end
        SWAP_IN_OK: begin           // 上一个周期换入成功，这周期将主存读出的line写入cache，并更新tag，置高valid，置低dirty
                        for(integer i=0; i<LINE_SIZE; i++)  cache_mem[mem_rd_set_addr][swap_old_addr][i] <= mem_rd_line[i];
                        cache_tags[mem_rd_set_addr][swap_old_addr] <= mem_rd_tag_addr;
                        valid     [mem_rd_set_addr][swap_old_addr] <= 1'b1;
                        dirty     [mem_rd_set_addr][swap_old_addr] <= 1'b0;
                        cache_stat <= IDLE;        // 回到就绪状�??
                        clear_en<=1'b0;
                    end
        endcase
    end
end

wire mem_rd_req ;
assign mem_rd_req = (cache_stat == SWAP_IN );
wire mem_wr_req ;
assign mem_wr_req = (cache_stat == SWAP_OUT);

wire [   MEM_ADDR_LEN-1 :0] mem_addr;
assign  mem_addr = mem_rd_req ? mem_rd_addr : ( mem_wr_req ? mem_wr_addr : 0);

assign miss = (rd_req | wr_req) & ~(cache_hit && cache_stat==IDLE) ;     // �????? 有读写请求时，如果cache不处于就�?????(IDLE)状�?�，或�?�未命中，则miss=1

main_mem #(     // 主存，每次读写以line 为单�?????
    .LINE_ADDR_LEN  ( LINE_ADDR_LEN          ),
    .ADDR_LEN       ( MEM_ADDR_LEN           )
) main_mem_instance (
    .clk            ( clk                    ),
    .rst            ( rst                    ),
    .gnt            ( mem_gnt                ),
    .addr           ( mem_addr               ),
    .rd_req         ( mem_rd_req             ),
    .rd_line        ( mem_rd_line            ),
    .wr_req         ( mem_wr_req             ),
    .wr_line        ( mem_wr_line            )
);
reg [8:0]cnt;//�????1024周期清除LRU寄存�????
wire fifo_rst;
assign fifo_rst=(cnt==9'd0)?1'b1:1'b0;
always@(posedge clk or posedge rst)
begin
    if(rst)
        cnt<=9'd0;
    else
        cnt<=cnt+1'b1;
    
end


//assign swap_in_addr=2'd0;
lru #(
    .LINE_ADDR_LEN (LINE_ADDR_LEN), // line�ڵ�??���ȣ�������ÿ��line����2^3��word
    .SET_ADDR_LEN  (SET_ADDR_LEN), // ���????���ȣ�������??����2^3=8??
    .TAG_ADDR_LEN  (TAG_ADDR_LEN), // tag����
    .WAY_LEN       (WAY_LEN),  // �������ȣ�������ÿ�����ж���·line��������ֱ��ӳ����cache����˸ò���û��????
    .WAY_CNT       (WAY_CNT)
)lru_instance(

    .clk(clk), 
    .rst(fifo_rst),
    .set_addr(set_addr),
    .way_addr(clear_addr),  
    .way_rst_en(clear_en),     
    .swap_addr(swap_in_addr)
);

endmodule





