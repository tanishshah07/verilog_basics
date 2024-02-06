`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2024 17:45:53
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


module main(output q,input wire j,input wire k,input wire reset,input clk);
 reg q;
 wire d;
 assign d=j&(~q) | q&(~k);
 always@(posedge clk,posedge reset) begin
  if(reset)
	  q<=0;
  else
	  q<=d;
 
 end


endmodule
