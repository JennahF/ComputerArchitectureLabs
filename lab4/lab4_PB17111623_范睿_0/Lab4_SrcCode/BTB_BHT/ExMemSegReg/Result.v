`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Computation Result Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: Computation result seg reg for EX\MEM
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    // EX\MEM的运算结果段寄存器，可能是ALU运算结果或PC�?
// 输入
    // clk               时钟信号
    // result            ALU运算结果或PC�?
    // bubbleM           MEM阶段的bubble信号
    // flushM            MEM阶段的flush信号
// 输出
    // result_MEM       传给下一流水段的目标寄存器地�?
// 实验要求  
    // 无需修改

module Result_MEM(
    input wire clk, bubbleM, flushM,
    input wire [31:0] result,
    input wire [31:0] CSR_result,
    output reg [31:0] result_MEM,
    output reg [31:0] CSR_result_MEM
    );

    initial result_MEM = 0;
    
    always@(posedge clk)
        if (!bubbleM) 
        begin
            if (flushM) begin
                result_MEM <= 32'h0;
                CSR_result_MEM <= 32'h0;
            end
            else begin
                result_MEM <= result;
                CSR_result_MEM <= CSR_result;
            end
        end
    
endmodule