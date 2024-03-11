module top();
reg clk,rst;
wire flag;
wire [3:0] count;
main dut(.clk(clk),.rst(rst),.flag(flag),.count(count));
initial forever #5 clk=~clk;
initial begin
clk=1'b1;
rst=1'b1;
@(negedge clk);
rst=1'b0;
repeat(20) @(negedge clk);
$finish;
end

endmodule
