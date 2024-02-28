module rom(wr,rst,data,addr,data_out);
parameter DW=8,
	  AW=4,
	  DEP=16;
input wire          wr,rst;       
input wire [DW-1:0] data;
input wire [AW-1:0] addr;
output reg [DW-1:0] data_out;

reg [DW-1:0] mem [0:DEP-1];
reg [DW-1:0] mask;
reg [DW-1:0] temp1,temp2,defu;
integer i;

initial begin
 mask=8'b0101_1111; //7th and 5 th bits were read only memory for allindices
 defu=8'hff; //default data
 {temp1,temp2}=16'd0;
end

always@(*) begin
	if (rst) begin
	 for(i=0;i<16;i=i+1) begin
	  mem[i]=8'd0;
	 end
	end
	if(wr) begin
		temp1<=data&mask;
		temp2<=defu&(~mask);
	        mem[addr]<=temp1|temp2;
	end
 else if (!wr) data_out<=mem[addr];  
end

endmodule
