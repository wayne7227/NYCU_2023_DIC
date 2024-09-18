module Convolution_without_pipeline(
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
reg [1:0] cs,ns;
reg [5:0]Output_count;
reg [5:0]count;
reg [5:0]count2;
reg [35:0]Out_data;
reg [5:0] i;
 //  Use this buffer to store Weight
/////////////////////////////////////
parameter Idle =2'd0;
parameter Input =2'd1;
parameter Output = 2'd2;
////////Here just an example of how to use IFM_buffer & WEight_Buffer to store data////////
//The storage mechanism can be modified, but not the buffer size cannot be modified
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i=0;i<9;i=i+1) 
			Weight_Buffer[i] <= 0;
	end
	else if(weight_valid && count < 9)
		Weight_Buffer[count] <= In_Weight_1;
end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for (i=0;i<49;i=i+1) 
			IFM_Buffer[i] <= 0;
	end
	else if(in_valid && count < 49) begin
		IFM_Buffer[count]  <= In_IFM_1;
	end                

end
///////////////////////////////////////////////////////

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		cs <= Idle;
	else
		cs <= ns;
end

always@(*) begin
	case(cs)
		Idle: begin
			if(in_valid)
				ns=Input;
			else
				ns=Idle;
		end
		Input: begin
			if(count == 48)
				ns=Output;
			else 
				ns=Input;
		end
		Output: begin
			if(Output_count == 24)
				ns=Idle;
			else
				ns=Output;
		end
	endcase
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		Output_count<=0;
	else if(ns==2 && Output_count<24 )
		Output_count<=Output_count+1;
	else
		Output_count<=0;


end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		count <= 0;
	else if(in_valid==1 && count<48)
		count <= count +1;
	else
		count <= 0;

end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		out_valid <= 0;
	end
	else if(cs==Output) begin
		out_valid <= 1;
	end
	else begin
		out_valid <= 0;
	end
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		Out_OFM <= 0;
	end
	else if(cs==Output) begin
		Out_OFM <= Out_data;
	end
	else begin
		Out_OFM <= 0;
	end
end

always@(*) begin
	Out_data = IFM_Buffer[count2]*Weight_Buffer[0]+IFM_Buffer[count2+1]*Weight_Buffer[1]+IFM_Buffer[count2+2]*Weight_Buffer[2]
		  +IFM_Buffer[count2+7]*Weight_Buffer[3]+IFM_Buffer[count2+8]*Weight_Buffer[4]+IFM_Buffer[count2+9]*Weight_Buffer[5]
		  +IFM_Buffer[count2+14]*Weight_Buffer[6]+IFM_Buffer[count2+15]*Weight_Buffer[7]+IFM_Buffer[count2+16]*Weight_Buffer[8];
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
