`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2024 15:06:10
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
reg con;
wire a;
wire b;
reg da,db;

bi dut(.ctrl(con),.a(a),.b(b));
assign a=con?da:1'bz;
assign b=con?1'bz:db;

initial begin
 con=1'b1;
 da=1;
 db=0;

#10;
con=1'b0;
da=0;
db=1;
end

endmodule
