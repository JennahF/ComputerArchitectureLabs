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
    parameter BUFFER_SIZE = 1024,
    parameter ADDR_LEN = 10
)(
    input clk,//
    input br,
    input [31:0] Br_Target,//
    input wire flushF,bubbleF,//
    input [31:0] PCE,//
    input [31:0] PC,
    input wire BTB_hit_EX,
    input wire IsBr_EX,
    input wire BufferWrite,//
    input wire BufferDelete,//
    input wire jalr,
    input jal,
    output reg BTB_hit,//
    output reg [31:0]BTB_NPC,
    output wire BTB_fail
    );
    
    reg [31-ADDR_LEN:0] BTBuffer_PC [BUFFER_SIZE-1:0];
    reg [31:0] BTBuffer_NPC [BUFFER_SIZE-1:0];
    reg BTBuffer_tag [BUFFER_SIZE-1:0];
    reg BTBuffer_valid [BUFFER_SIZE-1:0];
    wire [ADDR_LEN-1:0] PC_ADDR;
    wire [ADDR_LEN-1:0] oldPC_ADDR;
    reg [31:0] br_times;
    reg [31:0] pred_times;
    reg [31:0] fail_times;
    reg [31:0] NoPreFail_times;
        
    assign PC_ADDR = PC[ADDR_LEN-1:0];
    assign oldPC_ADDR = PCE[ADDR_LEN-1:0] - 4;
    assign BTB_fail = (BTB_hit_EX == 1 && IsBr_EX == 1 && br == 0) ||
                        (BTB_hit_EX == 0 && IsBr_EX == 1 && br == 1) ||
                            (BTB_hit_EX == 1 && IsBr_EX == 0);
    
    integer k;
    initial begin
        for (k = 0;k < BUFFER_SIZE;k = k + 1) begin
            BTBuffer_PC[k] <= 32'b0;
            BTBuffer_NPC[k] <= 32'b0;
            BTBuffer_tag[k] <= 1'b0;
            BTBuffer_valid[k] <= 1'b0;
        end
        br_times = 0;
        pred_times = 0;
        fail_times = 0;
        NoPreFail_times = 0;
    end
    
    always@(posedge clk)begin
        if (BTB_fail) fail_times = fail_times + 1;
        if (BTB_hit && !BTB_fail && !jal && !jalr) pred_times = pred_times + 1;
        if (IsBr_EX && !bubbleF) br_times = br_times + 1;
        if (BTB_fail && br) NoPreFail_times = NoPreFail_times + 1;
    end
   
   
        integer i;
        integer flag;
        always@(*) begin 
            if (!flushF && BTBuffer_valid[PC_ADDR] == 1'b1 && BTBuffer_PC[PC_ADDR] == PC[31:ADDR_LEN]) begin
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
                if (BufferWrite && br) begin
                    BTBuffer_PC[oldPC_ADDR] = PCE[31:ADDR_LEN];
                    BTBuffer_NPC[oldPC_ADDR] = Br_Target;
                    BTBuffer_valid[oldPC_ADDR] = 1'b1;
                end
                else if (BufferDelete) begin
                    if (BTBuffer_PC[oldPC_ADDR] == PCE[31:ADDR_LEN]) begin
                        BTBuffer_valid[oldPC_ADDR] = 1'b0;
                    end
                end
            end
            end
        end
        

    
endmodule
