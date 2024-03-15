module sync_fifo(clk,wr,rd,rstn,data_in,data_out,full,empty,hf);
parameter DEP=8,
	  WID=4;
input  wire [WID-1:0] data_in;
input  wire           clk,wr,rd,rstn;
output reg  [WID-1:0] data_out;
output reg full,empty,hf;
reg [WID-1:0] fifo [0:DEP-1];
reg [WID-1:0] i,wr_ptr,r_ptr=0;
always@(posedge clk,negedge rstn) begin
 if(!rstn) begin
   {wr_ptr,r_ptr,data_out}=6'd0;
   for(i=0;i<DEP;i=i+1) begin
     fifo[i]<=4'd0;
   end
 end
 else begin
	 if(wr && !full) begin
	  fifo[wr_ptr[WID-2:0]]<=data_in;
	  wr_ptr<=wr_ptr+1'b1;
	  if(wr_ptr[2:0]-r_ptr[2:0]==(DEP/2)-1) hf<=1'b1;
	  else hf<=0;
	  empty<=1'b0;
	 end
	 if (rd && !empty) begin
	  data_out<=fifo[r_ptr[WID-2:0]];
	  r_ptr<=r_ptr+1'b1;
	  if(r_ptr[2:0]-wr_ptr[2:0]==(DEP/2)-1) hf<=1'b1;
          else  hf<=0;
	  full<=1'b0;
         end
	 if(wr_ptr==r_ptr) begin
	  empty<=1'b1;
	 end
	 else begin
	  empty<=1'b0;
	 end
         if(wr_ptr[WID-1]!=r_ptr[WID-1] && r_ptr[WID-2:0]==wr_ptr[WID-2:0]) begin
	  full<=1'b1;
	 end
	 else begin
	  full<=1'b0;
	 end
	/* if({r_ptr[WID-2:0]-wr_ptr[WID-2:0]}==(DEP/2)-1'b1) begin
	   hf<=1'b1;
	 end
	 else begin
	   hf<=1'b0;
	 end */

 end
end

endmodule
