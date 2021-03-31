`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Write-back Data seg reg
// Tool Versions: Vivado 2017.4.1
// Description: Write-back data seg reg for MEM\WB
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    // MEM\WB的写回寄存器内容
    // 为了数据同步，Data Extension和Data Cache集成在其中
// 输入
    // clk               时钟信号
    // wb_select         选择写回寄存器的数据：如果为0，写回ALU计算结果，如果为1，写回Memory读取的内容
    // load_type         load指令类型
    // write_en          Data Cache写使能
    // debug_write_en    Data Cache debug写使能
    // addr              Data Cache的写地址，也是ALU的计算结果
    // debug_addr        Data Cache的debug写地址
    // in_data           Data Cache的写入数据
    // debug_in_data     Data Cache的debug写入数据
    // bubbleW           WB阶段的bubble信号
    // flushW            WB阶段的flush信号
// 输出
    // debug_out_data    Data Cache的debug读出数据
    // data_WB           传给下一流水段的写回寄存器内容
// 实验要求  
    // 无需修改

module WB_Data_WB(
    input wire clk, bubbleW, flushW,
    input wire wb_select,
    input wire [2:0] load_type,
    input  [3:0] write_en, debug_write_en,
    input  [31:0] addr,
    input  [31:0] debug_addr,
    input  [31:0] in_data, debug_in_data,
    input [31:0] CSR_result_MEM,
    output wire [31:0] debug_out_data,
    output wire [31:0] data_WB,
    output wire [31:0] CSRWB,
    output wire cache_miss
    );

    wire [31:0] data_raw;
    wire [31:0] data_WB_raw;


/*
    DataCache DataCache1(
        .clk(clk),
        .write_en(write_en << addr[1:0]),
        .debug_write_en(debug_write_en),
        .addr(addr[31:2]),
        .debug_addr(debug_addr[31:2]),
        .in_data(in_data << (8 * addr[1:0])),
        .debug_in_data(debug_in_data),
        .out_data(data_raw),
        .debug_out_data(debug_out_data)
    );*/

    cache cache1(
    .clk(clk),
    .rst(flushW),
    .miss(cache_miss),               // 对CPU发出的miss信号
    .addr(addr),        // 读写请求地址
    .rd_req(wb_select==1),             // 读请求信 ???
    .rd_data(data_raw), // 读出的数据， ???次读 ???个word
    .wr_req(|write_en),             // 写请求信 ???
    .wr_data(in_data << (8 * addr[1:0]))      // 要写入的数据，一次写 ???个word
    );

    reg miss1;
    reg miss2;
    reg [31:0] total;
    reg [31:0] miss_times;
    reg rd1,rd2;
    reg wr1,wr2;
    
    always @ (posedge clk or posedge flushW) begin
        if (flushW) begin
            miss1 <= 1'b0;
            miss2 <= 1'b0;
            wr1 <= 1'b0;
            wr2 <= 1'b0;
            rd1 <= 1'b0;
            rd2 <= 1'b0;
        end
        else begin
             miss1 <= cache_miss;
             miss2 <= miss1;
             wr1 <= |write_en;
             wr2 <= wr1;
             rd1 <= wb_select==1;
             rd2 <= rd1;
        end
    end

    always @ (posedge clk or posedge flushW) begin
        if (flushW) begin
            total <= 31'b0;
            miss_times <= 31'b0;
        end
        else begin
            if ((wr1==1'b1 && wr2==1'b0) || (rd1==1'b1 && rd2==1'b0)) total <= total + 1;
            if (miss1 == 1'b1 && miss2 == 1'b0) miss_times <= miss_times + 1;
        end
    end




    // Add flush and bubble support
    // if chip not enabled, output output last read result
    // else if chip clear, output 0
    // else output values from cache

    reg bubble_ff = 1'b0;
    reg flush_ff = 1'b0;
    reg wb_select_old = 0;
    reg [31:0] data_WB_old = 32'b0;
    reg [31:0] addr_old;
    reg [2:0] load_type_old;
    reg [31:0] CSR_result_old;
    reg [31:0] CSRWB_old;

    DataExtend DataExtend1(
        .data(data_raw),
        .addr(addr_old[1:0]),
        .load_type(load_type_old),
        .dealt_data(data_WB_raw)
    );

    always@(posedge clk)
    begin
        bubble_ff <= bubbleW;
        flush_ff <= flushW;
        data_WB_old <= data_WB;
        addr_old <= addr;
        wb_select_old <= wb_select;
        load_type_old <= load_type;
        CSR_result_old <= CSR_result_MEM;
        CSRWB_old <= CSRWB;
    end

    assign data_WB = bubble_ff ? data_WB_old :
                                 (flush_ff ? 32'b0 : 
                                             (wb_select_old ? data_WB_raw :
                                                          addr_old));
    
    assign CSRWB = bubble_ff ? CSRWB_old :
                                (flush_ff ? 32'b0: CSR_result_old);


endmodule