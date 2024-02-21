`include "encoder.v"
module top();
parameter MX=8,MO=3;
reg [MX-1:0] in;
wire [MO-1:0] out;

encoder dut(.out(out),.in(in));
initial begin
in=8'b1111_1111;
#10;
in=8'b1111_1110;
#10;
in=8'b1111_1100;
#10;
in=8'b1111_1000;
#10;
in=8'b1111_0000;
#10;
in=8'b1110_0000;
#10;
in=8'b1100_0000;
#10;
in=8'b1000_0000;
#10;
end
endmodule

