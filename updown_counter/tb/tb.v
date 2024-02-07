`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 14:24:21
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
reg clk,up_dwn,reset;
wire [3:0]count;

main dut(.count(count),.clk(clk),.up_dwn(up_dwn),.reset(reset));

initial begin
 clk=0;
 reset=1;
 up_dwn=1;
 #10;
 reset=0;
 #120;
 reset=1;
 //up_dwn=0;//for down counting
 #10;
 $finish;

end

initial forever #5 clk=~clk;
initial $monitor("count is %d,reset=%d,up_dwn=%d,time is %t",count,reset,up_dwn,$time);


endmodule
