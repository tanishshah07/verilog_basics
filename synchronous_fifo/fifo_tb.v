`include "sync_fifo.v"
module fifo_tb();
parameter DEP=8,
	  WID=4,
	  TP=10;
reg      [WID-1:0] data_in;
reg                clk,wr,rd,rstn;
wire     [WID-1:0] data_out;
wire               full,empty;
integer i,seed;
sync_fifo dut(.clk(clk),.wr(wr),.rd(rd),.rstn(rstn),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty));
initial forever #(TP/2) clk=~clk;

initial begin
clk=1'b1;
if ($test$plusargs("FULL_TEST")) begin
 reset();
 dinR(8);
 data_read(8);
 repeat(10) @(negedge clk);
end
if($test$plusargs("TEST_5")) begin
 //reset();
 dinR(5);
 wr=1'b0;
 repeat(10) @(negedge clk);
end
$finish;
end

//--------------------------tasks----------------------------------
task reset();
 begin
  rstn=1'b0;
  rd=1'b0;
  wr=1'b0;
  @(negedge clk);
  rstn=1'b1;
 end
endtask
//------------------------------------------------------------
task dinR(input integer n);
	begin
	 for(i=0;i<=n-1;i=i+1) begin
	  @(negedge clk);           //to provide data before the posedge
	  wr=1'b1;
	  data_in={$random(seed)};
	 end
	 @(negedge clk);   //for the last data to write && write enable to deassert
	 wr=1'b0;
	end
endtask
task data_read(input integer n);
	begin
		@(negedge clk);
		rd=1'b1;
		repeat(n) @(negedge clk);
		rd=1'b0;

	end
endtask
endmodule
