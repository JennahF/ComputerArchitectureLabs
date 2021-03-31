

module cache #(
    parameter  LINE_ADDR_LEN = 3, // line�ڵ�?????���ȣ�������ÿ��line����2^3��word
    parameter  SET_ADDR_LEN  = 3, // ���?????���ȣ�������?????����2^3=8?????
    parameter  TAG_ADDR_LEN  = 6, // tag����
    parameter  WAY_CNT       = 8  // �������ȣ�������ÿ�����ж���·line��������ֱ��ӳ����cache����˸ò���û��?????
)(
    input  clk, rst,
    output miss,               // ��CPU������miss�ź�
    input  [31:0] addr,        // ��д�����ַ
    input  rd_req,             // ��������?????
    output reg [31:0] rd_data, // ���������ݣ�?????�ζ�?????��word
    input  wr_req,             // д������?????
    input  [31:0] wr_data      // Ҫд������ݣ�һ��д?????��word
);

localparam MEM_ADDR_LEN    = TAG_ADDR_LEN + SET_ADDR_LEN ; // ���������ַ���� MEM_ADDR_LEN�������?????=2^MEM_ADDR_LEN��line
localparam UNUSED_ADDR_LEN = 32 - TAG_ADDR_LEN - SET_ADDR_LEN - LINE_ADDR_LEN - 2 ;       // ����δʹ�õĵ�ַ�ĳ�?????

localparam LINE_SIZE       = 1 << LINE_ADDR_LEN  ;         // ���� line ????? word ��������????? 2^LINE_ADDR_LEN ��word ????? line
localparam SET_SIZE        = 1 << SET_ADDR_LEN   ;         // ����?????���ж����飬????? 2^SET_ADDR_LEN ����

reg [            31:0] cache_mem    [SET_SIZE][WAY_CNT][LINE_SIZE]; // SET_SIZE��line��ÿ��line��LINE_SIZE��word
reg [TAG_ADDR_LEN-1:0] cache_tags   [SET_SIZE][WAY_CNT];            // SET_SIZE��TAG
reg                    valid        [SET_SIZE][WAY_CNT];            // SET_SIZE��valid(��Ч?????)
reg                    dirty        [SET_SIZE][WAY_CNT];            // SET_SIZE��dirty(��λ)
reg [     WAY_CNT-1:0]      way_addr;    //���cache_hit,��¼���Ǹ�·hit?????
reg [     WAY_CNT-1:0]      hit_info;    //

wire [        WAY_CNT-1:0]      switch_addr; //missʱ��Ҫ�����룬��Ҫ���Ȼ����ٻ���ĵ�?????
wire [              2-1:0]   word_addr;                   // �������?????addr��ֳ���5����?????
wire [  LINE_ADDR_LEN-1:0]   line_addr;
wire [   SET_ADDR_LEN-1:0]    set_addr;
wire [   TAG_ADDR_LEN-1:0]    tag_addr;
wire [UNUSED_ADDR_LEN-1:0] unused_addr;

enum  {IDLE, SWAP_OUT, SWAP_IN, SWAP_IN_OK} cache_stat;    // cache ״???����״̬��?????
                                                           // IDLE���������SWAP_OUT�������ڻ�����SWAP_IN�������ڻ��룬SWAP_IN_OK����������һ���ڵ�д��cache����?????

reg  [   SET_ADDR_LEN-1:0] mem_rd_set_addr = 0;
reg  [   TAG_ADDR_LEN-1:0] mem_rd_tag_addr = 0;
reg  [        WAY_CNT-1:0] mem_rd_switch_addr = 0;
wire [   MEM_ADDR_LEN-1:0] mem_rd_addr = {mem_rd_tag_addr, mem_rd_set_addr};
reg  [   MEM_ADDR_LEN-1:0] mem_wr_addr = 0;

reg  [31:0] mem_wr_line [LINE_SIZE];
wire [31:0] mem_rd_line [LINE_SIZE];

wire mem_gnt;      // ������Ӧ��д��������?????

assign {unused_addr, tag_addr, set_addr, line_addr, word_addr} = addr;  // ��� 32bit ADDR

reg cache_hit = 1'b0;

always @ (*) begin              // �ж� �����address �Ƿ�????? cache ����?????
    for (integer i = 0; i < WAY_CNT; i = i+1) begin
        if (valid[set_addr][i] && cache_tags[set_addr][i] == tag_addr) begin
            hit_info[i] <= 1'b1;
        end 
        else begin
            hit_info[i] <= 1'b0;
        end
    end
end

