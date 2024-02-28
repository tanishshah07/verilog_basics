module wom(data,wr,addr,data_out);

parameter DW=8,
	  AW=4,
	  DEP=16;
input               wr;       
input      [DW-1:0] data;
input      [AW-1:0] addr;
output reg [DW-1:0] data_out;

reg [DW-1:0] mem [0:DEP-1];
reg [DW-1:0] mask;
initial begin
 mask=8'b0101_1111;  //7th and 5 th bits were Write only memory
end
always@(*) begin
 if(wr)  mem[addr]<=data;
 else if (!wr) data_out<=(mem[addr] & mask);  //as we are doing WOM
end
endmodule

