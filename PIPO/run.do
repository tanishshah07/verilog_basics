# Compilation.....
vlog pipo_tb.v
vsim -novopt pipo_tb -suppress 12110
add wave -position insertpoint sim:/pipo_tb/dut/*
run -all
