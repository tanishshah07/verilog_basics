module sync_fifo(clk,wr,rd,rstn,data_in,data_out,full,empty);
parameter DEP=8,
	  WID=4;
input  wire [WID-1:0] data_in;
input  wire           clk,wr,rd,rstn;
output reg  [WID-1:0] data_out;
output reg full,empty;
reg [WID-1:0] fifo [0:DEP-1];
reg [3:0] i,wr_ptr,r_ptr=0;
always@(posedge clk,negedge rstn) begin
 if(!rstn) begin
   {wr_ptr,r_ptr,data_out}=6'd0;
   for(i=0;i<8;i=i+1) begin
     fifo[i]<=4'd0;
   end
 end
 else begin
	 if(wr && !full) begin
	  fifo[wr_ptr]<=data_in;
	  wr_ptr<=wr_ptr+1;
	  empty<=1'b0;
	 end
	 if (rd && !empty) begin
	  data_out<=fifo[r_ptr[2:0]];
	  r_ptr[2:0]<=r_ptr[2:0]+1;
	  full<=1'b0;
         end
	 if(wr_ptr==r_ptr) begin
	  empty<=1'b1;
	 end
	 else begin
	  empty<=1'b0;
	 end
         if(wr_ptr[3]==1'b1 && r_ptr<1) begin
	  full<=1'b1;
	 end
	 else begin
	  full<=1'b0;
	 end
 end
end
//assign full=(wr_ptr[3]==1'b1)? 1'b1:4'b0;
//assign empty=(r_ptr==wr_ptr)? 1'b1:1'b0;
endmodule
