module pipo(clk,rstn,data_in,data_out);

parameter DW=4;
input wire          clk,rstn;
input wire [DW-1:0] data_in;
output reg [DW-1:0] data_out;

always@(posedge clk,negedge rstn) begin
 if (!rstn) begin
  data_out<='d0;
 end
 else begin
  data_out<=data_in;
 end
end
endmodule
