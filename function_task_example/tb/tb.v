`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 10:54:44
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();

wire sum;
wire carry;
reg a,b;
reg clk;
main dut(.clk(clk),.sum(sum),.carry(carry),.a(a),.b(b));
initial forever #5 clk=~clk; //clock generation
initial clk=0;

initial begin
a=1;
b=1;
repeat(5) @(negedge clk);
a=1;
b=0;
repeat(5)@(negedge clk);
$finish;
repeat(5)@(negedge clk);
end
endmodule
