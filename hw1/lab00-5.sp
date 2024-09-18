
.option  post
.param vd =0.7
.param fin=1e9
.global vdd

x1 in out buffer
x2 out outt inverter
x3 out outt inverter
x4 out outt inverter
x5 out outt inverter
c0 outt vss 10f

vdd vdd vss vd
vss vss 0 0
vin in 0 pul(0 vd 0 10p 10p '1/fin/2-10p' '1/fin')

.probe tran v(*) 

.inc '7nm_TT.pm'tt
.inc 'Buffer.sp'
.tran 1p '21*1/fin' 

.alter 
.param fin=2e9

.alter
.param fin=4e9

.end
