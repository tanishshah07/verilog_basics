`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2024 14:29:18
// Design Name: 
// Module Name: 4x1mux
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

module mux4x1(output out,
input [3:0] in ,
input [1:0] sel);

assign out=(sel[1])?(sel[0]?in[3]:in[2]):(sel[0]?in[1]:in[0]);
endmodule

