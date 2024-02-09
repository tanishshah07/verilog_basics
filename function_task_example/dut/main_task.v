`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 11:44:38
// Design Name: 
// Module Name: main_task
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


module main_task(output reg sum,output reg borrow,input a, input b,input clk);
reg t1;
task sub(input a, input b,output sum,output borrow);
	begin
     {borrow,sum}=a-b;
	print(sum,borrow); //calling task inside a task
	@(negedge clk);
	t1=hello(sum);  //calling function inside a task
 end
endtask

task print(input x,y);
	begin
		$display("X is %d",x);
		$display("y is %d",y);
	end
endtask

function hello(any);
$display("Hello this is function inside a task");

endfunction




always@(a,b) begin
 sub(a,b,sum,borrow);
repeat(12) @(negedge clk);
$finish;
end
endmodule
