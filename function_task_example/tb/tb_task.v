`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 11:55:19
// Design Name: 
// Module Name: tb_task
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


module tb_task();

reg a,b;
wire sum,borrow;
reg clk;
main_task dut(.a(a),.b(b),.sum(sum),.borrow(borrow),.clk(clk));

initial forever #5 clk=~clk;

initial begin
clk=0;
a=1;
b=0;
delay_5();
a=1;
b=1;
delay_5();
end



task delay_5(); // task to call a delay of 5 cycles
 repeat(5) @(negedge clk);
endtask


endmodule
