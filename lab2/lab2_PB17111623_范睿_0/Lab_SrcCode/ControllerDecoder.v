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
    //  对指令进行译码，将其翻译成控制信号，传输给各个部�?????
// 输入
    // Inst              待译码指�?????
// 输出
    // jal               jal跳转指令
    // jalr              jalr跳转指令
    // op2_src           ALU的第二个操作数来源�?�为1时，op2选择imm，为0时，op2选择reg2
    // ALU_func          ALU执行的运算类�?????
    // br_type           branch的判断条件，可以是不进行branch
    // load_npc          写回寄存器的值的来源（PC或�?�ALU计算结果�?????, load_npc == 1时�?�PC, load_npc == 0时�?�ALUout
    // wb_select         写回寄存器的值的来源（Cache内容或�?�ALU计算结果），wb_select == 1时�?�择cache内容
    // load_type         load类型
    // src_reg_en        指令中src reg的地�?????是否有效，src_reg_en[1] == 1表示reg1被使用到了，src_reg_en[0]==1表示reg2被使用到�?????
    // reg_write_en      通用寄存器写使能，reg_write_en == 1表示�?????要写回reg
    // cache_write_en    按字节写入data cache
    // imm_type          指令中立即数类型
    // alu_src1          alu操作�?????1来源，alu_src1 == 0表示来自reg1，alu_src1 == 1表示PC-4
    // alu_src2          alu操作�?????2来源，alu_src2 == 2’b00表示来自reg2，alu_src2 == 2'b01表示来自reg2地址，alu_src2 == 2'b10表示来自立即�?????
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
    output reg [1:0] alu_src2,
    output reg [2:0] imm_type,

    output reg CSR_read_en,    //CSR读信号，�?1时读CSR�?0时不�?
    output reg CSR_write_en,    //CSR写信�?,�?1时写CSR,�?0时不写（rs1和zimm=0的时候不写）
    output reg [1:0] CSR_alu_func,  //CSR alu执行的运算类�?,0为传递op2,1为置1,2为置0,3为不做运�?
    output wire op1_src,    //ALU第一个操作数来源�?0为CSR�?1为reg1
    output wire CSR_type    //0为reg�?1为zimm
    );

    /*jal*/
    assign jal = inst[6:0] == 7'b1101111 ? 1'b1 : 1'b0;
    
    /*jalr*/
    assign jalr = inst[6:0] == 7'b1100111 ? 1'b1 : 1'b0;
    
    /*op2_src*/
    assign op2_src = inst[6:0] == 7'b0110011 ? 1'b0 : 1'b1;
    
    /*ALU_func*/
    always@ (*) begin
        if (inst[6:0] == 7'b0010011) begin
            if (inst[14:12] == 3'b001) ALU_func = `SLL;
            else if (inst[14:12] == 3'b101) begin
                if(inst[31:25] == 7'b0000000) ALU_func = `SRL;
                else if(inst[31:25] == 7'b0100000) ALU_func = `SRA;
            end
            else if(inst[14:12] == 3'b000) ALU_func = `ADD;
            else if (inst[14:12] == 3'b010) ALU_func = `SLT;
            else if (inst[14:12] == 3'b011) ALU_func = `SLTU;
            else if (inst[14:12] == 3'b100) ALU_func = `XOR;
            else if (inst[14:12] == 3'b110) ALU_func = `OR;
            else if (inst[14:12] == 3'b111) ALU_func = `AND;
            else ALU_func = 4'd11;
        end
        else if (inst[6:0] == 7'b0110011) begin
            if (inst[14:12] == 3'b000) begin
                if (inst[31:25] == 7'b000000) ALU_func = `ADD;
                else if (inst[31:25] == 7'b0100000) ALU_func = `SUB;
            end
            else if (inst[14:12] == 3'b001) ALU_func = `SLL;
            else if (inst[14:12] == 3'b010) ALU_func = `SLT;
            else if (inst[14:12] == 3'b011) ALU_func = `SLTU;
            else if (inst[14:12] == 3'b100) ALU_func = `XOR;
            else if (inst[14:12] == 3'b101) begin
                if (inst[31:25] == 6'b000000) ALU_func = `SRL;
                else if (inst[31:25] == 7'b0100000) ALU_func = `SRA;
            end
            else if (inst[14:12] == 3'b110) ALU_func = `OR;
            else if (inst[14:12] == 3'b111) ALU_func = `AND;
        end
        else if (inst[6:0] == 7'b0110111) ALU_func = `LUI; 
        else if (inst[6:0] == 7'b0010111) ALU_func = `ADD;
        else if (inst[6:0] == 7'b1100111) ALU_func = `ADD;//jarl
        else if (inst[6:0] == 7'b1110011) ALU_func = `CSR;
    end

    /*br_type*/
    always@ (*) begin
        if (inst[6:0] == 7'b1100011) begin
            if (inst[14:12] == 3'b000) br_type = `BEQ;
            if (inst[14:12] == 3'b001) br_type = `BNE;
            if (inst[14:12] == 3'b100) br_type = `BLT;
            if (inst[14:12] == 3'b101) br_type = `BGE;
            if (inst[14:12] == 3'b110) br_type = `BLTU;
            if (inst[14:12] == 3'b111) br_type = `BGEU;
        end
        else br_type = `NOBRANCH;
    end
    
    /*load_npc*/
    assign load_npc = (inst[6:0] == 7'b1100111 || inst[6:0] == 7'b1101111) ? 2'b01 : 0;

    /*wb_select*/
    assign wb_select = inst[6:0] == 7'b0000011 ? 1 : 0;

    /*load_type*/
    always@ (*) begin
        if (inst[6:0] == 7'b0000011) begin
            if (inst[14:12] == 3'b000) load_type = `LB;
            if (inst[14:12] == 3'b001) load_type = `LH;
            if (inst[14:12] == 3'b010) load_type = `LW;
            if (inst[14:12] == 3'b100) load_type = `LBU;
            if (inst[14:12] == 3'b101) load_type = `LHU;
        end
        else load_type = `NOREGWRITE;
    end

    /*src_reg_en*/
    always@ (*) begin
        if(inst[6:0] == 7'b0010011) src_reg_en = 2'b10; //slli,addi
        else if (inst[6:0] == 7'b0110011) src_reg_en = 2'b11; //add
        else if (inst[6:0] == 7'b0110111 || inst[6:0] == 7'b0010111) src_reg_en = 2'b00; //lui,auipc
        else if (inst[6:0] == 7'b1100111) src_reg_en = 2'b10; //jalr
        else if (inst[6:0] == 7'b1101111) src_reg_en = 2'b00; //jal
        else if (inst[6:0] == 7'b1100011) src_reg_en = 2'b11; //beq
        else if (inst[6:0] == 7'b0000011) src_reg_en = 2'b10; //lb
        else if (inst[6:0] == 7'b0100011) src_reg_en = 2'b10; //sb
        else if (inst[6:0] == 7'b1110011) src_reg_en = 2'b10;
        else src_reg_en = 2'b00;
    end

    /*reg_write_en*/
    always@ (*) begin
        if (inst[6:0] == 7'b1100011 || inst[6:0] == 7'b0100011) reg_write_en = 0;//beq&sb
        else if (inst[11:7] == 0) reg_write_en = 0;
        else reg_write_en = 1;
    end

    /*cache_write_en*/
    always@ (*) begin
        if (inst[6:0] == 7'b0100011) begin
            if (inst[14:12] == 3'b000) cache_write_en = 4'b0001;
            else if (inst[14:12] == 3'b001) cache_write_en = 4'b0011;
            else if (inst[14:12] == 3'b010) cache_write_en = 4'b1111;
        end
        else cache_write_en = 0;
    end

    /*alu_src1*/
    assign alu_src1 = (inst[6:0] == 7'b1101111 || inst[6:0] == 7'b0110111 || inst[6:0] == 7'b0010111) ? 1 : 0;

    /*alu_src2*/
    always@ (*) begin
        if (inst[6:0] == 7'b0110011 || inst[6:0] == 7'b1100011) 
            alu_src2 = 2'b0;/*reg2*/
        else if (inst[6:0] == 7'b0010011 && (inst[14:12] == 3'b001 || inst[14:12] == 3'b101))
            alu_src2 = 2'd2;/*reg2地址*/
        else alu_src2 = 2'd1;/*立即�??*/
    end

    /*imm_type*/
    always@ (*) begin
        if (inst[6:0] == 7'b0010011 || inst[6:0] == 7'b1100111 || inst[6:0] == 7'b0000011) imm_type = `ITYPE;//jalr,lb,addi
        else if (inst[6:0] == 7'b0100011) imm_type = `STYPE;//SB
        else if (inst[6:0] == 7'b1100011) imm_type = `BTYPE;//beq
        else if (inst[6:0] == 7'b0110111 || inst[6:0] == 7'b0010111) imm_type = `UTYPE;//lui,auipc
        else if (inst[6:0] == 7'b1101111) imm_type = `JTYPE;//jal
        else imm_type = `RTYPE;
    end

    /*CSR_read_en*/
    always@ (*) begin
        if(inst[6:0] == 7'b1110011) begin
            if ((inst[14:12] == 3'b001 && inst[11:7] == 0) || (inst[14:12] == 3'b101 && inst[11:7] == 0)) CSR_read_en = 0;
            else CSR_read_en = 1;
        end
    end

    /*CSR_write_en*/
    always@ (*) begin
        if (inst[6:0] == 7'b1110011) begin
            if (inst[19:15] == 0) CSR_write_en = 0;
            else CSR_write_en = 1;
        end
    end

    /*CSR_alu_func*/
    always@ (*) begin
        if (inst[6:0] == 7'b1110011) begin
            if (inst[14:12] == 3'b001 || inst[14:12] == 3'b101) CSR_alu_func = `STRAIGHT_OP2;
            else if (inst[14:12] == 3'b010 || inst[14:12] == 3'b110) CSR_alu_func = `TO1;
            else if (inst[14:12] == 3'b011 || inst[14:12] == 3'b111) CSR_alu_func = `TO0;
            else CSR_alu_func = `NOFUNC;
        end
        else CSR_alu_func = `NOFUNC;
    end

    /*op1_src*/
    assign op1_src = (inst[6:0] == 7'b1110011) ? 0 : 1;

    assign CSR_type = (inst[6:0] == 7'b1110011) ? ((inst[14:12] == 3'b001 || inst[14:12] == 3'b010 || inst[14:12] == 3'b011) ? 1 : 0) : 0;

endmodule
