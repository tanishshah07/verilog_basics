# Compilation.....
vlog main_odd.v
vsim -novopt main_odd -suppress 12110
add wave -position insertpoint sim:/main_odd/*
run -all
