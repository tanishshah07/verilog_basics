# Compilation.....
vlog main.v
vsim -novopt main -suppress 12110
add wave -position insertpoint sim:/main/*
run -all
