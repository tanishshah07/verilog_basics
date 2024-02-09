`timescale 1ns/1ps


module top();
reg clk,reset,load;
reg [3:0] data;
wire [3:0] count;

main dut(.clk(clk),.reset(reset),.data(data),.count(count),.load(load));

initial forever #5 clk=~clk;  //clock generation

initial begin
{data,load,clk,reset}=7'b0000_001;
end
initial begin
 repeat(2) @(negedge clk);
 reset=0;
 repeat(5) @(negedge clk);
 load=1;
 data=4'b1011;
@(negedge clk);
load=0;
repeat(5) @(negedge clk);
$finish;
end
initial $monitor("the count is %d , load is %b,data is %d at time %t",count,load,data,$time);

endmodule
