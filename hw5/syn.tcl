#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
#
#======================================================

#======================================================
#  Set Libraries
#======================================================

set search_path { 
       ./ \
       /home/RAID2/COURSE/dic/dic122/hw5  }
                               
set synthetic_library {dw_foundation.sldb}
set link_library {* dw_foundation.sldb standard.sldb asap7sc7p5t_AO_RVT_TT_08302018.db asap7sc7p5t_OA_RVT_TT_08302018.db asap7sc7p5t_INVBUF_RVT_TT_08302018.db asap7sc7p5t_SEQ_RVT_TT_08302018.db asap7sc7p5t_SIMPLE_RVT_TT_08302018.db asap7sc7p5t_AO_RVT_TT_08302018.db  asap7sc7p5t_OA_RVT_TT_08302018.db}
set target_library {asap7sc7p5t_INVBUF_RVT_TT_08302018.db asap7sc7p5t_SIMPLE_RVT_TT_08302018.db asap7sc7p5t_SEQ_RVT_TT_08302018.db} 


# set search_path {	./../01_RTL \
# 			/usr/cad/arm/CBDK_TSMC018_Arm_f1.0/CIC/SynopsysDC/db/ \
# 			/usr/cad/synopsys/synthesis/2019.12/libraries/syn/ }
# 				   
# set synthetic_library {dw_foundation.sldb}
# set link_library {* dw_foundation.sldb standard.sldb slow.db}
# set target_library {slow.db}


#======================================================
#  Global Parameters
#======================================================
set DESIGN "Convolution"
set CLK_period 1000.0
set IN_DLY  [expr 0.5*$CLK_period]
set OUT_DLY [expr 0.5*$CLK_period]

#======================================================
#  Read RTL Code
#======================================================
analyze -f sverilog Convolution.v 
elaborate Convolution 


#======================================================
#  Set Design Constraints
#======================================================

create_clock -name "clk" -period $CLK_period clk 
set_input_delay  [ expr $CLK_period*0.5 ] -clock clk [all_inputs]
set_output_delay [ expr $CLK_period*0.5 ] -clock clk [all_outputs]
set_input_delay 0 -clock clk clk
set_input_delay 0 -clock clk rst_n
# set_input_delay 0 -clock clk cg_en

set_load 0.05 [all_outputs]
set_max_delay $CLK_period -from [all_inputs] -to [all_outputs]

# set_dont_use slow/JKFF*
#======================================================
#  Optimization
#======================================================
uniquify
check_design > Report/Convolution.check
set_fix_multiple_port_nets -all -buffer_constants
set_fix_hold [all_clocks]
compile


#======================================================
#  Output Reports 
#======================================================
report_timing >  Report/Convolution.timing
report_area >  Report/Convolution.area
report_resource >  Report/Convolution.resource

#======================================================
#  Change Naming Rule
#======================================================
set bus_inference_style "%s\[%d\]"
set bus_naming_style "%s\[%d\]"
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed "a-z A-Z 0-9 _" -max_length 255 -type cell
define_name_rules name_rule -allowed "a-z A-Z 0-9 _[]" -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
change_names -hierarchy -rules name_rule

#======================================================
#  Output Results
#======================================================

set verilogout_higher_designs_first true
write -format verilog -output Netlist/Convolution_SYN.v -hierarchy

# set_annotated_delay 0 -cell -to [get_pins -filter "pin_direction == out" -of_objects [get_cells "GATED_*/U*" -filter "ref_name==OR2x2_ASAP7_75t_R"]]
# set_annotated_delay 0 -cell -to [get_pins -filter "pin_direction == out" -of_objects [get_cells "GATED_*/U*" -filter "ref_name==NAND2xp5_ASAP7_75t_R"]]
# set_annotated_delay 0 -cell -to [get_pins -filter "pin_direction == out" -of_objects [get_cells "GATED_*/U*" -filter "ref_name==INVx1_ASAP7_75t_R"]]

write_sdf -version 3.0 -context verilog -load_delay cell Netlist/Convolution_SYN.sdf -significant_digits 6
write_sdc Netlist/Convolution_SYN.sdc

#======================================================
#  Finish and Quit
#======================================================
report_area
report_timing
exit
