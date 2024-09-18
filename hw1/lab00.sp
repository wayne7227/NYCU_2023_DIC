
.option probe post

mnmos vd vg 0 0 NMOS m=1
mpmos 0 vg vd vd PMOS m=1
vg vg 0 0
vdd vd 0 0.7

.probe dc id(mnmos) id(mpmos)
.inc '16mos.pm' 
.dc vg 0 0.7 0.01
.end
