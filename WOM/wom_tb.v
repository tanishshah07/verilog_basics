
module wom_tb();
parameter DW=8,
	  AW=4,
	  DEP=16;
reg               wr;       
reg      [DW-1:0] data;
reg      [AW-1:0] addr;
wire     [DW-1:0] data_out;

wom dut(.data(data),.addr(addr),.wr(wr),.data_out(data_out));
initial begin
wr=1'b1;
data=8'd5;
addr=4'd13;
#10;
wr=1'b0;
#10;
wr=1'b1;
data=8'hff;
#10;
wr=1'b0;
#10;
$finish;
end

always@(data_out) begin
 if(data_out[7]==1'b0 && data_out[5]==1'b0) begin
  $display("Write Only Memory test PASSED!!!");
 end
end



endmodule
