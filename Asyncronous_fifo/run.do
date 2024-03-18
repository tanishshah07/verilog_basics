# Compilation.....
vlog -coveropt 3 +acc +cover async_fifo.v async_fifo_tb.v 
vsim -vopt -coverage async_fifo_tb -suppress 12110 +sanity_test 
add wave -position insertpoint sim:/async_fifo_tb/dut/*
run -all