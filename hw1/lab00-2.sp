
.option  post
.param vd =0.4

x1 VSS VDD A Y INVxp33_ASAP7_75t_R 
vdd vdd vss vd
x2 VSS VDD A Y2 INVx13_ASAP7_75t_R
vss vss 0 0
vin A vss 0

.probe dc v(*) 
.inc 'asap7sc7p5t_INVBUF_RVT.sp' 
.inc '7nm_TT.pm'
.dc vin 0 vd 0.001 sweep vd 0.4 0.7 0.1
.end
