# Compilation.....
vlog -coveropt 3 +acc +cover sync_fifo.v fifo_tb.v 
vsim -vopt -coverage fifo_tb -suppress 12110
add wave -position insertpoint sim:/fifo_tb/dut/*
run -all
