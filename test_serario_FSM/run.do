# Compilation.....
vlog -coveropt 3 +acc +cover main.v tb.v 
vsim -vopt -coverage top -suppress 12110
add wave -position insertpoint sim:/top/dut/*
run -all
