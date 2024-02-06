`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2024 16:54:37
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
reg d,reset,clk;
wire q;
main dut(.clk(clk),.d(d),.q(q),.reset(reset));

initial forever #5 clk=~clk;
initial begin
 clk=0;
 reset=0;
end
initial begin
 d=1'b1;
 #10;
 d=1'b0;
 #10;
 d=1'b1;
 #20;
 reset=1'b1;
 #10;
 $finish;
end

endmodule
