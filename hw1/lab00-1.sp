
.option probe post

mnmos vd vg 0 0 NMOS w=16n l=16n 
mpmos 0 vg vd vd PMOS w=16n l=16n
vg vg 0 0
vdd vd 0 0.7

.probe dc id(mnmos) id(mpmos)
.inc '16mos.pm' 
.dc vg 0 0.7 0.01
.end
