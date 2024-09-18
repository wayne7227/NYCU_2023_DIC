1.Environment setup: setenv LD_LIBRARY_PATH /RAID2/cad/synopsys/verdi/2019.06/share/PLI/IUS/linux64:$LD_LIBRARY_PATH
2.Presim: irun TESTBED.v -define RTL -debug -notimingchecks
3.Synthesis: dc_shell-t -f syn.tcl | tee syn.log
4.Posim: s
5.Measure power: pt_shell -f ptpx.tcl | tee CORE_power.log

