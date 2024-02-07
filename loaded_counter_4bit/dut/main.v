`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 14:49:48
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


module main(output reg [3:0]count,input wire reset,input wire [3:0]data,input clk,input wire load);

always @(posedge clk) begin
 if(reset) count<=4'd0;
 else if (load) count<=data;
 else count<=count+1'b1;

end


endmodule
