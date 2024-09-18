module Convolution_optimize_v3(
	//input
clk,
rst_n,
in_valid,
weight_valid,
In_IFM_1,
In_Weight_1,
//output
out_valid, 
Out_OFM	

);

input clk, rst_n, in_valid, weight_valid;
input [15:0]In_IFM_1;		
input [15:0]In_Weight_1;
reg [6:0] count;
reg [5:0] i;
output reg out_valid;
output reg[35:0] Out_OFM;

reg [15:0]IFM_Buffer[0:16] ;   //  Use this buffer to store IFM
reg [15:0]Weight_Buffer[0:8];  //  Use this buffer to store Weight
reg [35:0]stage1_Buffer[0:8];
reg [35:0]stage2_Buffer[0:2];
wire [35:0] CLA1_sum;
wire [35:0] CLA2_sum;
wire [35:0] CLA3_sum;
wire [35:0] CLA4_sum;
wire [35:0] CLA5_sum;
wire [35:0] CLA6_sum;
wire [35:0] CLA7_sum;
wire [35:0] CLA8_sum;

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i=0;i<9;i=i+1) 
			Weight_Buffer[i] <= 0;
	end
	else if(weight_valid)
		Weight_Buffer[count] <= In_Weight_1;
end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i=0;i<16;i=i+1) 
			IFM_Buffer[i] <= 0;
	end
	else if(in_valid) begin
		IFM_Buffer[0]  <= IFM_Buffer[1];
		IFM_Buffer[1]  <= IFM_Buffer[2];
		IFM_Buffer[2]  <= IFM_Buffer[3];
		IFM_Buffer[3]  <= IFM_Buffer[4];
		IFM_Buffer[4]  <= IFM_Buffer[5];
		IFM_Buffer[5]  <= IFM_Buffer[6];
		IFM_Buffer[6]  <= IFM_Buffer[7];
		IFM_Buffer[7]  <= IFM_Buffer[8];
		IFM_Buffer[8]  <= IFM_Buffer[9];
		IFM_Buffer[9]  <= IFM_Buffer[10];
		IFM_Buffer[10]  <= IFM_Buffer[11];
		IFM_Buffer[11]  <= IFM_Buffer[12];
		IFM_Buffer[12]  <= IFM_Buffer[13];
		IFM_Buffer[13]  <= IFM_Buffer[14];
		IFM_Buffer[14]  <= IFM_Buffer[15];
		IFM_Buffer[15]  <= IFM_Buffer[16];
		IFM_Buffer[16]  <= In_IFM_1;
	end                

end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		count <= 0;
	else if(out_valid || in_valid)
		count <= count + 1;
	else
		count <= 0;
end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		out_valid <= 0;
	else if(count >= 19) begin
		if((count == 24) || (count == 25))
			out_valid <= 0;
		else if((count == 31) || (count == 32))
			out_valid <= 0;
		else if((count == 38) || (count == 39))
			out_valid <= 0;
		else if((count == 45) || (count == 46))
			out_valid <= 0;
		else if((count == 52) || (count == 53))
			out_valid <= 0;
		else
			out_valid <= 1;
	end
	else
		out_valid <= 0;
end

CLA_36bit CLA1(
                    .A(stage1_Buffer[1]),
                    .B(stage1_Buffer[2]),
                    .sum(CLA1_sum)
                );

CLA_36bit CLA2(
                    .A(stage1_Buffer[3]),
                    .B(stage1_Buffer[4]),
                    .sum(CLA2_sum)
                );

CLA_36bit CLA3(
                    .A(stage1_Buffer[5]),
                    .B(stage1_Buffer[6]),
                    .sum(CLA3_sum)
                );

CLA_36bit CLA4(
                    .A(stage1_Buffer[7]),
                    .B(stage1_Buffer[8]),
                    .sum(CLA4_sum)
                );

CLA_36bit CLA5(
                    .A(stage2_Buffer[1]),
                    .B(stage2_Buffer[2]),
                    .sum(CLA5_sum)
                );

CLA_36bit CLA6(
                    .A(CLA1_sum),
                    .B(CLA2_sum),
                    .sum(CLA6_sum)
                );

CLA_36bit CLA7(
                    .A(CLA3_sum),
                    .B(CLA4_sum),
                    .sum(CLA7_sum)
                );

CLA_36bit CLA8(
                    .A(stage2_Buffer[0]),
                    .B(CLA5_sum),
                    .sum(CLA8_sum)
                );

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		stage1_Buffer[0] <= 0;
		stage1_Buffer[1] <= 0;
		stage1_Buffer[2] <= 0;
		stage1_Buffer[3] <= 0;
		stage1_Buffer[4] <= 0;
		stage1_Buffer[5] <= 0;
		stage1_Buffer[6] <= 0;
		stage1_Buffer[7] <= 0;
		stage1_Buffer[8] <= 0;
		stage2_Buffer[0] <= 0;
		stage2_Buffer[1] <= 0;
		stage2_Buffer[2] <= 0;
		Out_OFM <= 0;
	end
	else begin
		stage1_Buffer[0] <= IFM_Buffer[0]*Weight_Buffer[0];
		stage1_Buffer[1] <= IFM_Buffer[1]*Weight_Buffer[1];
		stage1_Buffer[2] <= IFM_Buffer[2]*Weight_Buffer[2];
		stage1_Buffer[3] <= IFM_Buffer[7]*Weight_Buffer[3];
		stage1_Buffer[4] <= IFM_Buffer[8]*Weight_Buffer[4];
		stage1_Buffer[5] <= IFM_Buffer[9]*Weight_Buffer[5];
		stage1_Buffer[6] <= IFM_Buffer[14]*Weight_Buffer[6];
		stage1_Buffer[7] <= IFM_Buffer[15]*Weight_Buffer[7];
		stage1_Buffer[8] <= IFM_Buffer[16]*Weight_Buffer[8];
		stage2_Buffer[0] <= stage1_Buffer[0];
		stage2_Buffer[1] <= CLA6_sum;
		stage2_Buffer[2] <= CLA7_sum;
		Out_OFM <= CLA8_sum;
	end

end
endmodule

module CLA_36bit(
    input [35:0] A,
    input [35:0] B,
    output [35:0] sum
);
wire [35:0] gen; 
wire [35:0] pro; 
wire [36:0] carry; 

assign carry[0] = 0;

genvar i;
generate
    for (i = 0; i < 36; i = i + 1) begin : clal
        assign gen[i] = A[i] & B[i];
        assign pro[i] = A[i] ^ B[i];
        assign carry[i+1] = gen[i] | (pro[i] & carry[i]);
        assign sum[i] = pro[i] ^ carry[i];
    end
endgenerate

endmodule

