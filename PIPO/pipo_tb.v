`include "pipo.v"
module pipo_tb();
parameter DW=4;
reg           clk,rstn;
reg  [DW-1:0] di;
wire [DW-1:0] do;

pipo dut(.clk(clk),.rstn(rstn),.data_in(di),.data_out(do));

initial forever #5 clk=~clk;

initial begin
clk=1'b1;
reset();
di=4'b0001;
@(negedge clk);
di=4'b0010;
@(negedge clk);
di=4'b0100;
@(negedge clk);
di=4'b1000;
repeat(10) @(negedge clk);
$finish;
end

task reset();
     begin
       rstn=1'b0;
       @(negedge clk);
       rstn=1'b1;
     end
endtask
endmodule
