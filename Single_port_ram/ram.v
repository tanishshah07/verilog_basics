module ram(clk
           ,rstn
	   ,wr
	   ,data_in
	   ,addr
	   ,data_out);
parameter DEP=64;
parameter WID=16;
parameter ADD_W=6;

input wire clk,rstn,wr;
input wire [ADD_W-1:0] addr;
input wire [WID-1:0] data_in;
output reg [WID-1:0] data_out;

reg [WID-1:0] mem [0:DEP-1]; 
reg [$clog2(DEP):0] i;

always@(posedge clk,negedge rstn) begin
 if(!rstn) begin
  for(i=0;i<DEP;i=i+1) begin
   mem[i]<=16'd0;
  end
 end
 else begin
	 if (wr==1'b1) begin
	  mem[addr]<=data_in;
	 end
	 if (wr==1'b0) begin
	  data_out<=mem[addr];
	 end
 end
end
endmodule
