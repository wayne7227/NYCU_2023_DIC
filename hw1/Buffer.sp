.subckt inverter in out
	Mp  out  in  VDD  x  pmos_rvt  m=1
	Mn  out  in  GND  x  nmos_rvt  m=1
.ends
.subckt buffer in out
	X_INV1 in   in_b inverter
	X_INV2 in_b out  inverter
.ends