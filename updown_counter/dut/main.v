`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 13:54:13
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


module main (output reg [3:0] count,input wire up_dwn,input wire reset,input wire clk);

always@(posedge clk,posedge reset) begin
 if(up_dwn==1'b1) begin
	 if(reset) count<=4'd0;
	 else if(count==4'hb) count<=4'd0;
	 else begin
		 count<=count+1'b1;
	end
end
else if(up_dwn==1'b0) begin
 if(reset) count<=4'hf;
 else if(count==4'd3) count<=4'hf;
 else begin
  count<=count-1'b1;
 end
end
end

endmodule
