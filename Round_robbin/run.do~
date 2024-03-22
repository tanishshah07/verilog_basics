#compilation
vlog -coveropt 3 +acc +cover rr.v rr_tb.v
vsim -vopt -coverage rr_tb -suppress 12110 +S3
add wave -position insertpoint sim:/rr_tb/dut/*
run -all 
