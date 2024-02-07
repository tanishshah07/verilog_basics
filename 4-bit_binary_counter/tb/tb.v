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

initial forever #5 clk=~clk;

initial begin
 clk=0;
 reset=1;
 #10;
 reset=0;
 #170;
 $finish;
end

initial begin
 $monitor("count is %d,reset is %d and time is %t",count,reset,$time);

end




endmodule
