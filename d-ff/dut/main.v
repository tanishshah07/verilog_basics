`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2024 16:49:01
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


module main(input clk,input reset,input d,output q);

reg q;
always@(posedge clk,posedge reset) begin
 if (reset) begin
  q<=0;
 end
 else begin
  q<=d;
 end


end


endmodule
