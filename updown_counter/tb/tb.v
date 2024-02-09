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
///--------------------------------test cases we are covering -----------------------------\\\\\\
//--->>reset the counter in both the cases(up & down)
//--->>Back to Back up_down High and Low
//--->>Checking Down Counting
//--->>Checking Up Counting
//--->>Reset Priority
//

module tb();
reg clk,up_dwn,reset;
wire [3:0]count;

main dut(.count(count),.clk(clk),.up_dwn(up_dwn),.reset(reset));

initial begin
 clk=0;
 reset=1;
 up_dwn=1;
 @(negedge clk);
 reset=0;
 @(negedge clk);
 reset=1;
 up_dwn=0;
 repeat(5) @(negedge clk);
 reset=0;
 repeat(15) @(negedge clk);
 reset=1;
 @(negedge clk);
 reset=0;
 up_dwn=1;
 repeat(15) @(negedge clk);
 up_dwn=0;
 @(negedge clk);
 up_dwn=1;
 repeat(5) @(negedge clk);
 


 $finish;

end

initial forever #5 clk=~clk; // clock generation
initial $monitor("count is %d,reset=%d,up_dwn=%d,time is %t",count,reset,up_dwn,$time); //monitoring the counter


endmodule
