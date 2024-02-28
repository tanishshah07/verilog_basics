# Compilation.....
vlog tb_dual_port_ram.v
vsim -novopt tb_dual_port_ram -suppress 12110
add wave -position insertpoint sim:/tb_dual_port_ram/dut/*
run -all
