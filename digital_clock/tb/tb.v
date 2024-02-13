`timescale 1ms / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 19:21:25
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
reg clk,rstn;
wire [2:0] min,sec;
wire [3:0] hrs;

digital_clock dut(.clk(clk),.hrs(hrs),.min(min),.sec(sec),.rstn(rstn));

initial forever #5 clk=~clk;

initial begin
clk=0;
rstn=0;
@(negedge clk);
rstn=1;
repeat(200) @(negedge clk);

end

endmodule
