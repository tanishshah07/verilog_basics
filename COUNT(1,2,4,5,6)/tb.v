`include "dff.v"
`include "main.v"
module top();
reg [2:0] d;
reg clk,rst;
wire [2:0] out;
main dut(.clk(clk),.rst(rst),.out(out),.d(d));
initial forever #5 clk=~clk;

initial begin
clk=0;
rst=1;
@(negedge clk);
rst=0;
d=3'd0;
repeat(20) @(negedge clk);
$finish;

end
endmodule
