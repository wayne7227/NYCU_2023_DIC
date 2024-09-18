module Convolution(
	//input
clk,
rst_n,
in_valid,
weight_valid,
In_IFM_1,
In_IFM_2,
In_IFM_3,
In_IFM_4,
In_IFM_5,
In_IFM_6,
In_IFM_7,
In_IFM_8,
In_IFM_9,
In_Weight_1,
In_Weight_2,
In_Weight_3,
In_Weight_4,
In_Weight_5,
In_Weight_6,
In_Weight_7,
In_Weight_8,
In_Weight_9,
//output
out_valid, 
Out_OFM	

);

input clk, rst_n, in_valid, weight_valid;
input [7:0]In_IFM_1;		
input [7:0]In_Weight_1;
input [7:0]In_IFM_2;		
input [7:0]In_Weight_2;
input [7:0]In_IFM_3;		
input [7:0]In_Weight_3;
input [7:0]In_IFM_4;		
input [7:0]In_Weight_4;
input [7:0]In_IFM_5;		
input [7:0]In_Weight_5;
input [7:0]In_IFM_6;		
input [7:0]In_Weight_6;
input [7:0]In_IFM_7;		
input [7:0]In_Weight_7;
input [7:0]In_IFM_8;		
input [7:0]In_Weight_8;
input [7:0]In_IFM_9;		
input [7:0]In_Weight_9;

//////////////The output port shoud be registers///////////////////////
output reg out_valid;
output reg[20:0] Out_OFM;
//////////////////////////////////////////////////////////////////////


/////// 2 Buffer/////////////
//You have to sue these buffers for the 3-1 & 3-2 /////// 
reg [7:0]IFM_Buffer[0:8] ;   //  Use this buffer to store IFM
reg [7:0]Weight_Buffer[0:8]; 
reg [4:0]counter;
reg [3:0] i;

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i=0;i<9;i=i+1) 
			Weight_Buffer[i] <= 0;
	end
	else if(weight_valid)
		begin
			Weight_Buffer[0] <= In_Weight_1;
			Weight_Buffer[1] <= In_Weight_2;	
			Weight_Buffer[2] <= In_Weight_3;
			Weight_Buffer[3] <= In_Weight_4;
			Weight_Buffer[4] <= In_Weight_5;
			Weight_Buffer[5] <= In_Weight_6;
			Weight_Buffer[6] <= In_Weight_7;
			Weight_Buffer[7] <= In_Weight_8;
			Weight_Buffer[8] <= In_Weight_9;
		end
	else 
		begin
			for (i=0;i<9;i=i+1) 
				Weight_Buffer[i] <= Weight_Buffer[i];
		end
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i=0;i<9;i=i+1) 
			IFM_Buffer[i] <= 0;
	end
	else if(in_valid) begin
		IFM_Buffer[0]  <= In_IFM_1;
		IFM_Buffer[1]  <= In_IFM_2;
		IFM_Buffer[2]  <= In_IFM_3;
		IFM_Buffer[3]  <= In_IFM_4;
		IFM_Buffer[4]  <= In_IFM_5;
		IFM_Buffer[5]  <= In_IFM_6;
		IFM_Buffer[6]  <= In_IFM_7;
		IFM_Buffer[7]  <= In_IFM_8;
		IFM_Buffer[8]  <= In_IFM_9;
		end
	else 	begin
		for (i=0;i<9;i=i+1) 
			IFM_Buffer[i] <= IFM_Buffer[i];	
		
	end                

end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		counter<=0;
	else if(in_valid && counter<25 )
		counter<=counter+1;
	else
		counter<=0;


end


always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		out_valid <= 0;
		Out_OFM <= 0;
	end
	else if(counter>=1) begin
		out_valid <= 1;
		Out_OFM <= IFM_Buffer[0]*Weight_Buffer[0] +IFM_Buffer[1]*Weight_Buffer[1]+IFM_Buffer[2]*Weight_Buffer[2]+IFM_Buffer[3]*Weight_Buffer[3]+IFM_Buffer[4]*Weight_Buffer[4]
+IFM_Buffer[5]*Weight_Buffer[5]+IFM_Buffer[6]*Weight_Buffer[6]+IFM_Buffer[7]*Weight_Buffer[7]+IFM_Buffer[8]*Weight_Buffer[8];
	end
	else begin
		out_valid <= 0;
		Out_OFM <= 0;
	end
end



endmodule
