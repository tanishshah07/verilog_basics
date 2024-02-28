`timescale 1ns/1ns
`include "main.v"
module top();
reg clk,in,rst;
wire out;
mealy_00110 dut(.clk(clk), .rst(rst), .in(in), .out(out));

initial forever #5 clk=~clk;
initial begin
	clk=1'b0;
	rst=1'b1;
	@(negedge clk);
	rst=1'b0;
	in=1'b0;
	@(negedge clk);
	in=1'b0;
	@(negedge clk);
	in=1'b1;
	@(negedge clk);
	in=1'b1;
	@(negedge clk);
	in=1'b0;
	@(negedge clk);

	#20 $stop;
	end
	endmodule
