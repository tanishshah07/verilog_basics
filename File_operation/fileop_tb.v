`include "fileop.v"
module  fileop_tb();

	reg clk,wr,rst;
	wire [7:0] d;

	fileop dut(clk,wr,rst,d);
	
	initial 
		forever #5 clk = ~clk;

	initial begin 
		clk = 1'b0;
		rst = 1'b1;

		@(negedge clk);

		rst = 1'b0;
		wr = 1'b1;

		repeat(6) @(negedge clk);
		wr = 1'b0;
		
		repeat(6) @(negedge clk);

		$finish;
	end

endmodule
