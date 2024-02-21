`include "tff.v"
`include "counter.v"
module top();
reg clk;
reg rst;
reg [2:0] t;
wire [2:0] out;

tff_c dut(.clk(clk),.rst(rst),.t(t),.out(out));
initial begin
 clk=0;
 rst=0;
 @(negedge clk);
 rst=1;
 t=3'd7;
 repeat(20) @(negedge clk);
 $finish;
end

initial forever #5 clk=~clk;
endmodule
