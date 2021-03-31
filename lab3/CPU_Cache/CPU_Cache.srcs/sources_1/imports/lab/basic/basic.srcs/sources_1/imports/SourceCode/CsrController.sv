
`include "Parameters.v" 
module CSR_ControllerDecoder(
    input wire [31:0] inst,
    output reg csr_sel1,
    output reg csr_sel2,
    output reg csr_sel3,
    output reg csr_reg_en,
    output reg [1:0]csr_func
    );
    always@(*)
    begin
        case ({inst[6:0],inst[14:12]})
            10'b1110011001 : csr_func=`RW;
            10'b1110011010 : csr_func=`RS;
            10'b1110011011 : csr_func=`RC;
            10'b1110011101 : csr_func=`RW;
            10'b1110011110 : csr_func=`RS;
            10'b1110011111 : csr_func=`RC;
            default: csr_func=`NOTCSR;
        endcase
    end
    always@(*)
    begin
    case (inst[6:0])
        7'b1110011:csr_sel1=1'b1; 
        default: csr_sel1=1'b0;
    endcase
    end

    always@(*)
    begin
    case (inst[6:0])
        7'b1110011:csr_sel2=1'b1; 
        default: csr_sel2=1'b0;
    endcase
    end
    always@(*)
    begin
        case ({inst[6:0],inst[14:12]})
            10'b1110011001 : csr_sel3=1'b1;//not imm
            10'b1110011010 : csr_sel3=1'b1;
            10'b1110011011 : csr_sel3=1'b1;
            10'b1110011101 : csr_sel3=1'b0;
            10'b1110011110 : csr_sel3=1'b0;
            10'b1110011111 : csr_sel3=1'b0;
            default: csr_sel3=1'b0;
        endcase
    end
    always@(*)
    begin
    case (inst[6:0])
        7'b1110011:csr_reg_en=1'b1; 
        default: csr_reg_en=1'b0;
    endcase
    end
endmodule