#compilation
vlog piso.v piso_tb.v
vsim -novopt piso_tb -suppress 12110
add wave -position insertpoint sim:/piso_tb/dut/*
run -all

