module Convolution_optimize(
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

//////////////The output port shoud be registers///////////////////////
output reg out_valid;
output reg[35:0] Out_OFM;
//////////////////////////////////////////////////////////////////////


/////// 2 Buffer/////////////
//You have to sue these buffers for the 3-1 & 3-2 /////// 
reg [15:0]IFM_Buffer[0:48] ;   //  Use this buffer to store IFM
reg [15:0]Weight_Buffer[0:8]; 
reg [6:0]count;
reg [6:0]count2;
reg [6:0]Output_count;
reg [5:0] i;
reg [35:0]RegW0;
reg [35:0]RegW1;
reg [35:0]RegW2;
reg [35:0]RegW3;
reg [35:0]RegW4;
reg [35:0]RegW5;
reg [35:0]RegW6;
reg [35:0]RegW7;
reg [35:0]RegW8;
reg [15:0]RegI0;
reg [15:0]RegI1;
reg [15:0]RegI2;
reg [15:0]RegI3;
reg [15:0]RegI4;
reg [15:0]RegI5;
reg [15:0]RegI6;
reg [15:0]RegI7;
reg [15:0]RegI8;
wire [35:0] wire_sum4;
wire [35:0] wire_sum1;
wire [35:0] wire_sum2;
wire [35:0] wire_sum3;
wire [35:0] wire_sum5;
wire [35:0] wire_sum6;
wire [35:0] wire_sum7;
wire [35:0] wire_sum8;
 //  Use this buffer to store Weight
/////////////////////////////////////

////////Here just an example of how to use IFM_buffer & WEight_Buffer to store data////////
//The storage mechanism can be modified, but not the buffer size cannot be modified
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
		for (i=0;i<49;i=i+1) 
			IFM_Buffer[i] <= 0;
	end
	else if(in_valid) begin
		IFM_Buffer[count]  <= In_IFM_1;
	end                

end
///////////////////////////////////////////////////////



always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		count<=0;
	else if((in_valid || out_valid) && count<50)
		count<=count+1;
	else
		count<=0;


end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		out_valid <= 0;
	end
	else if(count> 26) begin
		out_valid <= 1;
	end
	else begin
		out_valid <= 0;
	end
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		RegI0<=0;
		RegI1<=0;
		RegI2<=0;
		RegI3<=0;
		RegI4<=0;
		RegI5<=0;
		RegI6<=0;
		RegI7<=0;
		RegI8<=0;
		RegW0<= 0;
		RegW1<= 0;
		RegW2<= 0;
		RegW3<= 0;
		RegW4<= 0;
		RegW5<= 0;
		RegW6<= 0;
		RegW7<= 0;
		RegW8<= 0;
		Out_OFM <= 0;
	end
	else if((count>=25)&&(count<=50)) begin
		RegI0<=IFM_Buffer[count2];
		RegI1<=IFM_Buffer[count2+1];
		RegI2<=IFM_Buffer[count2+2];
		RegI3<=IFM_Buffer[count2+7];
		RegI4<=IFM_Buffer[count2+8];
		RegI5<=IFM_Buffer[count2+9];
		RegI6<=IFM_Buffer[count2+14];
		RegI7<=IFM_Buffer[count2+15];
		RegI8<=IFM_Buffer[count2+16];
		RegW0<= RegI0*Weight_Buffer[0];
		RegW1<= RegI1*Weight_Buffer[1];
		RegW2<= RegI2*Weight_Buffer[2];
		RegW3<= RegI3*Weight_Buffer[3];
		RegW4<= RegI4*Weight_Buffer[4];
		RegW5<= RegI5*Weight_Buffer[5];
		RegW6<= RegI6*Weight_Buffer[6];
		RegW7<= RegI7*Weight_Buffer[7];
		RegW8<= RegI8*Weight_Buffer[8];
		Out_OFM <= wire_sum8;
	end
	else begin
		RegI0<=0;
		RegI1<=0;
		RegI2<=0;
		RegI3<=0;
		RegI4<=0;
		RegI5<=0;
		RegI6<=0;
		RegI7<=0;
		RegI8<=0;
		RegW0<= 0;
		RegW1<= 0;
		RegW2<= 0;
		RegW3<= 0;
		RegW4<= 0;
		RegW5<= 0;
		RegW6<= 0;
		RegW7<= 0;
		RegW8<= 0;
		Out_OFM <= 0;
	end
end

CLA_36bit CLA_1(
    .A(RegW1),
    .B(RegW2),
    .sum(wire_sum1)              
);
CLA_36bit CLA_2(
    .A(RegW3),
    .B(RegW4),
    .sum(wire_sum2)
);
CLA_36bit CLA_3(
    .A(wire_sum1),
    .B(wire_sum2),
    .sum(wire_sum3)
);
CLA_36bit CLA_4(
    .A(wire_sum3),
    .B(wire_sum7),
    .sum(wire_sum4)
);
CLA_36bit CLA_5(
    .A(RegW5),
    .B(RegW6),
    .sum(wire_sum5)
);
CLA_36bit CLA_6(
    .A(RegW7),
    .B(RegW8),
    .sum(wire_sum6)
);
CLA_36bit CLA_7(
    .A(wire_sum5),
    .B(wire_sum6),
    .sum(wire_sum7)
);
CLA_36bit CLA_8(
    .A(RegW0),
    .B(wire_sum4),
    .sum(wire_sum8)
);


always@(*) begin
	Output_count=count-25;

	if(Output_count<5)
		count2=Output_count;
	else if((Output_count>=5) && (Output_count<10))
		count2=Output_count+2;
	else if((Output_count>=10) && (Output_count<15))
		count2=Output_count+4;
	else if((Output_count>=15) && (Output_count<20))
		count2=Output_count+6;
	else if((Output_count>=20) && (Output_count<25))
		count2=Output_count+8;

	else 
		count2=0;

end


endmodule
module CLA_36bit(
    input [35:0] A,
    input [35:0] B,
    output [35:0] sum
);

wire [35:0] sum; 
wire [35:0] A; 
wire [36:0] B; 

assign sum = A+B;


endmodule

