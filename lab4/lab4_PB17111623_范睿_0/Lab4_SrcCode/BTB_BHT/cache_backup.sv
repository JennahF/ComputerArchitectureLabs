module cache1 #(
    parameter  LINE_ADDR_LEN = 3, // line内地�?长度，决定了每个line具有2^3个word
    parameter  SET_ADDR_LEN  = 3, // 组地�?长度，决定了�?共有2^3=8�?
    parameter  TAG_ADDR_LEN  = 6, // tag长度
    parameter  WAY_CNT       = 4  // 组相连度，决定了每组中有多少路line，这里是直接映射型cache，因此该参数没用�?
)(
    input  clk, rst,
    output miss,               // 对CPU发出的miss信号
    input  [31:0] addr,        // 读写请求地址
    input  rd_req,             // 读请求信�?
    output reg [31:0] rd_data, // 读出的数据，�?次读�?个word
    input  wr_req,             // 写请求信�?
    input  [31:0] wr_data      // 要写入的数据，一次写�?个word
);
`define LRU//选择替换方式
//`define FIFO

localparam MEM_ADDR_LEN    = TAG_ADDR_LEN + SET_ADDR_LEN ; // 计算主存地址长度 MEM_ADDR_LEN，主存大�?=2^MEM_ADDR_LEN个line
localparam UNUSED_ADDR_LEN = 32 - TAG_ADDR_LEN - SET_ADDR_LEN - LINE_ADDR_LEN - 2 ;       // 计算未使用的地址的长�?

localparam LINE_SIZE       = 1 << LINE_ADDR_LEN  ;         // 计算 line �? word 的数量，�? 2^LINE_ADDR_LEN 个word �? line
localparam SET_SIZE        = 1 << SET_ADDR_LEN   ;         // 计算�?共有多少组，�? 2^SET_ADDR_LEN 个组
localparam MAX_TIME        = 1 << (TAG_ADDR_LEN + SET_ADDR_LEN + LINE_ADDR_LEN);//时间戳的�?大�??

reg [            31:0] cache_mem    [SET_SIZE][WAY_CNT][LINE_SIZE]; // SET_SIZE个line，每个line有LINE_SIZE个word
reg [TAG_ADDR_LEN-1:0] cache_tags   [SET_SIZE][WAY_CNT];            // SET_SIZE个TAG
reg                    valid        [SET_SIZE][WAY_CNT];            // SET_SIZE个valid(有效�?)
reg                    dirty        [SET_SIZE][WAY_CNT];            // SET_SIZE个dirty(脏位)

wire [              2-1:0]   word_addr;                   // 将输入地�?addr拆分成这5个部�?
wire [  LINE_ADDR_LEN-1:0]   line_addr;
wire [   SET_ADDR_LEN-1:0]    set_addr;
wire [   TAG_ADDR_LEN-1:0]    tag_addr;
wire [UNUSED_ADDR_LEN-1:0] unused_addr;

enum  {IDLE, SWAP_OUT, SWAP_IN, SWAP_IN_OK} cache_stat;    // cache 状�?�机的状态定�?
                                                           // IDLE代表就绪，SWAP_OUT代表正在换出，SWAP_IN代表正在换入，SWAP_IN_OK代表换入后进行一周期的写入cache操作�?

reg  [   SET_ADDR_LEN-1:0] mem_rd_set_addr = 0;
reg  [   TAG_ADDR_LEN-1:0] mem_rd_tag_addr = 0;
wire [   MEM_ADDR_LEN-1:0] mem_rd_addr = {mem_rd_tag_addr, mem_rd_set_addr};
reg  [   MEM_ADDR_LEN-1:0] mem_wr_addr = 0;

reg  [31:0] mem_wr_line [LINE_SIZE];
wire [31:0] mem_rd_line [LINE_SIZE];

wire mem_gnt;      // 主存响应读写的握手信�?

assign {unused_addr, tag_addr, set_addr, line_addr, word_addr} = addr;  // 拆分 32bit ADDR

reg cache_hit = 1'b0;
integer vis_id;//访问的是组里的哪个line
always @ (*) begin              // 判断 输入的address 是否�? cache 中命�?
    cache_hit = 1'b0;
    for (integer i=0;i<WAY_CNT;i++)//�?测是否有命中，是哪组命中
    begin
        if (valid[set_addr][i]&&cache_tags[set_addr][i]==tag_addr)//如果有命�?
        begin
            cache_hit = 1'b1;
            vis_id = i;
            break;
        end
    end    
end

integer swap_id;//选择换出的路
`ifdef FIFO//根据FIFO算法换出
    integer choice[SET_SIZE];//每个组下次要换出的是哪一�?,采用类似循环队列的方法来实现，每次�?�择队头换出，队尾加�?
    always @(*)
    begin
        if (rst)
        begin
            swap_id=0;
            for (integer i=0;i<SET_SIZE;i++)
            begin
                choice[i]=0;
            end
        end
        else
        begin
            swap_id=choice[set_addr];
        end
    end
`endif

