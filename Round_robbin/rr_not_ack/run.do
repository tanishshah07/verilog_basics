#compilation
vlog -coveropt 3 +acc +cover rr.v rr_tb.v
vsim -vopt -coverage rr_tb -suppress 12110 +priority +S0 +S1 +S2 +S3 +reset_on_fly -c -do "coverage save -onexit -directive -cvg -codeall round.ucdb; exit"
#vsim -vopt -coverage rr_tb -suppress 12110 +S1
#coverage exclude -srcfile rr.v -linerange 68-70 117-119 167-169 217-219  
add wave -position insertpoint sim:/rr_tb/grant_exp
add wave -position insterpoint sim:/rr_tb/flag
add wave -position insertpoint sim:/rr_tb/dut/*
run -all