always @ (*) begin
    if (hit_info) cache_hit = 1'b1;
    else cache_hit = 1'b0;
end

always @ (*) begin
    case (hit_info) 
        8'd1: way_addr = 4'd0;
        8'd2: way_addr = 4'd1;
        8'd4: way_addr = 4'd2;
        8'd8: way_addr = 4'd3;
        8'd16: way_addr = 4'd4;
        8'd32: way_addr = 4'd5;
        8'd64: way_addr = 4'd6;
        8'd128: way_addr = 4'd7;
        10'd256: way_addr = 4'd8;
        10'd512: way_addr = 4'd9;
        default: way_addr = 4'd0;
    endcase
end

always @ (posedge clk or posedge rst) begin     // ?? cache ???
    if(rst) begin
        cache_stat <= IDLE;
        for(integer i = 0; i < SET_SIZE; i++) begin
            for (integer j = 0; j < WAY_CNT; j++) begin
                dirty[i][j] = 1'b0;
                valid[i][j] = 1'b0;
            end
        end
        for(integer k = 0; k < LINE_SIZE; k++)
            mem_wr_line[k] <= 0;
        mem_wr_addr <= 0;
        {mem_rd_tag_addr, mem_rd_set_addr, mem_rd_switch_addr} <= 0;
        rd_data <= 0;
    end else begin
        case(cache_stat)
        IDLE:       begin
                        if(cache_hit) begin
                            if(rd_req) begin    // ���cache���У������Ƕ�����
                                rd_data <= cache_mem[set_addr][way_addr][line_addr];   //��ֱ�Ӵ�cache��ȡ��Ҫ��������
                            end else if(wr_req) begin // ���cache���У�������д����
                                cache_mem[set_addr][way_addr][line_addr] <= wr_data;   // ��ֱ����cache��д����?????
                                dirty[set_addr][way_addr] <= 1'b1;                     // д���ݵ�ͬʱ����?????
                            end 
                        end else begin
                            if(wr_req | rd_req) begin   // ��� cache δ���У������ж�д��������Ҫ���л�?????
                                if(valid[set_addr][switch_addr] & dirty[set_addr][switch_addr]) begin    // ��� Ҫ�����cache line ������Ч�����࣬����Ҫ�Ƚ�������
                                    cache_stat  <= SWAP_OUT;
                                    mem_wr_addr <= {cache_tags[set_addr][switch_addr], set_addr};
                                    mem_wr_line <= cache_mem[set_addr][switch_addr];
                                end else begin                                   // ��֮����?????Ҫ������ֱ�ӻ���
                                    cache_stat  <= SWAP_IN;
                                end
                                {mem_rd_tag_addr, mem_rd_set_addr, mem_rd_switch_addr} <= {tag_addr, set_addr, switch_addr};
                            end
                        end
                    end
        SWAP_OUT:   begin
                        if(mem_gnt) begin           // ������������ź���Ч��˵�������ɹ���������һ״???
                            cache_stat <= SWAP_IN;
                        end
                    end
        SWAP_IN:    begin
                        if(mem_gnt) begin           // ������������ź���Ч��˵������ɹ���������һ״???
                            cache_stat <= SWAP_IN_OK;
                        end
                    end
        SWAP_IN_OK: begin           // ��һ�����ڻ���ɹ��������ڽ����������lineд��cache��������tag���ø�valid���õ�dirty
                        for(integer i=0; i < LINE_SIZE; i++)  cache_mem[mem_rd_set_addr][mem_rd_switch_addr][i] <= mem_rd_line[i];
                        cache_tags[mem_rd_set_addr][mem_rd_switch_addr] <= mem_rd_tag_addr;
                        valid     [mem_rd_set_addr][mem_rd_switch_addr] <= 1'b1;
                        dirty     [mem_rd_set_addr][mem_rd_switch_addr] <= 1'b0;
                        cache_stat <= IDLE;        // �ص�����״???
                    end
        endcase
    end
end

wire mem_rd_req = (cache_stat == SWAP_IN);
wire mem_wr_req = (cache_stat == SWAP_OUT);
wire [   MEM_ADDR_LEN-1 :0] mem_addr = mem_rd_req ? mem_rd_addr : ( mem_wr_req ? mem_wr_addr : 0);

assign miss = (rd_req | wr_req) & ~(cache_hit && cache_stat==IDLE) ;     // ????? �ж�д����ʱ�����cache�����ھ�?????(IDLE)״???����???δ���У���miss=1

main_mem #(     // ���棬ÿ�ζ�д��line Ϊ��?????
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

