#compilation
vlog sipo.v sipo_tb.v
vsim -novopt sipo_tb -suppress 12110
add wave -position insertpoint sim:/sipo_tb/dut/*
run -all
