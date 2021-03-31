`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Branch Decision
// Tool Versions: Vivado 2017.4.1
// Description: Decide whether to branch
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    //  判断是否branch
// 输入
    // reg1               寄存�?1
    // reg2               寄存�?2
    // br_type            branch类型
// 输出
    // br                 是否branch
// 实验要求
    // 补全模块

`include "Parameters.v"   
module BranchDecision(
    input wire [31:0] reg1, reg2,
    input wire [2:0] br_type,
    output reg br
    );

    always@(reg1 or reg2 or br_type)
    begin
        case (br_type)
            `NOBRANCH: 
                br=0;
            `BEQ:
                br=(reg1==reg2)?1:0;
            `BNE:
                br=(reg1==reg2)?0:1;
            `BLT:
                br=($signed(reg1)<$signed(reg2))?1:0;
            `BLTU:
                br=(reg1<reg2)?1:0;
            `BGE:
                br=($signed(reg1)>=$signed(reg2))?1:0;
            `BGEU: 
                br=(reg1>=reg2)?1:0;
            default: 
                br=0;
        endcase
    end
    // TODO: Complete this module

endmodule
