`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2024 12:47:47
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
parameter TP=5;
reg clk;
reg rstn;
reg [5:0] data_in;
reg load;
wire data_out;
main tb(.clk(clk),
        .rstn(rstn),
	.data_in(data_in),
	.load(load),
	.data_out(data_out));

initial forever #(TP/2) clk=~clk;
initial begin
clk=0;
rstn=0;
load=0;
@(negedge clk);
rstn=1'b1;
load=1'b1;
data_in=6'b000010;
@(negedge clk);
load=1'b0;
repeat(20) @(negedge clk);
$finish;
end

endmodule
