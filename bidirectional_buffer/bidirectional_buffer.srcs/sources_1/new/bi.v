`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2024 14:58:28
// Design Name: 
// Module Name: bi
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


module bi(inout a,inout b ,input ctrl);


assign b=ctrl?a:1'bz;
assign a=ctrl?1'bz:b;



endmodule
