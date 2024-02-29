onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fileop/clk
add wave -noupdate /fileop/wr
add wave -noupdate /fileop/rst
add wave -noupdate /fileop/data_out
add wave -noupdate /fileop/i
add wave -noupdate -radix unsigned /fileop/j
add wave -noupdate -radix unsigned /fileop/k
add wave -noupdate /fileop/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1050 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {845 ns} {1099 ns}
