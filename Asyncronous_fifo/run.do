# Compilation.....
vlog -coveropt 3 +acc +cover async_fifo.v async_fifo_tb.v 
vsim -vopt -coverage async_fifo_tb -suppress 12110 +b2b 
#vsim -vopt -coverage async_fifo_tb -suppress 12110 +sanity_test +mix_test +half_test +simul_r_w +over_under +reset_on_fly
add wave -position insertpoint sim:/async_fifo_tb/dut/*
run -all
