module siso(input si ,input clk,input rst, output out);
reg [3:0]temp;
assign out = temp[3];
always@(posedge clk,posedge rst) begin
 if (rst) temp<=4'd0;
 else begin
  temp<=temp<<1;
  temp[0]<=si;
 end
end
endmodule
