
`include "full_adder.v"
`include "adder.v"
module top();

reg [7:0]a;
reg [7:0]b;
reg cin;
wire [7:0] cout;
wire [7:0] sum;

full_adder dut(.sum(sum),.cout_out(cout),.a(a),.b(b),.cin(cin));
initial begin
 a=8'b1010_1110;
 b=8'b1100_0011;
 cin=1'b0;
 #10;
 $finish;
end
endmodule
