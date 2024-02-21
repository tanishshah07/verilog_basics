`include "mux.v"
`include "bigmux.v"
module top();
 
reg [31:0] in;
reg [4:0] sel;
wire out;

main dut(.in(in),.sel(sel),.out(out));

initial begin
in=32'h0000_0001;
sel=5'd0;
#1;
in=32'hffff_ffffd;
sel=5'd1;
#1;
in=32'h0000_0004;
sel=5'd2;
#1;
in=32'hffff_fff7;
sel=5'd3;
#1;
in=32'h0000_0010;
sel=5'd4;
#1;
in=32'hffff_ffdf;
sel=5'd5;
#1;
in=32'h0000_0040;
sel=5'd6;
#1;
in=32'hffff_ff7f;
sel=5'd7;
#1;
in=32'h0000_0100;
sel=5'd8;
#1;
in=32'hffff_fdff;
sel=5'd9;
#1;
in=32'h0000_0400;
sel=5'd10;
#1;
in=32'hffff_f7ff;
sel=5'd11;
#1;
in=32'h0000_1000;
sel=5'd12;
#1;
in=32'hffff_dfff;
sel=5'd13;
#1;
in=32'h0000_4000;
sel=5'd14;
#1;
in=32'hffff_7fff;
sel=5'd15;
#1;
in=32'h0001_0000;
sel=5'd16;
#1;
in=32'hfffd_ffff;
sel=5'd17;
#1;
in=32'h0004_0000;
sel=5'd18;
#1;
in=32'hfff7_ffff;
sel=5'd19;
#1;

in=32'h0010_0000;
sel=5'd20;
#1;
in=32'hffdf_ffff;
sel=5'd21;
#1;
in=32'h0040_0000;
sel=5'd22;
#1;
in=32'hff7f_ffff;
sel=5'd23;
#1;
in=32'h0100_0000;
sel=5'd24;
#1;
in=32'hfdff_ffff;
sel=5'd25;
#1;
in=32'h0400_0000;
sel=5'd26;
#1;
in=32'hf7ff_ffff;
sel=5'd27;
#1;
in=32'h1000_0000;
sel=5'd28;
#1;
in=32'hdfff_ffff;
sel=5'd29;
#1;
in=32'h4000_0000;
sel=5'd30;
#1;
in=32'h7fff_ffff;
sel=5'd31;
#1;


$finish;
end
endmodule
