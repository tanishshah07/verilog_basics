module deco(input [2:0] in,
	    input ena,
            output reg [7:0] out
           );

always@(in,ena) begin
  out={8{1'b0}};
 if (ena) begin
  out[in]=1'b1;
 end
end
endmodule
