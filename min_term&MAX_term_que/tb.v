`include "main.v"

module top();
reg a,b,c,d;
wire out;
main dut(.a(a),.b(b),.c(c),.d(d),.out(out));

initial begin
 {a,b,c,d}=4'd6;
 #1;
 {a,b,c,d}=4'd0;
 #1;
 {a,b,c,d}=4'd7;
 #1;

 {a,b,c,d}=4'd8;
 #1;
 $finish;
end

endmodule
