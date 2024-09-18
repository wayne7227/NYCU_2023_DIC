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
reg counter;
reg [3:0] i;
reg[8:0] SE;
reg[8:0] SE_delay;
wire[9:0] clk_gate;
reg [15:0]Value_Buffer[0:8];


ICGx3_ASAP7_75t_R GATED_CG_U0(
	.CLK(clk),
	.ENA(0),
	.SE(SE[0]),
	.GCLK(clk_gate[0])
	);

ICGx3_ASAP7_75t_R GATED_CG_U1(
	.CLK(clk),
	.ENA(0),
	.SE(SE[1]),
	.GCLK(clk_gate[1])
	);

ICGx3_ASAP7_75t_R GATED_CG_U2(
	.CLK(clk),
	.ENA(0),
	.SE(SE[2]),
	.GCLK(clk_gate[2])
	);

ICGx3_ASAP7_75t_R GATED_CG_U3(
	.CLK(clk),
	.ENA(0),
	.SE(SE[3]),
	.GCLK(clk_gate[3])
	);

ICGx3_ASAP7_75t_R GATED_CG_U4(
	.CLK(clk),
	.ENA(0),
	.SE(SE[4]),
	.GCLK(clk_gate[4])
	);

ICGx3_ASAP7_75t_R GATED_CG_U5(
	.CLK(clk),
	.ENA(0),
	.SE(SE[5]),
	.GCLK(clk_gate[5])
	);

ICGx3_ASAP7_75t_R GATED_CG_U6(
	.CLK(clk),
	.ENA(0),
	.SE(SE[6]),
	.GCLK(clk_gate[6])
	);

ICGx3_ASAP7_75t_R GATED_CG_U7(
	.CLK(clk),
	.ENA(0),
	.SE(SE[7]),
	.GCLK(clk_gate[7])
	);

ICGx3_ASAP7_75t_R GATED_CG_U8(
	.CLK(clk),
	.ENA(0),
	.SE(SE[8]),
	.GCLK(clk_gate[8])
	);

ICGx3_ASAP7_75t_R GATED_CG_U9(
	.CLK(clk),
	.ENA(0),
	.SE(weight_valid),
	.GCLK(clk_gate[9])
	);


		
always@(posedge clk_gate[9] or negedge rst_n) begin
	if(!rst_n) begin
		Weight_Buffer[0] <= 0;
	end
	else if(weight_valid)
		begin
			Weight_Buffer[0] <= In_Weight_1;

		end
	else 
		begin
			Weight_Buffer[0] <= Weight_Buffer[0];
		end
end

always@(posedge clk_gate[9] or negedge rst_n) begin
	if(!rst_n) begin
		Weight_Buffer[1] <= 0;
	end
	else if(weight_valid)
		begin
			Weight_Buffer[1] <= In_Weight_2;

		end
	else 
		begin
			Weight_Buffer[1] <= Weight_Buffer[1];
		end
end

always@(posedge clk_gate[9] or negedge rst_n) begin
	if(!rst_n) begin
		Weight_Buffer[2] <= 0;
	end
	else if(weight_valid)
		begin
			Weight_Buffer[2] <= In_Weight_3;

		end
	else 
		begin
			Weight_Buffer[2] <= Weight_Buffer[2];
		end
end

always@(posedge clk_gate[9] or negedge rst_n) begin
	if(!rst_n) begin
		Weight_Buffer[3] <= 0;
	end
	else if(weight_valid)
		begin
			Weight_Buffer[3] <= In_Weight_4;

		end
	else 
		begin
			Weight_Buffer[3] <= Weight_Buffer[3];
		end
end

always@(posedge clk_gate[9] or negedge rst_n) begin
	if(!rst_n) begin
		Weight_Buffer[4] <= 0;
	end
	else if(weight_valid)
		begin
			Weight_Buffer[4] <= In_Weight_5;

		end
	else 
		begin
			Weight_Buffer[4] <= Weight_Buffer[4];
		end
end

