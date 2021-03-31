`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: NPC Generator
// Tool Versions: Vivado 2017.4.1
// Description: RV32I Next PC Generator
// 
//////////////////////////////////////////////////////////////////////////////////


//  功能说明
    //  根据跳转信号，决定执行的下一条指令地�?
    //  debug端口用于simulation时批量写入数据，可以忽略
// 输入
    // PC                指令地址（PC + 4, 而非PC�?
    // jal_target        jal跳转地址
    // jalr_target       jalr跳转地址
    // br_target         br跳转地址
    // jal               jal == 1时，有jal跳转
    // jalr              jalr == 1时，有jalr跳转
    // br                br == 1时，有br跳转
// 输出
    // NPC               下一条执行的指令地址
// 实验要求  
    // 实现NPC_Generator

module NPC_Generator (
    input clk,
    input wire [31:0] PC, jal_target, jalr_target, br_target,//
    input wire jal, jalr, br,//
    input wire IsBr_EX,//
    input wire BTB_hit_EX,//
    input wire BufferWrite,//
    input wire BufferDelete,//
    input [31:0] Br_Target,//
    input wire flushF,bubbleF,//
    input [31:0] PCE,//
    output reg [31:0] NPC,//
    output wire BTB_hit//
    );
    
    wire [31:0] BTB_NPC;
    wire BTB_fail;

    always@ (*) begin
        if (br == 1 && BTB_fail) NPC <= br_target;//ûhit��taken
        else if (br == 0 && BTB_fail) NPC <= PCE; //hit��not taken
        else if (jalr == 1) NPC <= jalr_target;
        else if (jal == 1) NPC <= jal_target;
        else if (BTB_hit) NPC <= BTB_NPC; 
        else NPC <= PC + 4;
    end
    
    BTB BTB_inst(
        .clk(clk),//
        .br(br),
        .Br_Target(br_target),//
        .flushF(flushF),
        .bubbleF(bubbleF),//
        .PCE(PCE),//
        .PC(PC),
        .BufferWrite(BufferWrite),//
        .BufferDelete(BufferDelete),//
        .BTB_hit(BTB_hit),//
        .BTB_NPC(BTB_NPC),
        .BTB_fail(BTB_fail),
        .BTB_hit_EX(BTB_hit_EX),
        .IsBr_EX(IsBr_EX),
        .jalr(jalr),
        .jal(jal)
    );

endmodule