`include "ram.v"
module top();
parameter DEP=64;
parameter WID=16;
parameter ADD_W=6;
parameter TP=10;
reg clk,rstn,wr;
reg [ADD_W-1:0] addr;
reg [WID-1:0] data_in;
wire [WID-1:0] data_out;
integer i;

ram dut(.clk(clk),.rstn(rstn),.wr(wr),.addr(addr),.data_in(data_in),.data_out(data_out));
//--------------------------------------------------
initial forever #(TP/2) clk=~clk;
initial begin
clk=0;
reset(); ///reset_INITIAL
//=-----------Extreme_Cases-----------------------------------------------
write(1'b1,6'd0,16'hffff);
read(1'b0,6'd0);
write(1'b1,6'd63,16'd0);
read(1'b0,6'd63);
//------------------------------------------------------------------------

//-------------------Back_2_Back------------------------------------
for(i=0;i<DEP;i=i+1) begin
 write(1'b1,i,{$random}%65536);
 read(1'b0,i);
end
//-------------------Full_&_Empty---------------------------------------------
for(i=0;i<DEP;i=i+1) begin
 write(1'b1,i,{$random}%65536);
end
for(i=0;i<DEP;i=i+1) begin
 read(1'b0,i);
end
//---------------in_between_reset----------------------------------------------
for(i=0;i<DEP;i=i+1) begin
 if(i==7) reset();
 else begin
  write(1'b1,i,{$random}%65536);
  read(1'b0,i);
  end
end
//----------------------------------------------------------------
write(1'b1,{$random}%64,{$random}%65536);
read(1'b0,{$random}%64);
//------------------------------------
write(1'b0,6'd17,16'hf0f0);  
read(1'b1,6'd17);


$finish;
end
//----------------------------------------------------------------


//------------------tasks-----------------------------------------
task write(input enb,input [ADD_W-1:0] add,input [WID-1:0] data);
 begin
  @(negedge clk);
  wr=enb;
  addr=add;
  data_in=data;
 end
endtask

task read(input enbn,input [ADD_W-1:0] add);
 begin
  @(negedge clk);
  wr=enbn;
  addr=add;
 end
endtask


task reset();
 begin
  rstn=0;
  @(negedge clk);
  rstn=1;
 end
endtask
endmodule
