
.option  post
.param vd =0.7
.global vdd
.param fin=1e9

x4 VSS VDD A B Y NOR2xp33_ASAP7_75t_R
x1 VSS VDD A B D NAND2xp33_ASAP7_75t_R 

x2 vin A buffer
x3 vinn B buffer
x6 Y L inverter
x7 Y L inverter
x8 Y L inverter
x9 Y L inverter
x10 D P inverter
x11 D P inverter
x12 D P inverter
x13 D P inverter
c0 L vss 10f
c1 P vss 10f

vdd vdd vss vd
vss vss 0 0
vin vin 0 pul(0 vd 0 10p 10p '1/fin/2-10p' '1/fin')
vinn vinn 0 pul(0 vd 0 10p 10p '1/fin/2*2-10p' '1/fin*2')


.probe tran v(*) 
.meas TRAN Tr trig v(L) val='vd*0.1' rise=3 targ v(L) val='vd*0.9' rise=3
.meas TRAN Tf trig v(L) val='vd*0.9' fall=3 targ v(L) val='vd*0.1' fall=3
.meas TRAN Tplh trig v(vin) val='vd/2' fall=2 targ v(L) val='vd/2' rise=1
.meas TRAN Tphl trig v(vin) val='vd/2' rise=3 targ v(L) val='vd/2' fall=1
	
.meas TRAN Tr2 trig v(P) val='vd*0.1' rise=3 targ v(P) val='vd*0.9' rise=3
.meas TRAN Tf2 trig v(P) val='vd*0.9' fall=3 targ v(P) val='vd*0.1' fall=3
.meas TRAN Tplh2 trig v(vin) val='vd/2' fall=1 targ v(P) val='vd/2' rise=1
.meas TRAN Tphl2 trig v(vin) val='vd/2' rise=3 targ v(P) val='vd/2' fall=1
	
.inc 'asap7sc7p5t_INVBUF_RVT.sp'
.inc 'asap7sc7p5t_SIMPLE_RVT.sp'
.inc 'Buffer.sp'
.inc '7nm_TT.pm' tt
.tran 1p '21*1/fin' 

.end
