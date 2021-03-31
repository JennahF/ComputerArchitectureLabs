`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Operator 1 Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: Operator 1 Seg Reg for ID\EX
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    // ID\EX的操作数1段寄存器
// 输入
    // clk               时钟信号
    // reg1              General Register File读取的寄存器1内容
    // bubbleE           EX阶段的bubble信号
    // flushE            EX阶段的flush信号
// 输出
    // reg1_EX           传给下一流水段的寄存�?1内容
// 实验要求  
    // 无需修改

module Op1_EX(
    input wire clk, bubbleE, flushE,
    input wire [31:0] reg1,
    input wire [31:0] CSR_reg1,
    input wire op1_src,
    output reg [31:0] reg1_EX,
    output reg [31:0] CSR_reg1_EX
    );

    initial begin 
        reg1_EX = 0;
        CSR_reg1_EX = 0;
    end
    
    always@(posedge clk)
        if (!bubbleE) 
        begin
            if (flushE) begin
                reg1_EX <= 0;
                CSR_reg1_EX <= 0;
            end
            else begin
                if (op1_src) reg1_EX <= reg1;
                else reg1_EX <= CSR_reg1;
                CSR_reg1_EX <= CSR_reg1;
            end
        end
    
endmodule