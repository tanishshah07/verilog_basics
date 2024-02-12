`timescale 1ns/1ps


module top();
reg clk,reset,load;
reg [3:0] data;
wire [3:0] count;

main dut(.clk(clk),.reset(reset),.data(data),.count(count),.load(load));

initial forever #5 clk=~clk;  //clock generation

initial begin
{data,load,clk,reset}=7'b0000_001; //initializing
end
initial begin
 repeat(2) @(negedge clk);
 reset=0; 		// cheking the reset
 repeat(5) @(negedge clk);

data_loading(1,4'b1001,load); //loading data and again giving load to zero

repeat(5) @(negedge clk);

data_loading(1,4'b1110,load); //loading data and again giving load to zero checking at corner
repeat(5) @(negedge clk);
$finish(2);
end
initial $monitor("the count is %d , load is %b,data is %d at time %t",count,load,data,$time);


task data_loading (input in ,input[3:0] d_in,output out);
 begin
	load=in;
	data=d_in;
	@(negedge clk);
	out=1'b0;
 end
endtask



endmodule
