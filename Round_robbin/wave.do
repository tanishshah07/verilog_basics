onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /rr_tb/dut/grant
add wave -noupdate /rr_tb/dut/ack
add wave -noupdate /rr_tb/dut/clk
add wave -noupdate /rr_tb/dut/rstn
add wave -noupdate -radix binary /rr_tb/dut/req
add wave -noupdate /rr_tb/dut/state
add wave -noupdate /rr_tb/dut/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {63 ns} 0}
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
WaveRestoreZoom {0 ns} {425 ns}
