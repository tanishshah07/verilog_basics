# Compilation.....
vlog fact.v
vsim -novopt facct -suppress 12110
add wave -position insertpoint sim:/facct/*
run -all
