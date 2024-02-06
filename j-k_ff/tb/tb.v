`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2024 17:21:06
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
reg clk,j,k,reset;
wire q;
main dut(.clk(clk),.reset(reset),.j(j),.k(k),.q(q));

initial forever #5 clk=~clk;
initial {j,k,clk,reset}=4'b0000;
initial begin
 clk=1'b0;
 #10;
 {j,k}=2'b10;
 #10;
 {j,k}=2'b00;
 #10;
{j,k}=2'b01;
#10;
{j,k}=2'b11;
#20;
reset=1'b1;
#10;
$finish;
end

endmodule
