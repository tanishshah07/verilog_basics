# Compilation.....
vlog display.v
vsim -novopt event_queue -suppress 12110
add wave -position insertpoint sim:/event_queue/*
run -all
