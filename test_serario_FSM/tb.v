`include "main.v"

module top();
reg clk,rst,in;
wire p,c,out;

main dut(.p(p),.c(c),.clk(clk),.rst(rst),.in(in));

initial forever #5 clk=~clk;

initial begin
clk=0;
reset();

// test case 4(10)
in=1;
@(negedge clk);
in=0;
@(negedge clk);
@(negedge clk);

//test case 1 (111)
in=1;
@(negedge clk);
in=1;
@(negedge clk);
in=1;
@(negedge clk);
@(negedge clk);
in=1;
@(negedge clk);

// test case 2(01)

in=0;
@(negedge clk);
in=1;
@(negedge clk);

// test case 3(00)
in=0;
@(negedge clk);
in=0;
// test case 4(10)
in=1;
@(negedge clk);
in=0;
@(negedge clk);
// test case 5(110)
in=1;
@(negedge clk);
in=1;
@(negedge clk);
in=1;
@(negedge clk);
in=0;

repeat(10) @(negedge clk);
$finish;



end
task reset();
	begin
	 rst=1;
	 @(negedge clk);
	 rst=0;

	end

endtask



endmodule
