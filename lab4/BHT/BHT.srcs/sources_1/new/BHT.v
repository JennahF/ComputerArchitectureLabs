`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/21 10:17:43
// Design Name: 
// Module Name: BHT
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


module BHT #(
    parameter N = 4096,
    parameter ADDR_LEN = 12
)(
    input clk,
    input flushF,bubbleF,
    input [31:0]PC,
    input [31:0]PCE,
    input br,
    input IsBr_EX,
    output reg BHT_jump
    );
    
    reg [1:0] BHT[N-1:0];
    wire [ADDR_LEN-1:0] PC_ADDR;
    wire [ADDR_LEN-1:0] oldPC_ADDR;
    
    assign PC_ADDR = PC[ADDR_LEN-1:0];
    assign oldPC_ADDR = PCE[ADDR_LEN-1:0]-4;
    
    integer i;
    initial begin
        for (i = 0;i < N;i = i+1) begin
            BHT[i] <= 2'b0;
        end
    end
    
    always @ (*) begin
        if (!bubbleF) begin
            if (!flushF && BHT[PC_ADDR][1] == 1'b1) BHT_jump <= 1'b1;
            else BHT_jump <= 1'b0;
        end        
    end
    
    always @ (posedge clk) begin
        if (!bubbleF && !flushF && IsBr_EX) begin
            case ({BHT[oldPC_ADDR],br}) 
                3'b000: BHT[oldPC_ADDR] <= BHT[oldPC_ADDR];
                3'b001: BHT[oldPC_ADDR] <= 2'b01;
                3'b010: BHT[oldPC_ADDR] <= 2'b00;
                3'b011: BHT[oldPC_ADDR] <= 2'b11;
                3'b100: BHT[oldPC_ADDR] <= 2'b00;
                3'b101: BHT[oldPC_ADDR] <= 2'b11;
                3'b110: BHT[oldPC_ADDR] <= 2'b10;
                3'b111: BHT[oldPC_ADDR] <= BHT[oldPC_ADDR];
            endcase
        end
    end
    
endmodule
