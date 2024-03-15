module async_fifo_tb();

parameter DEP=16,
	  DW=4;
reg           wclk,rclk,rstn,w_en,r_en;
reg  [DW-1:0] data_in;
wire [DW-1:0] data_out;
wire          full,empty,hf,amf,ame,of,uf;
integer i;
//-----------------------------------------
reg [DW-1:0] sfifo [0:DEP-1];
reg [DW:0] w_ptrs,r_ptrs;
async_fifo dut(.wclk(wclk),.rclk(rclk),.rstn(rstn),.w_en(w_en),.r_en(r_en),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty),.hf(hf),.ame(ame),.amf(amf),.uf(uf),.of(of));


//------------------mimicing_the_design--------------------------
/* 
initial begin
 forever @(posedge wclk,negedge rstn) begin
	if(!rstn)begin
	  {w_ptrs,r_ptrs,data_out,full,empty}=8'b0000_0001;
          for(i=0;i<DEP;i=i+1) begin
            sfifo[i]<=4'd0;
          end
        end
  else begin
	  gw_ptrs<={w_ptrs[DW],w_ptrs[DW-1:1]^w_ptrs[DW-1:0]};
	  if (w_en && !full) begin
	   sfifo[gw_ptrs[DW-1:0]]<=data_in;
	   w_ptrs<=w_ptrs+1'b1;
	  end
  end 
 end
end

initial begin
 forever@(posedge rclk,negedge rstn) begin
  if (!rstn)
 
 
 end
end*/
//--------------------------------------------------------------

initial forever #5 wclk=~wclk;
initial forever #10 rclk=~rclk;

initial begin
wclk=1'b1;
rclk=1'b1;
if($test$plusargs("sanity_test")) begin
 reset();
 dinR(16);
 data_read(16);
 repeat (10) @(negedge wclk);
end

if($test$plusargs("mix_test")) begin
 //reset();
 dinR(8);
 data_read(8);
 dinR(3);
 data_read(8);
 repeat (10) @(negedge wclk);
end
if($test$plusargs("simul_r_w")) begin
	reset();
 dinR(10);
 data_read(3);
 fork
  dinR(6);
  data_read(16);
 join
 repeat(10) @(negedge wclk);

end
$finish;
end

task reset();
begin
 rstn=1'b0;
 {w_en,r_en}=2'd0;
 @(negedge wclk);
 rstn=1'b1;
end
endtask

task dinR(input integer in);
 begin
   for(i=0;i<in;i=i+1) begin
   @(negedge wclk);
   w_en=1'b1;
   data_in={$random}%256;
   end
   @(negedge wclk);
   w_en=1'b0;
 end
endtask

task data_read(input integer n);
	begin
	   @(negedge rclk);
	   r_en=1'b1;
           repeat(n) @(negedge rclk);
	   r_en=1'b0;
	end
endtask
endmodule
