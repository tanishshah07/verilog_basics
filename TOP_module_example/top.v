module top();
wire a,b;
wire c,s;
HF d (.a(a),.b(b),.s(s),.c(c));
ha_tb tb (.a(a),.b(b),.c(c),.s(s));
endmodule
