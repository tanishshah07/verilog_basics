# Compilation.....
vlog RAM_1KB.sv ram_tb_1024.v
vsim -novopt ram_tb_1024 -suppress 12110
add wave -position insertpoint sim:/ram_tb_1024/dut/*
run -all