`ifdef LRU
integer last_vis[SET_SIZE][WAY_CNT];
integer tim;
reg cmp1,cmp2;

always@(*) begin
    if (rst) begin
        tim = 0;
        for (integer i=0; i < SET_SIZE; i++) begin
            for (integer j=0; j<WAY_CNT; j++) begin
                last_vis[i][j]=0;
            end
        end
    end else begin
        swap_id = 0;
        for (integer i=0; i<WAY_CNT; i++) begin
            cmp1 = last_vis[set_addr][i] <= tim;//通过比较上次访问时间与当前时间的大小判断是否为上�?轮的时间
            cmp2 = last_vis[set_addr][swap_id] <= tim;
            if (cmp1 & ~cmp2) swap_id =i;//上一轮的时间肯定比本轮的时间�?
            else if ((cmp1 & cmp2) | (~cmp1 & ~cmp2))//如果是同�?轮才比较时间戳大�?
            begin
                if (last_vis[set_addr][i] < last_vis[set_addr][swap_id]) begin
                    swap_id = i;
                end
            end
        end
    end
end
`endif

always @ (posedge clk or posedge rst) begin     // ?? cache ???
    if(rst) begin
        cache_stat <= IDLE;
        for(integer i = 0; i < SET_SIZE; i++) begin
            for (integer j=0;j<WAY_CNT;j++) begin
                dirty[i][j] = 1'b0;
                valid[i][j] = 1'b0;
            end
        end
        for(integer k = 0; k < LINE_SIZE; k++)
            mem_wr_line[k] <= 0;
        mem_wr_addr <= 0;
        {mem_rd_tag_addr, mem_rd_set_addr} <= 0;
        rd_data <= 0;
    end else begin
        `ifdef LRU
            tim = (tim == MAX_TIME-1 ? 0 : tim+1);//LRU用的计时器时�?+1,超过范围就归�?
        `endif
        case(cache_stat)
        IDLE:       begin
                        if(cache_hit) begin
                            if(rd_req) begin    // 如果cache命中，并且是读请求，
                                rd_data <= cache_mem[set_addr][vis_id][line_addr];   //则直接从cache中取出要读的数据
                                `ifdef LRU
                                last_vis[set_addr][vis_id]=tim;// 更新时间�?
                                `endif
                            end else if(wr_req) begin // 如果cache命中，并且是写请求，
                                cache_mem[set_addr][vis_id][line_addr] <= wr_data;   // 则直接向cache中写入数�?
                                dirty[set_addr][vis_id] <= 1'b1;                     // 写数据的同时置脏�?
                                `ifdef LRU
                                last_vis[set_addr][vis_id]=tim;// 更新时间�?
                                `endif
                            end 

                            

                        end else begin
                            if(wr_req | rd_req) begin   // 如果 cache 未命中，并且有读写请求，则需要进行换�?
                                if(valid[set_addr][swap_id] & dirty[set_addr][swap_id]) begin    // 如果 要换入的cache line 本来有效，且脏，则需要先将它换出
                                    cache_stat  <= SWAP_OUT;
                                    mem_wr_addr <= {cache_tags[set_addr][swap_id], set_addr};
                                    mem_wr_line <= cache_mem[set_addr][swap_id];
                                end else begin                                   // 反之，不�?要换出，直接换入
                                    cache_stat  <= SWAP_IN;
                                end
                                {mem_rd_tag_addr, mem_rd_set_addr} <= {tag_addr, set_addr};
                            end
                        end
                    end
        SWAP_OUT:   begin
                        if(mem_gnt) begin           // 如果主存握手信号有效，说明换出成功，跳到下一状�??
                            cache_stat <= SWAP_IN;
                        end
                    end
        SWAP_IN:    begin
                        if(mem_gnt) begin           // 如果主存握手信号有效，说明换入成功，跳到下一状�??
                            cache_stat <= SWAP_IN_OK;
                        end
                    end
        SWAP_IN_OK: begin           // 上一个周期换入成功，这周期将主存读出的line写入cache，并更新tag，置高valid，置低dirty
                        for(integer i=0; i<LINE_SIZE; i++)  cache_mem[mem_rd_set_addr][swap_id][i] <= mem_rd_line[i];
                        cache_tags[mem_rd_set_addr][swap_id] <= mem_rd_tag_addr;
                        valid     [mem_rd_set_addr][swap_id] <= 1'b1;
                        dirty     [mem_rd_set_addr][swap_id] <= 1'b0;
                        cache_stat <= IDLE;        // 回到就绪状�??

                        `ifdef FIFO
                            choice[set_addr] <= (choice[set_addr] == WAY_CNT-1 ? 0 : choice[set_addr] + 1);// FIFO只用把队头位置后移一位即�?
                        `endif

                        `ifdef LRU
                            last_vis[set_addr][swap_id] <= tim;// 为新进cache的块的设置时间戳
                        `endif
                    end
        endcase
    end
end

wire mem_rd_req = (cache_stat == SWAP_IN );
wire mem_wr_req = (cache_stat == SWAP_OUT);
wire [   MEM_ADDR_LEN-1 :0] mem_addr = mem_rd_req ? mem_rd_addr : ( mem_wr_req ? mem_wr_addr : 0);

assign miss = (rd_req | wr_req) & ~(cache_hit && cache_stat==IDLE) ;     // �? 有读写请求时，如果cache不处于就�?(IDLE)状�?�，或�?�未命中，则miss=1

main_mem #(     // 主存，每次读写以line 为单�?
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

endmodule
