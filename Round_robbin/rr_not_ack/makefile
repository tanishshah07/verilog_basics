
#Makefile

vlog :
	vlog -coveropt 3 +acc +cover rr.v rr_tb.v

vsimr :
	vsim -vopt -coverage rr_tb -suppress 12110 +priority +S0 +S1 +S2 +S3 +reset_on_fly -c -do "coverage save -onexit -directive -cvg -codeall round.ucdb; run -all ; exit" -l regress.log

vsimp :
	vsim -vopt -coverage rr_tb -suppress 12110 +priority -c -do "coverage save -onexit -directive -cvg -codeall p.ucdb; run -all; exit"


vsimS0 :
	vsim -vopt -coverage rr_tb -suppress 12110 +S0 -c -do "coverage save -onexit -directive -cvg -codeall S0.ucdb; run -all ;exit"

vsimS1 : 
	vsim -vopt -coverage rr_tb -suppress 12110 +S1 -c -do "coverage save -onexit -directive -cvg -codeall S1.ucdb; run -all ; exit"

vsimS2 :
	vsim -vopt -coverage rr_tb -suppress 12110 +S2 -c -do "coverage save -onexit -directive -cvg -codeall S2.ucdb; run -all ; exit"

vsimS3 : 
	vsim -vopt -coverage rr_tb -suppress 12110 +S3 -c -do "coverage save -onexit -directive -cvg -codeall S3.ucdb; run -all; exit"

vsimReset :
	vsim -vopt -coverage rr_tb -suppress 12110 +reset_on_fly -c -do "coverage save -onexit -directive -cvg -codeall Reset.ucdb; run -all ;exit"
merge :
	vcover merge rr.ucdb p.ucdb S0.ucdb S1.ucdb S2.ucdb S3.ucdb Reset.ucdb
	del p.ucdb S0.ucdb S1.ucdb S2.ucdb S3.ucdb Reset.ucdb
html :
	vcover report -html rr.ucdb -htmldir SIM

reset :
	vlog vsimReset

S0 :
	vlog vsimS0
S1 :
	vlog vsimS1

S2 :
	vlog vsimS2

S3 : 
	vlog vsimS3


regress : vlog vsimp vsimS0 vsimS1 vsimS2 vsimS3 vsimReset merge html
