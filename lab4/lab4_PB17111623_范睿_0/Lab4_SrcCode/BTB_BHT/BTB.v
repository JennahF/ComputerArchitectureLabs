`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/20 19:50:51
// Design Name: 
// Module Name: BTB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BTB #(
    parameter BUFFER_SIZE = 4096,
    parameter ADDR_LEN = 12
)(
    //IF段数据
    input clk,//
    input wire flushF,bubbleF,//
    input [31:0] PC,
    
    //EX段数据
    input [31:0] PCE,//
    input br,
    input wire jump_EX,
    input wire IsBr_EX,
    input [31:0] Br_Target,//
    //BTB更改信号
    input wire BufferWrite,//
    input wire BufferDelete,//
    input wire jalr,
    input wire jal,
    input [2:0] br_type_EX,
    
    output reg BTB_hit,//
    output reg [31:0]BTB_NPC,
    output wire BTB_fail,
    output wire jump
    );
    
    reg [31-ADDR_LEN:0] BTBuffer_PC [BUFFER_SIZE-1:0];
    reg [31:0] BTBuffer_NPC [BUFFER_SIZE-1:0];
    reg BTBuffer_tag [BUFFER_SIZE-1:0];
    reg BTBuffer_valid [BUFFER_SIZE-1:0];
    wire [ADDR_LEN-1:0] PC_ADDR;
    wire [ADDR_LEN-1:0] oldPC_ADDR;
    wire BTB_jump;
    wire BHT_jump;
    
    reg [31:0] pre_count;
    reg [31:0] br_count;
    reg [31:0] fail_count;
    reg [31:0] NoPreFail_count;
    
    initial begin
        pre_count <= 32'b0;
        br_count <= 32'b0;
        fail_count <= 32'b0;
        NoPreFail_count <= 32'b0;
    end
    
    always@ (posedge clk) begin
        if (jump && !BTB_fail && !jalr && !jal) pre_count <= pre_count + 1;
        if (/*IsBr_EX*/br_type_EX != 3'b0 && !bubbleF) br_count <= br_count + 1; 
        if (BTB_fail) fail_count <= fail_count + 1;
        if (BTB_fail && br) NoPreFail_count <= NoPreFail_count + 1;
    end
        
    assign PC_ADDR = PC[ADDR_LEN-1:0];
    assign oldPC_ADDR = PCE[ADDR_LEN-1:0] - 4;
    assign BTB_fail = (jump_EX == 1 && IsBr_EX == 1 && br == 0) ||
                        (jump_EX == 0 && IsBr_EX == 1 && br == 1) ||
                            (jump_EX == 1 && IsBr_EX == 0);
    assign jump = BTB_hit && BHT_jump;
    assign BTB_jump = BTB_hit && BTBuffer_valid[PC_ADDR];
    
    integer k;
    initial begin
        for (k = 0;k < BUFFER_SIZE;k = k + 1) begin
            BTBuffer_PC[k] <= 32'b0;
            BTBuffer_NPC[k] <= 32'b0;
            BTBuffer_tag[k] <= 1'b0;
            BTBuffer_valid[k] <= 1'b0;
        end
    end
   
   
        integer i;
        integer flag;
        always@(*) begin 
            if (!flushF && BTBuffer_PC[PC_ADDR] == PC[31:ADDR_LEN] && BTBuffer_valid[PC_ADDR]) begin
                BTB_hit = 1'b1;
                BTB_NPC = BTBuffer_NPC[PC_ADDR];
            end 
            else begin
                BTB_hit = 1'b0;
                BTB_NPC = 31'b0;
            end
        end
        integer j;
        integer flag1;
        always@(posedge clk) begin
            if (!bubbleF) begin
            if (flushF) begin
                for (j = 0;j < BUFFER_SIZE;j = j + 1) begin
                    BTBuffer_PC[j] <= 22'b0;
                    BTBuffer_NPC[j] <= 32'b0;
                    BTBuffer_valid[j] <= 1'b0;
                end
            end
            else begin
                if (BufferWrite /*&& br*/) begin
                    BTBuffer_PC[oldPC_ADDR] = PCE[31:ADDR_LEN];
                    BTBuffer_NPC[oldPC_ADDR] = Br_Target;
                    BTBuffer_valid[oldPC_ADDR] = 1'b1;
                end
                /*else if (BufferDelete) begin
                    if (BTBuffer_PC[oldPC_ADDR] == PCE[31:ADDR_LEN]) begin
                        BTBuffer_valid[oldPC_ADDR] = 1'b0;
                    end
                end*/
            end
            end
        end
        
    BHT BHT1(
        .clk(clk),
        .flushF(flushF),
        .bubbleF(bubbleF),
        .PC(PC),
        .PCE(PCE),
        .br(br),
        .IsBr_EX(IsBr_EX),
        .BHT_jump(BHT_jump)
        );
    
endmodule
