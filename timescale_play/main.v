`timescale 100ns/1ps
module main();
reg clk,clk2;
parameter TP=4;
parameter real TPE=0.7518;
initial begin
clk=0;
clk2=0;
#1000;
$finish;


end
initial forever #37.59 clk2=~clk2;
//initial forever #(TP/2) clk=~clk;
endmodule
