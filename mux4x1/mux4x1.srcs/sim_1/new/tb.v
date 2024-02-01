`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2024 14:32:18
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
reg [3:0] in;
reg [1:0] sel;
wire out;

mux4x1 dut(.in(in),.sel(sel),.out(out));
initial begin
 in=4'b0001;
 sel=2'b00;
#10;
 in=4'b1101;
 sel=2'b01;
#10;
 in=4'b0100;
 sel=2'b10;
#10;
 in=4'b0111;
 sel=2'b11;
end

endmodule
