`include "sync_fifo.v"
module fifo_tb();
parameter DEP=8,
	  WID=4,
	  TP=10;
reg      [WID-1:0] data_in;
reg                clk,wr,rstn;
wire     [WID-1:0] data_out;
wire               full,empty;
integer i,seed;
sync_fifo dut(.clk(clk),.wr(wr),.rstn(rstn),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty));
initial forever #(TP/2) clk=~clk;

initial begin
clk=1'b1;
reset();
dinR(5);
wr=1'b0;
repeat(10) @(negedge clk);
$finish;
end

//------------------------------------------------------------
task reset();
 begin
  rstn=1'b0;
  @(negedge clk);
  rstn=1'b1;
 end
endtask

task dinR(input integer n);
	begin
	 for(i=0;i<=n;i=i+1) begin
	  @(negedge clk);
	  wr=1'b1;
	  data_in={$random(seed)};
	 end
	end
endtask

task doR(input integer n);
	begin
      
	end
endtask

endmodule
