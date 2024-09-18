
.option  post
.param vd =0.7


mpmos vo A vdd vdd PMOS w=30n l=16n
mnmos vo A 0 0  Nmos w=16n l=16n
vdd vdd vss vd
vss vss 0 0
vin A vss 0

.probe dc v(*) 
.inc 'asap7sc7p5t_INVBUF_RVT.sp' 
.inc '16mos.pm'
.dc vin 0 vd 0.001 
.end
