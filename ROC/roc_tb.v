`include "roc.v"
module roc_tb();
parameter DW=8,
	  AW=4,
	  DEP=16;
reg               clk,wr,rst;       
reg      [DW-1:0] data;
reg      [AW-1:0] addr;
wire     [DW-1:0] data_out;

roc dut(.rst(rst),
	.wr(wr),
	.clk(clk),
	.data(data),
	.addr(addr),
	.data_out(data_out));

initial forever #5 clk=~clk;
initial begin
clk=1'b1;
rst=1'b1;
@(negedge clk);
rst=1'b0;
wr=1'b1;
data=8'b0101_0001;
addr=4'd8;
@(negedge clk);
wr=1'b0;
@(negedge clk);
wr=1'b0;
@(negedge clk);

$finish;
end
endmodule
