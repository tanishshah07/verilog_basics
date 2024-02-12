`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 16:04:39
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
reg [9:0]in;
wire [1023:0] out;
integer i;
main dut(.in(in),.out(out));


initial begin
	for(i=0;i<1024;i=i+1)begin
	 in[9:0]=i;
	#1; 
	end
	$finish;
end
initial begin
$monitor("the input is %d , output is %0d",in,out);
end

endmodule
