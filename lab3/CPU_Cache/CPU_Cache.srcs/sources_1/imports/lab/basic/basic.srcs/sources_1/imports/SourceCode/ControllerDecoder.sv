`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Controller Decoder
// Tool Versions: Vivado 2017.4.1
// Description: Controller Decoder Module
// 
//////////////////////////////////////////////////////////////////////////////////

//  功能说明
    //  对指令进行译码，将其翻译成控制信号，传输给各个部�?
// 输入
    // Inst              待译码指�?
// 输出
    // jal               jal跳转指令
    // jalr              jalr跳转指令
    // op2_src           ALU的第二个操作数来源�?�为1时，op2选择imm，为0时，op2选择reg2
    // ALU_func          ALU执行的运算类�?
    // br_type           branch的判断条件，可以是不进行branch
    // load_npc          写回寄存器的值的来源（PC或�?�ALU计算结果�?, load_npc == 1时�?�择PC
    // wb_select         写回寄存器的值的来源（Cache内容或�?�ALU计算结果），wb_select == 1时�?�择cache内容
    // load_type         load类型
    // src_reg_en        指令中src reg的地�?是否有效，src_reg_en[1] == 1表示reg1被使用到了，src_reg_en[0]==1表示reg2被使用到�?
    // reg_write_en      通用寄存器写使能，reg_write_en == 1表示�?要写回reg
    // cache_write_en    按字节写入data cache
    // imm_type          指令中立即数类型
    // alu_src1          alu操作�?1来源，alu_src1 == 0表示来自reg1，alu_src1 == 1表示来自PC
    // alu_src2          alu操作�?2来源，alu_src2 == 2’b00表示来自reg2，alu_src2 == 2'b01表示来自reg2地址，alu_src2 == 2'b10表示来自立即�?
// 实验要求
    // 补全模块


`include "Parameters.v"   
module ControllerDecoder(
    input wire [31:0] inst,
    output wire jal,
    output wire jalr,
    output wire op2_src,
    output reg [3:0] ALU_func,
    output reg [2:0] br_type,
    output wire load_npc,
    output wire wb_select,
    output reg [2:0] load_type,
    output reg [1:0] src_reg_en,
    output reg reg_write_en,
    output reg [3:0] cache_write_en,
    output wire alu_src1,
    output wire [1:0] alu_src2,
    output reg [2:0] imm_type
    );

    assign jal=(inst[6:0]==7'b 1101111)?1:0;
    assign jalr=(inst[6:0]==7'b 1100111)?1:0;
    assign op2_src=(inst[6:0]==7'b 0110011)?0:1;
    assign load_npc=((inst[6:0]==7'b 1101111)||(inst[6:0]==7'b 1100111))?1:0;
    assign wb_select=(inst[6:0]==7'b 0000011)?1'b1:1'b0;
    assign alu_src1=((inst[6:0]==7'b 0010111))?1:0;
    assign alu_src2=((inst[6:0]==7'b 0010011)&& ((inst[14:12]==3'b001)||(inst[14:12]==3'b101)))?(2'b01):
                                            (((inst[6:0]==7'b 0110011))?2'b00:
                                                                                                2'b10);
    // TODO: Complete this module
    reg [3:0]ALU_func1;
    reg [3:0]ALU_func2;
    always@(*)
    begin
        case ({inst[14:12],inst[31:30]})
            5'b00100: ALU_func1=`SLL;
            5'b10100: ALU_func1=`SRL;
            5'b10101: ALU_func1=`SRA;
            5'b00000: ALU_func1=`ADD;
            5'b00001: ALU_func1=`SUB;
            5'b10000: ALU_func1=`XOR;
            5'b11000: ALU_func1=`OR;
            5'b11100: ALU_func1=`AND;
            5'b01000: ALU_func1=`SLT;
            5'b01100: ALU_func1=`SLTU;

            default: ALU_func1=4'd0;
        endcase
    end

    always@(*)
    begin
         case (inst[14:12])
            3'b000: ALU_func2=`ADD;
            3'b010: ALU_func2=`SLT;
            3'b011: ALU_func2=`SLTU;
            3'b100: ALU_func2=`XOR;
            3'b110: ALU_func2=`OR;
            3'b111: ALU_func2=`AND; 
            3'b001: ALU_func2=`SLL;
            3'b101: ALU_func2=(inst[30])?(`SRA):(`SRL);
            default: ALU_func2=4'd0;
        endcase
    end

    always@(*)
    begin
        case (inst[6:0])
            7'b0110111: ALU_func=`LUI;
            7'b0010111: ALU_func=`ADD;
            7'b0110011: ALU_func=ALU_func1;
            7'b0010011: ALU_func=ALU_func2;
            7'b1100111: ALU_func=`ADD;
            7'b0000011: ALU_func=`ADD;
            7'b0100011: ALU_func=`ADD;
            7'b1110011: ALU_func=`ADD;
            default: ALU_func=4'd0;
        endcase
    end
    always@(*)
    begin
        
    end
    always@(*)
    begin
        case ({inst[6:0],inst[14:12]})
            10'b1100011000: br_type=`BEQ;
            10'b1100011001: br_type=`BNE;
            10'b1100011100: br_type=`BLT;
            10'b1100011101: br_type=`BGE;
            10'b1100011110: br_type=`BLTU;
            10'b1100011111: br_type=`BGEU;
            default: br_type=3'd0;
        endcase
    end
    always@(*)
    begin
        case ({inst[6:0],inst[14:12]})
            10'b0000011000: load_type=`LB;
            10'b0000011001: load_type=`LH;
            10'b0000011010: load_type=`LW;
            10'b0000011100: load_type=`LBU;
            10'b0000011101: load_type=`LHU;
            default: load_type=3'd0;
        endcase
    end
    always@(*)
    begin
        case (inst[6:0])
            7'b0000011: imm_type=`ITYPE;
            7'b0100011: imm_type=`STYPE;
            7'b1100011: imm_type=`BTYPE;
            7'b0010011: imm_type=`ITYPE;
            7'b0110111: imm_type=`UTYPE;
            7'b0010111: imm_type=`UTYPE;
            7'b1100111: imm_type=`ITYPE;
            7'b1101111: imm_type=`JTYPE;
            default: imm_type=`RTYPE;
        endcase
    end
    always@(*)
    begin
        case ({inst[6:0],inst[14:12]})
            10'b0100011000:cache_write_en=4'b0001; 
            10'b0100011001:cache_write_en=4'b0011; 
            10'b0100011010:cache_write_en=4'b1111; 
            default: cache_write_en=1'b0;
        endcase
        
    end
    always@(*)
    begin
        case (inst[6:0])

            7'b1100011:reg_write_en=1'b0;
            7'b0100011:reg_write_en=1'b0;
            default: reg_write_en=1'b1;
        endcase
    end

    always@(*)
    begin
        case (inst[6:0])
            7'b0010011:src_reg_en=2'b10;
            7'b0110011:src_reg_en=2'b11;
            7'b0110111:src_reg_en=2'b00;
            7'b0010111:src_reg_en=2'b00;
            7'b1100111:src_reg_en=2'b10;
            7'b1101111:src_reg_en=2'b00;

            7'b1100011:src_reg_en=2'b11;
            
            7'b0000011:src_reg_en=2'b10;
            7'b0100011:src_reg_en=2'b11;
            7'b1110011:src_reg_en=2'b00;
            default: src_reg_en=2'b00;
        endcase
    end
endmodule
