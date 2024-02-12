`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 15:43:31
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


module main(input [IN-1:0] in,
            output reg [OUT-1:0] out
           );
parameter IN=10;
parameter OUT=1024;
always@(in) begin
out={1024{1'b0}};
out[in]=1'b1;
end
endmodule