always@(posedge clk_gate[9] or negedge rst_n) begin
	if(!rst_n) begin
		Weight_Buffer[5] <= 0;
	end
	else if(weight_valid)
		begin
			Weight_Buffer[5] <= In_Weight_6;

		end
	else 
		begin
			Weight_Buffer[5] <= Weight_Buffer[5];
		end
end

always@(posedge clk_gate[9] or negedge rst_n) begin
	if(!rst_n) begin
		Weight_Buffer[6] <= 0;
	end
	else if(weight_valid)
		begin
			Weight_Buffer[6] <= In_Weight_7;

		end
	else 
		begin
			Weight_Buffer[6] <= Weight_Buffer[6];
		end
end

always@(posedge clk_gate[9] or negedge rst_n) begin
	if(!rst_n) begin
		Weight_Buffer[7] <= 0;
	end
	else if(weight_valid)
		begin
			Weight_Buffer[7] <= In_Weight_8;

		end
	else 
		begin
			Weight_Buffer[7] <= Weight_Buffer[7];
		end
end

always@(posedge clk_gate[9] or negedge rst_n) begin
	if(!rst_n) begin
		Weight_Buffer[8] <= 0;
	end
	else if(weight_valid)
		begin
			Weight_Buffer[8] <= In_Weight_9;

		end
	else 
		begin
			Weight_Buffer[8] <= Weight_Buffer[8];
		end
end

always@(posedge clk_gate[0] or negedge rst_n) begin
	if(!rst_n) begin
		IFM_Buffer[0] <= 0;
	end
	else if(SE[0]) begin
		IFM_Buffer[0]  <= In_IFM_1;
		end
	else 	begin
		IFM_Buffer[0] <= IFM_Buffer[0];	
		
	end                

end

always@(posedge clk_gate[1] or negedge rst_n) begin
	if(!rst_n) begin
		IFM_Buffer[1] <= 0;
	end
	else if(SE[1]) begin
		IFM_Buffer[1]  <= In_IFM_2;
		end
	else 	begin
		IFM_Buffer[1] <= IFM_Buffer[1];	
		
	end                

end

always@(posedge clk_gate[2] or negedge rst_n) begin
	if(!rst_n) begin
		IFM_Buffer[2] <= 0;
	end
	else if(SE[2]) begin
		IFM_Buffer[2]  <= In_IFM_3;
		end
	else 	begin
		IFM_Buffer[2] <= IFM_Buffer[2];	
		
	end                

end

always@(posedge clk_gate[3] or negedge rst_n) begin
	if(!rst_n) begin
		IFM_Buffer[3] <= 0;
	end
	else if(SE[3]) begin
		IFM_Buffer[3]  <= In_IFM_4;
		end
	else 	begin
		IFM_Buffer[3] <= IFM_Buffer[3];	
		
	end                

end

always@(posedge clk_gate[4] or negedge rst_n) begin
	if(!rst_n) begin
		IFM_Buffer[4] <= 0;
	end
	else if(SE[4]) begin
		IFM_Buffer[4]  <= In_IFM_5;
		end
	else 	begin
		IFM_Buffer[4] <= IFM_Buffer[4];	
		
	end                

end

always@(posedge clk_gate[5] or negedge rst_n) begin
	if(!rst_n) begin
		IFM_Buffer[5] <= 0;
	end
	else if(SE[5]) begin
		IFM_Buffer[5]  <= In_IFM_6;
		end
	else 	begin
		IFM_Buffer[5] <= IFM_Buffer[5];	
		
	end                

end

always@(posedge clk_gate[6] or negedge rst_n) begin
	if(!rst_n) begin
		IFM_Buffer[6] <= 0;
	end
	else if(SE[6]) begin
		IFM_Buffer[6]  <= In_IFM_7;
		end
	else 	begin
		IFM_Buffer[6] <= IFM_Buffer[6];	
		
	end                

end

always@(posedge clk_gate[7] or negedge rst_n) begin
	if(!rst_n) begin
		IFM_Buffer[7] <= 0;
	end
	else if(SE[7]) begin
		IFM_Buffer[7]  <= In_IFM_8;
		end
	else 	begin
		IFM_Buffer[7] <= IFM_Buffer[7];	
		
	end                

