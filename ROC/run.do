# Compilation.....
vlog  roc_tb.v
vsim -novopt roc_tb -suppress 12110
add wave -position insertpoint sim:/roc_tb/dut/*
run -all
