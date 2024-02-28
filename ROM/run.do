# Compilation.....
vlog  rom_tb.v
vsim -novopt rom_tb -suppress 12110
add wave -position insertpoint sim:/rom_tb/dut/*
run -all