end

always@(posedge clk_gate[8] or negedge rst_n) begin
	if(!rst_n) begin
		IFM_Buffer[8] <= 0;
	end
	else if(SE[8]) begin
		IFM_Buffer[8]  <= In_IFM_9;
		end
	else 	begin
		IFM_Buffer[8] <= IFM_Buffer[8];	
		
	end                

end


always@(posedge clk) begin
	/*if(!rst_n)
		counter<=0;
	else */if(in_valid)
		counter<=1;
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
		Out_OFM <= Value_Buffer[0] + Value_Buffer[1] + Value_Buffer[2] + Value_Buffer[3] + Value_Buffer[4] + Value_Buffer[5] + Value_Buffer[6] + Value_Buffer[7] + Value_Buffer[8] ;
	end
	else begin
		out_valid <= 0;
		Out_OFM <= 0;
	end
end

always@(*)begin
	if(In_IFM_1==0)
		SE[0]=0;
	else 
		SE[0]=1;
	if(In_IFM_2==0)
		SE[1]=0;
	else 
		SE[1]=1;
	if(In_IFM_3==0)
		SE[2]=0;
	else 
		SE[2]=1;
	if(In_IFM_4==0)
		SE[3]=0;
	else 
		SE[3]=1;
	if(In_IFM_5==0)
		SE[4]=0;
	else 
		SE[4]=1;
	if(In_IFM_6==0)
		SE[5]=0;
	else 
		SE[5]=1;
	if(In_IFM_7==0)
		SE[6]=0;
	else 
		SE[6]=1;
	if(In_IFM_8==0)
		SE[7]=0;
	else 
		SE[7]=1;	
	if(In_IFM_9==0)
		SE[8]=0;
	else 
		SE[8]=1;
end
always@(posedge clk)begin
		/*if(!rst_n) 
			SE_delay <= 0;
		else */
			SE_delay <= SE;
end

always@(*)begin
	if(SE_delay[0]==1 & Weight_Buffer[0]!=0)
	Value_Buffer[0] <= IFM_Buffer[0]*Weight_Buffer[0];
	else 
	Value_Buffer[0] <= 0;	
	if(SE_delay[1]==1 & Weight_Buffer[1]!=0)
	Value_Buffer[1] <= IFM_Buffer[1]*Weight_Buffer[1];
	else 
	Value_Buffer[1] <= 0;
	if(SE_delay[2]==1 & Weight_Buffer[2]!=0)
	Value_Buffer[2] <= IFM_Buffer[2]*Weight_Buffer[2];
	else 
	Value_Buffer[2] <= 0;
	if(SE_delay[3]==1 & Weight_Buffer[3]!=0)
	Value_Buffer[3] <= IFM_Buffer[3]*Weight_Buffer[3];
	else 
	Value_Buffer[3] <= 0;
	if(SE_delay[4]==1 & Weight_Buffer[4]!=0)
	Value_Buffer[4] <= IFM_Buffer[4]*Weight_Buffer[4];
	else 
	Value_Buffer[4] <= 0;
	if(SE_delay[5]==1 & Weight_Buffer[5]!=0)
	Value_Buffer[5] <= IFM_Buffer[5]*Weight_Buffer[5];
	else 
	Value_Buffer[5] <= 0;
	if(SE_delay[6]==1 & Weight_Buffer[6]!=0)
	Value_Buffer[6] <= IFM_Buffer[6]*Weight_Buffer[6];
	else 
	Value_Buffer[6] <= 0;
	if(SE_delay[7]==1 & Weight_Buffer[7]!=0)
	Value_Buffer[7] <= IFM_Buffer[7]*Weight_Buffer[7];
	else 
	Value_Buffer[7] <= 0;
	if(SE_delay[8]==1 & Weight_Buffer[8]!=0)
	Value_Buffer[8] <= IFM_Buffer[8]*Weight_Buffer[8];
	else 
	Value_Buffer[8] <= 0;
end

endmodule

