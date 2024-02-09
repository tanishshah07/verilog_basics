`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 10:46:52
// Design Name: 
// Module Name: main
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


module main(output reg sum ,output reg carry,input wire clk,input wire a,input wire b);
wire test;
reg t1,t2;
assign test=print(7,7); //calling a function in continuous assignment

always@(a,b) begin
{carry,sum}=adder(a,b);
t1=print(sum,carry); // calling funtion in procedural assignment
end
function [1:0] adder(input a,b);
	begin
	 
		adder=a+b;
		t2=print(a,b);// calling a function in function
	end
endfunction

function print(x,y);
	begin
	$display("X is %d",x);
	$display("Y is %d",y);
	end
endfunction


endmodule
