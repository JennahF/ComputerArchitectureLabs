module lru #(
    parameter  LINE_ADDR_LEN = 3, // line内地�???长度，决定了每个line具有2^3个word
    parameter  SET_ADDR_LEN  = 3, // 组地�???长度，决定了�???共有2^3=8�???
    parameter  TAG_ADDR_LEN  = 6, // tag长度
    parameter  WAY_LEN       = 2,  // 组相连度，决定了每组中有多少路line，这里是直接映射型cache，因此该参数没用�???
    parameter  WAY_CNT       = 4
)(

    input  clk, rst,
    input  [  SET_ADDR_LEN-1:0]set_addr,
    input  [  WAY_LEN-1:0]way_addr,  
    input  way_rst_en,     
    output  reg[  WAY_LEN-1:0]swap_addr
);
localparam SET_SIZE   
     = 1 << SET_ADDR_LEN   ;  
reg [9:0]   cnt[SET_SIZE][WAY_CNT];
wire cmp1,cmp2,cmp3;
wire [9:0]cmp1_result,cmp2_result,cmp_result;
always@(posedge clk or posedge rst)
begin
        begin
            for (integer i = 0 ;i <SET_SIZE ; i++) 
                begin
                    for (integer k = 0 ;k < WAY_CNT ; k++ )
                        begin
                            if(rst)
                            begin
                                cnt[i][k]<=10'd0;
                            end
                            
                            else 
                                begin
                                    if((i==set_addr)&&(k==way_addr)&&(way_rst_en==1'b1))
                                        cnt[i][k]<=10'd0;
                                    else    
                                        cnt[i][k]<=cnt[i][k]+1'b1;
                                end

                        end
                end
            end
        end


assign cmp1=(cnt[set_addr][0]>cnt[set_addr][1])?1'b1:1'b0;
assign cmp2=(cnt[set_addr][2]>cnt[set_addr][3])?1'b1:1'b0;
assign cmp1_result=(cnt[set_addr][0]>cnt[set_addr][1])?cnt[set_addr][0]:cnt[set_addr][1];
assign cmp2_result=(cnt[set_addr][2]>cnt[set_addr][3])?cnt[set_addr][2]:cnt[set_addr][3];
assign cmp_result=(cmp1_result>cmp2_result)?cmp1_result:cmp2_result;
assign cmp3=(cmp1_result>cmp2_result)?1'b1:1'b0;

always@(*)
case({cmp1,cmp2,cmp3})
    3'd0:swap_addr=2'd3;
    3'd1:swap_addr=2'd1;
    3'd2:swap_addr=2'd2;
    3'd3:swap_addr=2'd1;
    3'd4:swap_addr=2'd3;
    3'd5:swap_addr=2'd0;
    3'd6:swap_addr=2'd2;
    3'd7:swap_addr=2'd0;
    default:swap_addr=2'd0;
endcase

endmodule