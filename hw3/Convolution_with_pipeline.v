module Convolution_with_pipeline(
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
			if(count == 75)
				ns=Idle;
			else
				ns=Output;
		end
	endcase
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		count<=0;
	else if((ns==Input || ns==Output) && count<75)
		count<=count+1;
	else
		count<=0;


end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		out_valid <= 0;
	end
	else if(count>=51) begin
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
		Out_OFM <= RegW0 +((RegW1+RegW2)+(RegW3+RegW4))+((RegW5+RegW6)+(RegW7+RegW8));
	end
	else begin
		Out_OFM <= 0;
	end
end

always@(*) begin
	Output_count=count-49;

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

