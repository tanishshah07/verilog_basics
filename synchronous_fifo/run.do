# Compilation.....
vlog sync_fifo.v fifo_tb.v 
vsim -novopt fifo_tb -suppress 12110 +FULL_2 +mix_read_write
add wave -position insertpoint sim:/fifo_tb/dut/*
run -all
