/////////////////////////////////////////////////////////////////////////
// Project Name: Conv_3x3						   					   //
// Task Name   : Conv_3x3								  			   //
// Module Name : Conv_3x3                               	  		   //
// File Name   : TESTBED.v          TESTBED                	  		   //		               //
// Author      : TA	 		                                           //
// Revision History:                                                   //
/////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps
`include "PATTERN.v"


`ifdef RTL
  `include "Convolution_optimize_v3.v"
`endif

`ifdef GATE
  `include "Convolution_optimize_v3_SYN.v"
`endif


module TESTBED;
   //input
	wire clk;
	wire rst_n;
	wire in_valid;
	wire weight_valid;
	wire [15:0]In_IFM_1;
	wire [15:0]In_Weight_1;
	
	//output
	wire out_valid;
	wire [35:0] Out_OFM;

	
	
initial begin
  `ifdef RTL
    $fsdbDumpfile("Convolution_optimize_v3.fsdb");
    $fsdbDumpvars(0,"+mda");
    $fsdbDumpvars();
  `endif
  `ifdef GATE
    $sdf_annotate("./Netlist/Convolution_optimize_v3_SYN.sdf",u_Convolution_optimize_v3);
    $fsdbDumpfile("./Netlist/Convolution_optimize_v3_SYN.fsdb");
    $fsdbDumpvars(0,"+mda");
    $fsdbDumpvars();    
  `endif
end

`ifdef RTL	
Convolution_optimize_v3	u_Convolution_optimize_v3	(
		.clk(clk),
		.rst_n(rst_n),	
		.in_valid(in_valid),	
		.weight_valid(weight_valid),
		.In_IFM_1(In_IFM_1),
		.In_Weight_1(In_Weight_1),
		.out_valid(out_valid), 
		.Out_OFM(Out_OFM)
		);
`endif

`ifdef GATE
Convolution_optimize_v3	u_Convolution_optimize_v3	(
		.clk(clk),
		.rst_n(rst_n),	
		.in_valid(in_valid),
		.weight_valid(weight_valid),
		.In_IFM_1(In_IFM_1),
		.In_Weight_1(In_Weight_1),
		.out_valid(out_valid), 
		.Out_OFM(Out_OFM)
		);
`endif

PATTERN	u_PATTERN(
		.clk(clk),
		.rst_n(rst_n),	
		.in_valid(in_valid),
		.weight_valid(weight_valid),
		.In_IFM_1(In_IFM_1),
		.In_Weight_1(In_Weight_1),
		.out_valid(out_valid), 
		.Out_OFM(Out_OFM)
		);
		
endmodule
