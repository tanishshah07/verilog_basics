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
parameter WIDTH=6;
reg clk;
reg rstn;
reg [WIDTH-1:0] data_in;
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
reset_n(); // calling reset
load_data(5'b00101);
n_delay(25);
reset_n();
load_data(5'b01101);
n_delay(70);
$finish;
end

task load_data(input [WIDTH-1:0]data); //loading data task
 begin
  load=1'b1;
  data_in=data;
  @(negedge clk);
  load=1'b0;
 end
endtask

task reset_n(); //reset task
 begin
  rstn=1'b0;
  @(negedge clk);
  rstn=1'b1;
 end
endtask



task n_delay(input integer i); //delay task
 begin
  repeat(i) @(negedge clk);
 end
endtask

endmodule
