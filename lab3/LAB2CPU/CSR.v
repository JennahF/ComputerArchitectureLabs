`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: General Register
// Tool Versions: Vivado 2017.4.1
// Description: General Register File
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    //  通用寄存器，提供读写端口（同步写，异步读）
    //  时钟下降沿写入
    //  0号寄存器的值始终为0
// 输入
    // clk               时钟信号
    // rst               寄存器重置信号
    // CSR_read_en       CSR读使能
    // CSR_write_en      CSR写使能
    // addr              CSR读地址
    // wb_addr           写回地址
    // wb_data           写回数据
// 输出
    // reg1              reg1读数据


module CSR_RegisterFile (
    input wire clk,
    input wire rst,
    input wire CSR_read_en,
    input wire CSR_write_en,
    input wire [11:0] addr,wb_addr,
    input wire [31:0] wb_data,
    output wire [31:0] reg1
    );

    reg [31:0] CSR[31:1];
    integer i;

    // init CSR
    initial
    begin
        for(i = 1; i < 32; i = i + 1) 
            CSR[i][31:0] <= 32'b0;
    end

    always@(negedge clk or posedge rst) 
    begin 
        if (rst)
            for (i = 1; i < 32; i = i + 1) 
                CSR[i][31:0] <= 32'b0;
        else if(CSR_write_en)
            CSR[wb_addr] <= wb_data;   
    end

    assign reg1 = (CSR_read_en == 0) ? 32'h0 : CSR[addr[4:0]];

endmodule