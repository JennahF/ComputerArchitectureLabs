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
    // 为了数据同步，Data Extension和Data Cache集成在其�???
// 输入
    // clk               时钟信号
    // wb_select         选择写回寄存器的数据：如果为0，写回ALU计算结果，如果为1，写回Memory读取的内�???
    // load_type         load指令类型
    // write_en          Data Cache写使�???
    // debug_write_en    Data Cache debug写使�???
    // addr              Data Cache的写地址，也是ALU的计算结�???
    // debug_addr        Data Cache的debug写地�???
    // in_data           Data Cache的写入数�???
    // debug_in_data     Data Cache的debug写入数据
    // bubbleW           WB阶段的bubble信号
    // flushW            WB阶段的flush信号
// 输出
    // debug_out_data    Data Cache的debug读出数据
    // data_WB           传给下一流水段的写回寄存器内�???
// 实验要求  
    // 无需修改

module WB_Data_WB
    #(
    parameter  LINE_ADDR_LEN = 3, //line内地�???的长度，决定了每个line具有2^3=8个word
    parameter  SET_ADDR_LEN  = 2, //组地�???的长度，决定了一共有2^2=4个组
    parameter  TAG_ADDR_LEN  = 7, //tag的长�???
    parameter  WAY_LEN       = 2,
    parameter  WAY_CNT     = 4 
    )
    (
    input wire clk, bubbleW, flushW,
    input wire wb_select,
    input wire [2:0] load_type,
    input  [3:0] write_en, debug_write_en,
    input  [31:0] addr,
    input  [31:0] debug_addr,
    input  [31:0] in_data, debug_in_data,
    output wire [31:0] debug_out_data,
    output wire [31:0] data_WB,
    output wire miss,
    output reg [31:0]misstimes,
    output reg [31:0]accesstimes
    );

    wire [31:0] data_raw;
    wire [31:0] data_WB_raw;


    reg miss1,miss2;
    wire missup;

    reg rd1,rd2;
    reg wd1,wd2;
    wire accessup;


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
    );
*/



    // new cache by myself in lab3

    wire rd_req;
    wire wr_req;
    assign wr_req=|write_en;
    assign rd_req=(wb_select==1'b1)?1'b1:1'b0;

    assign debug_out_data=32'd0;


    cache DataCache1(
        .clk(clk),
        .rst(rst),
        .miss(cache_miss),
        .addr(addr),
        .rd_req(wb_select==1),
        .rd_data(data_raw),
        .wr_req(|write_en),
        .wr_data(in_data)
    );



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
    end

    assign data_WB = bubble_ff ? data_WB_old :
                                 (flush_ff ? 32'b0 : 
                                             (wb_select_old ? data_WB_raw :
                                                          addr_old));



    // count miss times
    always@(posedge clk or posedge flushW)
    begin
        if ( !flushW ) begin
            miss1<=miss2;
            miss2<=miss;
        end else begin
            miss1<=1'b0;
            miss2<=1'b0;
        end
    end

    assign missup=((miss1==1'b1)&&(miss2==1'b0))?1'b1:1'b0;

    always@(posedge clk or posedge flushW)
    begin
        if ( !flushW ) begin
            if ( missup ) begin
                misstimes<=misstimes+1'b1;
            end else begin
                misstimes<=misstimes;
            end
        end else begin
            misstimes<=32'd0;
        end
    end

    always@(posedge clk or posedge flushW)
    begin
        if ( !flushW ) begin
            rd1<=rd2;
            rd2<=rd_req;
        end else begin
            rd1<=1'b0;
            rd2<=1'b0;
        end
    end

    always@(posedge clk or posedge flushW)
    begin
        if ( !flushW ) begin
            wd1<=wd2;
            wd2<=wr_req;
        end else begin
            wd1<=1'b0;
            wd2<=1'b0;
        end
    end

    assign accessup=(((rd1==1'b1)&&(rd2==1'b0))||((wd1==1'b1)&&(wd2==1'b0)))?1'b1:1'b0;

    always@(posedge clk or posedge flushW)
    begin
        if ( !flushW ) begin
            if ( accessup ) begin
                accesstimes<=accesstimes+1'b1;
            end else begin
                accesstimes<=accesstimes;
            end
        end else begin
            accesstimes<=32'd0;
        end
    end

    
endmodule