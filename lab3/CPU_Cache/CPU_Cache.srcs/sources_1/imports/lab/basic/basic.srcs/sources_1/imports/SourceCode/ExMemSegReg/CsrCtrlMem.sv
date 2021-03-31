`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Register Address seg reg
// Tool Versions: Vivado 2017.4.1
// Description: Register address seg reg for ID\EX
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    // ID\EX的寄存器地址段寄存器，包括两个源寄存器和一个目标寄存器的地址
// 输入
    // clk               时钟信号
    // reg1_src_ID       ID阶段的源寄存器1地址
    // reg2_src_ID       ID阶段的源寄存器2地址
    // reg_dest_ID       ID阶段的目标寄存器地址
    // bubbleE           EX阶段的bubble信号
    // flushE            EX阶段的flush信号
// 输出
    // reg1_src_EX       传给下一流水段的源寄存器1地址
    // reg2_src_EX       传给下一流水段的源寄存器2地址
    // reg_dest_EX       传给下一流水段的目标寄存器地址
// 实验要求  
    // 无需修改

module Csr_Ctrl_MEM(
    input wire clk, bubbleM, flushM,
    input wire  csr_reg_en_EX,
    output reg  csr_reg_en_MEM
    );

    initial 
    begin

        csr_reg_en_MEM = 0;
    end
    
    always@(posedge clk)
        if (!bubbleM) 
        begin
            if (flushM)
            begin
                csr_reg_en_MEM <= 0;
            end
            else
            begin
                csr_reg_en_MEM <= csr_reg_en_EX;
            end
        end
    
endmodule