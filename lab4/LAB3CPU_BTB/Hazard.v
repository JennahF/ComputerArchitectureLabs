`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Hazard Module
// Tool Versions: Vivado 2017.4.1
// Description: Hazard Module is used to control flush, bubble and bypass
// 
//////////////////////////////////////////////////////////////////////////////////

//  功能说明
    //  识别流水线中的数据冲突，控制数据转发，和flush、bubble信号
// 输入
    // rst               CPU的rst信号
    // reg1_srcD         ID阶段的源reg1地址
    // reg2_srcD         ID阶段的源reg2地址
    // reg1_srcE         EX阶段的源reg1地址
    // reg2_srcE         EX阶段的源reg2地址
    // reg_dstE          EX阶段的目的reg地址
    // reg_dstM          MEM阶段的目的reg地址
    // reg_dstW          WB阶段的目的reg地址
    // br                是否branch
    // jalr              是否jalr
    // jal               是否jal
    // src_reg_en        指令中的源reg1和源reg2地址是否有效
    // wb_select         写回寄存器的值的来源（Cache内容或�?�ALU计算结果�??
    // reg_write_en_MEM  MEM阶段的寄存器写使能信�??
    // reg_write_en_WB   WB阶段的寄存器写使能信�??
    // alu_src1          ALU操作�??1来源�??0表示来自reg1�??1表示来自PC
    // alu_src2          ALU操作�??2来源�??2’b00表示来自reg2�??2'b01表示来自reg2地址�??2'b10表示来自立即�??
// 输出
    // flushF            IF阶段的flush信号
    // bubbleF           IF阶段的bubble信号
    // flushD            ID阶段的flush信号
    // bubbleD           ID阶段的bubble信号
    // flushE            EX阶段的flush信号
    // bubbleE           EX阶段的bubble信号
    // flushM            MEM阶段的flush信号
    // bubbleM           MEM阶段的bubble信号
    // flushW            WB阶段的flush信号
    // bubbleW           WB阶段的bubble信号
    // op1_sel           ALU的操作数1来源�??2'b00表示来自ALU转发数据�??2'b01表示来自write back data转发�??2'b10表示来自PC�??2'b11表示来自reg1
    // op2_sel           ALU的操作数2来源�??2'b00表示来自ALU转发数据�??2'b01表示来自write back data转发�??2'b10表示来自reg2地址�??2'b11表示来自reg2或立即数
    // reg2_sel          reg2的来�??
// 实验要求
    // 补全模块


module HarzardUnit(
    input wire rst,
    input wire [4:0] reg1_srcD, reg2_srcD, reg1_srcE, reg2_srcE, reg_dstE, reg_dstM, reg_dstW,
    input wire br, jalr, jal,
    input wire [1:0] src_reg_en,
    input wire wb_select,
    input wire wb_select_MEM,
    input wire reg_write_en_MEM,
    input wire reg_write_en_WB,
    input wire alu_src1,
    input wire [1:0] alu_src2,
    input wire CSR_type,
    input wire cache_miss,
    input wire [2:0] br_type,
    input wire IsBr,
    input wire BTB_hit,
    output reg flushF, bubbleF, flushD, bubbleD, flushE, bubbleE, flushM, bubbleM, flushW, bubbleW,
    output reg [1:0] op1_sel, op2_sel, reg2_sel,
    output reg [1:0] CSR_op2_sel,
    output reg BufferWrite,
    output reg BufferDelete
    );

     initial begin
          flushF <= 0;
          bubbleF <= 0;
          flushD <= 0;
          bubbleD <= 0;
          flushE <= 0;
          bubbleE <= 0;
          flushM <= 0;
          bubbleM <= 0;
          flushW <= 0;
          bubbleW <= 0;
      end


     always@ (*) begin
          if (rst) begin
               flushF <= 1;
               flushD <= 1;
               flushE <= 1;
               flushM <= 1;
               flushW <= 1;
          end
          else if (br_type != 0 && wb_select_MEM == 1 && (reg_dstM == reg1_srcE || reg_dstM == reg2_srcE)) begin
              flushD <= 0;
              flushE <= 1;
              flushF <= 0;
              flushM <= 0;
              flushW <= 0;
          end
          else if (wb_select == 1 && (reg_dstE == reg1_srcD || reg_dstE == reg2_srcD)) begin
              flushD <= 0;
              flushE <= 1;
              flushF <= 0;
              flushM <= 0;
              flushW <= 0;
          end
          else if ((br == 1 && BTB_hit == 0 && IsBr == 1) || (br == 0 && BTB_hit == 1 && IsBr == 1)) begin
               flushD <= 1;
               flushE <= 1;
               flushF <= 0;
               flushM <= 0;
               flushW <= 0;
          end
          else if (jalr) begin
               flushD <= 1;
               flushE <= 1;
               flushF <= 0;
               flushM <= 0;
               flushW <= 0;
          end
          else if (jal) begin
               flushD <= 1;
               flushE <= 0;
               flushF <= 0;
               flushM <= 0;
               flushW <= 0;
          end
          else begin
               flushF <= 0;
               flushD <= 0;
               flushE <= 0;
               flushM <= 0;
               flushW <= 0;
          end
     end 

     always@ (*) begin
          if (cache_miss) begin
               bubbleF <= 1;
               bubbleD <= 1;
               bubbleE <= 1;
               bubbleM <= 1;
               bubbleW <= 1;
          end
          else if (wb_select == 1 && (reg_dstE == reg1_srcD || reg_dstE == reg2_srcD)) begin
               bubbleF <= 1;
               bubbleD <= 1;
               bubbleE <= 0;
               bubbleM <= 0;
               bubbleW <= 0;
          end
          else begin
               bubbleF <= 0;
               bubbleD <= 0;
               bubbleE <= 0;
               bubbleM <= 0;
               bubbleW <= 0;
          end
     end
/*
always@(*)
begin
    if(!rst)
    bubbleW=((cache_miss==1'b1)?1'b1:1'b0);
    else
    bubbleW=1'b0;
end*/
     always@ (*) begin
          /*后面的指令用到了reg1 && 前面的指令要写回 && 两个寄存器一�?*/
          if (src_reg_en[1] && reg_write_en_MEM && reg_dstM == reg1_srcE && reg_dstM != 0)
               op1_sel <= 2'd0;/*选result_MEM*/
          
          /*后面的指令用到了reg1 && 前面的指令要写回 && 两个寄存器一�?*/
          else if (src_reg_en[1] && reg_write_en_WB && reg_dstW == reg1_srcE && reg_dstW != 0) op1_sel <= 2'd1;

          else if (src_reg_en[1] && alu_src1 == 0) op1_sel <= 2'd3;
          else if (!src_reg_en[1] && alu_src1 == 1) op1_sel <= 2'd2;  
     end
   
     always@ (*) begin
          if (src_reg_en[0] && reg_write_en_MEM && reg_dstM == reg2_srcE && reg_dstM != 0) op2_sel <= 2'd0;
          else if (src_reg_en[0] && reg_write_en_WB && reg_dstW == reg2_srcE && reg_dstW != 0) op2_sel <= 2'd1;
          else if (src_reg_en[0] && alu_src2 == 0) op2_sel <= 2'd3;
          else if (!src_reg_en[0] && alu_src2 == 1) op2_sel <= 2'd3;
          else if (!src_reg_en[0] && alu_src2 == 2) op2_sel <= 2'd2;
     end
   
     always@ (*) begin
        if (reg_write_en_MEM && reg_dstM == reg2_srcE && reg_dstM != 0) reg2_sel <= 2'd0;
        else if (reg_write_en_WB && reg_dstW == reg2_srcE && reg_dstW != 0) reg2_sel <= 2'd1;
        else reg2_sel <= 2'd2;
     end

     always@ (*) begin
          if(src_reg_en[1] && reg_write_en_MEM && reg_dstM == reg1_srcE && reg_dstM != 0)
               CSR_op2_sel <= 2'd0;
          else if (src_reg_en[1] && reg_write_en_WB && reg_dstW == reg1_srcE && reg_dstW != 0)
               CSR_op2_sel <= 2'd1;
          else if (CSR_type == 1) CSR_op2_sel <= 2'd2;
          else if (CSR_type == 0) CSR_op2_sel <= 2'd3;
     end
   
   always@(*) begin
        if (rst) begin
            BufferWrite <= 1'b0;
            BufferDelete <= 1'b0;
        end
        else begin
            if (BTB_hit == 0 && IsBr == 1 && br == 1) BufferWrite <= 1'b1;
            else BufferWrite <= 1'b0;
            
            if (BTB_hit == 1 && IsBr == 1 && br == 0) BufferDelete <= 1'b1;
            else BufferDelete <= 1'b0; 
        end
   end
   
endmodule