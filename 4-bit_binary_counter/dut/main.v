`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 12:47:34
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


module main(output [3:0]count,input wire reset,input wire clk);
reg [3:0] count;
always@(posedge clk,posedge reset) begin
 if(reset)
  count<=4'd0;
 else
  count<=count+1'b1;

end
endmodule
