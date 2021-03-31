`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/29 15:59:28
// Design Name: 
// Module Name: fifo
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


module fifo #(
    parameter  LINE_ADDR_LEN = 3, // line内地�????长度，决定了每个line具有2^3个word
    parameter  SET_ADDR_LEN  = 3, // 组地�????长度，决定了�????共有2^3=8�????
    parameter  TAG_ADDR_LEN  = 6, // tag长度
    parameter  WAY_LEN       = 2,  // 组相连度，决定了每组中有多少路line，这里是直接映射型cache，因此该参数没用�????
    parameter  WAY_CNT       = 4
)(

    input  clk, rst,
    input  [  SET_ADDR_LEN-1:0]set_addr,
    input  [  WAY_LEN-1:0]way_addr,  
    input  way_rst_en,     
    output  reg[  WAY_LEN-1:0]swap_addr
);



localparam SET_SIZE    = 1 << SET_ADDR_LEN; 
reg          [WAY_LEN-1:0] cnt[SET_SIZE];


always@(posedge clk or posedge rst)
begin
            for (integer i = 0 ;i < SET_SIZE;i++)begin

                            if(rst)
                            begin
                                cnt[i]<=2'd0;
                            end
                            
                            else 
                                begin
                                    if(way_rst_en&&(i==set_addr))
                                        cnt[i]<=cnt[i]+1'b1;
                                    else    
                                        cnt[i]<=cnt[i];
                                end

            end
end

always@(*)
begin
    swap_addr=cnt[set_addr];
end
endmodule
