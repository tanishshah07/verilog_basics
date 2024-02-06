`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2024 17:10:53
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


module main(output q,
	input wire reset,
	input wire j,
	input wire k,
	input wire clk);

reg q;
wire [1:0]jk;
assign jk={j,k};
always@(posedge clk,posedge reset) begin
 if(reset) begin
  q<=0;
 end
 else begin
  case(jk)
	  2'b00:q<=q;
	  2'b01:q<=1'b0;
	  2'b10:q<=1'b1;
	  2'b11:q<=~q;
  endcase
 end

end

endmodule
