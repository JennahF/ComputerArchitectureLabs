`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: ALU
// Tool Versions: Vivado 2017.4.1
// Description: Arithmetic and logic computation module
// 
//////////////////////////////////////////////////////////////////////////////////

//  功能说明
    //  算数运算和逻辑运算功能部件
// 输入
    // op1               第一个操作数,rs1 or imm值
    // op2               第二个操作数,csr
    // ALU_func          运算类型
// 输出
    // ALU_out           运算结果
// 实验要求
    // 补全模块

`include "Parameters.v"   
module csrALU(
    input wire [31:0] csr_op1,
    input wire [31:0] csr_op2,
    input wire [1:0]  csr_func,
    output reg [31:0] csr_out
    );

    // TODO: Complete this module
    always@(csr_op1 or csr_op2 or csr_func)
    case (csr_func)
        `RW: csr_out=csr_op1;
        `RS: csr_out=csr_op1|csr_op2;
        `RC: csr_out=(~csr_op1)&csr_op2;
        default:csr_out=0;

    endcase 

endmodule
