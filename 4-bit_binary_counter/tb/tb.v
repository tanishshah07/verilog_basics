`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 12:52:51
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
wire [3:0] count;
reg clk,reset;

main dut(.clk(clk),.count(count),.reset(reset));

initial forever #5 clk=~clk;  // clock generation

initial begin
 clk=0;   //inititallizing clock
 reset=1; //applying reset to make output in zero state
 @(negedge clk);
 reset=0;
 repeat(20) @(negedge clk);
 reset=1;
 @(negedge clk);
 $finish;
end

initial begin
 $monitor("count is %d,reset is %d and time is %t",count,reset,$time); //checking the values


end
endmodule