//FIFO
reg [WAY_CNT-1:0] FIFOQ [SET_SIZE][WAY_CNT];
reg [WAY_CNT-1:0] FIFOfront [SET_SIZE];
reg [WAY_CNT-1:0] FIFOrear [SET_SIZE];
reg [WAY_CNT-1:0] FIFO_addr;
reg count;
reg [WAY_CNT-1:0] Empty;

initial begin
    for (integer i = 0;i < SET_SIZE;i++) begin
        FIFOrear[i] = 0;
        FIFOfront[i] = 0;
    end
end

always @ (*) begin
    if (cache_stat == SWAP_IN_OK) begin //�����ˣ����»���ĵ�??�������
        FIFOQ[mem_rd_set_addr][FIFOrear[mem_rd_set_addr]] = mem_rd_switch_addr;
        FIFOrear[mem_rd_set_addr] = (FIFOrear[mem_rd_set_addr] + 1) % WAY_CNT;
    end
    else if (cache_stat == IDLE && !cache_hit && (wr_req | rd_req)) begin //miss����??
        count = 1'b0;
        for (integer i = 0;i < WAY_CNT;i++) begin
            Empty[i] = 1'b0;
            if (count == 1'b0 && valid[set_addr][i] == 0) begin
                count = 1'b1;
                Empty[i] = 1'b1;
            end
        end
        if (count == 1'b1) begin
            case (Empty) 
                8'd1: FIFO_addr = 4'd0;
                8'd2: FIFO_addr = 4'd1;
                8'd4: FIFO_addr = 4'd2;
                8'd8: FIFO_addr = 4'd3;
                8'd16: FIFO_addr = 4'd4;
                8'd32: FIFO_addr = 4'd5;
                8'd64: FIFO_addr = 4'd6;
                8'd128: FIFO_addr = 4'd7;
                10'd256: FIFO_addr = 4'd8;
                10'd512: FIFO_addr = 4'd9;
                default: FIFO_addr = 4'd0;
            endcase
        end 
        else begin
            FIFO_addr = FIFOQ[set_addr][FIFOfront[set_addr]];
            if (FIFOfront[set_addr] != FIFOrear[set_addr]) FIFOfront[set_addr] = (FIFOfront[set_addr] + 1) % WAY_CNT;
        end
    end
end

//LRU
reg [31:0] LRUCNT [SET_SIZE][WAY_CNT];
reg [WAY_CNT-1:0] LRU_addr;
reg [WAY_CNT-1:0] temp;

initial begin
    for (integer i = 0;i < SET_SIZE;i++) begin
        for (integer j = 0;j < WAY_CNT;j++) begin
            LRUCNT[i][j] = 7'b0;
        end
    end
    temp = 0;
end

integer max;
integer index;
always @ (posedge clk or posedge rst) begin
    if (rst) begin
        for (integer i = 0;i < SET_SIZE;i++) begin
            for (integer j = 0;j < WAY_CNT;j++) begin
                LRUCNT[i][j] = 7'b0;
            end
        end
    end
    else begin
        for (integer i = 0;i < SET_SIZE;i++) begin
            for (integer j = 0;j < WAY_CNT;j++) begin
                LRUCNT[i][j] = LRUCNT[i][j] + 7'b1;
            end
        end
        max = 0;
        for (integer i = 0;i < WAY_CNT;i++) begin
            if (max < LRUCNT[set_addr][i]) begin
                max = LRUCNT[set_addr][i];
                for (integer j = 0;j < WAY_CNT;j++) temp[j] = 1'b0;
                temp[i] = 1'b1;
            end
        end
        if (cache_stat == SWAP_IN_OK) begin //�»����
            LRUCNT[mem_rd_set_addr][mem_rd_switch_addr] = 7'b0;
        end
        else if (cache_stat == IDLE && cache_hit) begin //hit
            LRUCNT[set_addr][way_addr] = 7'b0;
        end
    end
end

always @ (*) begin
    case (temp) 
        8'd1: LRU_addr = 4'd0;
        8'd2: LRU_addr = 4'd1;
        8'd4: LRU_addr = 4'd2;
        8'd8: LRU_addr = 4'd3;
        8'd16: LRU_addr = 4'd4;
        8'd32: LRU_addr = 4'd5;
        8'd64: LRU_addr = 4'd6;
        8'd128: LRU_addr = 4'd7;
        10'd256: LRU_addr = 4'd8;
        10'd512: LRU_addr = 4'd9;
        default: LRU_addr = 4'd0;
    endcase
end

assign switch_addr = LRU_addr;

endmodule





