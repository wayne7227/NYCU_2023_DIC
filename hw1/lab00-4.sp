
.option  post
.param vd =0.7


mpmos vo A vdd vdd pmos_rvt m=4
mnmos vo A 0 0  nmos_rvt m=3
vdd vdd vss vd
vss vss 0 0
vin A vss 0

.probe dc v(*) 
.inc 'asap7sc7p5t_INVBUF_RVT.sp' 
.inc '7nm_TT.pm'tt
.dc vin 0 vd 0.001 
.end
