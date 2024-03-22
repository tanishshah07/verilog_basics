module rr_tb();
reg clk,rstn;
reg [3:0] req;
wire [3:0] grant;

reg [3:0] grant_exp;
reg [3:0] reqs=4'b0000;
round_robin dut(.clk(clk),.rstn(rstn),.req(req),.grant(grant));

initial begin    // clock_Generation
clk=1'b1;
forever #5 clk=~clk;
end
//------------------------------------------------------------

initial begin
	forever @(posedge clk or negedge rstn) begin
	  if(!rstn) grant_exp<=4'd0;
	  else begin
		  /*if (!(|reqs)) begin
			  @(req);
			  reqs<={req[0],req[1],req[2],req[3]};
		  end*/
		  if(reqs[3]) begin
			  grant_exp<=4'd1;
			  reqs<=reqs>>1;
			  waitp(3);
			  /*if(req[1]) begin
				  grant_exp<=4'd2;
				  waitp(3);
			  end
			  else if(req[2]) begin
				  grant_exp<=4'd4;
				  waitp(3);
			  end
			  else if(req[3]) begin
				  grant_exp<=4'd8;
				  waitp(3);
			  end*/
		  end
	          else if(reqs[2]) begin
			  grant_exp<=4'd2;
			  reqs<=reqs>>1;
			  waitp(3);
			  /*if(req[2]) begin
				  grant_exp<=4'd4;
				  waitp(4);
			  end
			  else if(req[3]) begin
				  grant_exp<=4'd8;
				  waitp(3);
			  end
			  else if(req[0]) begin
				  grant_exp<=4'd1;
				  waitp(3);
			  end*/
	          end
	          else if(reqs[1]) begin
			  grant_exp<=4'd4;
			  reqs<=reqs>>1;
			  waitp(3);
			  /*if(req[3]) begin
				  grant_exp<=4'd8;
				  waitp(3);
			  end
			  else if(req[0]) begin
				  grant_exp<=4'd1;
				  waitp(3);
			  end
			  else if(req[2]) begin
				  grant_exp<=4'd2;
				  waitp(3);
			  end*/
		  end

	          else if(reqs[0]) begin
			  grant_exp<=4'd8;
			  reqs<=reqs>>1;
			  waitp(3);
			  /*if(req[0]) begin
				  grant_exp<=4'd1;
				  waitp(3);
			  end
			  else if(req[1]) begin
				  grant_exp<=4'd2;
				  waitp(3);
			  end
			  else if(req[2]) begin
				  grant_exp<=4'd4;
				  waitp(3);
			  end*/
	          end
	  end 
	end
end

initial begin
 forever @(grant,grant_exp) begin
   if(grant_exp==grant) $display("test is PASSED!! %t",$time);
   else $display("test FAILED    %t",$time);
 end
end

//------------------------------------------------------------
initial begin
reset();
if($test$plusargs("priority")) begin
 @(negedge clk);
 req=4'b1100;
 n_delay(8);
 req=4'b1110;
 n_delay(12);
 req=4'b1111;
 n_delay(16);
 req=4'b1000;
 n_delay(4);
end
if($test$plusargs("S0")) begin
@(negedge clk);
req=4'b0101;
n_delay(9);
 req=4'b1001;
 n_delay(8);
 req=4'b0011;
 n_delay(8);
 req=4'b0001;
 n_delay(4);
end

if($test$plusargs("S1")) begin
@(negedge clk);
req=4'b0110;
n_delay(9);
 req=4'b1010;
 n_delay(8);
 req=4'b0010;
 n_delay(3);
 req=4'b0001;
 n_delay(4);
 req=4'b0010;
 n_delay(5);
end

if($test$plusargs("S2")) begin
@(negedge clk);
req=4'b1100;
n_delay(9); // 4 + 4 cycle for 2 ones and 1 for ack 1 cycle for IDLE case 1 cycle for engedge on another req
 req=4'b0100;
 n_delay(3);
 req=4'b0001;
 n_delay(4);
 req=4'b0100;
 n_delay(3);
 req=4'b0010;
 n_delay(4);
 req=4'b0100;
 n_delay(5);
end

if($test$plusargs("S3")) begin
@(negedge clk);
 req=4'b1000;
 n_delay(3);
 req=4'b0001;
 n_delay(4);
  req=4'b1000;
 n_delay(3);
 req=4'b0010;
 n_delay(4);
 req=4'b1000;
 n_delay(3);
 req=4'b0100;
 n_delay(4);
 req=4'b1000;
 n_delay(8);
end
if ($test$plusargs("reset_on_fly")) begin : delay_block
	integer i;
	@(negedge clk);
        req=4'b1010;
 for (i=0;i<9;i=i+1) begin 
	 if(i==5) reset();
	 else @(negedge clk);
 end
end
//repeat(20) @(negedge clk);
$finish;
end

task reset();
	begin
	rstn=1'b0;
	@(negedge clk);
	rstn=1'b1;
end
endtask
task n_delay(input integer n);
begin
 repeat(n) @(negedge clk);
end
endtask

task waitp(input integer n);
	begin
           repeat(n) @(posedge clk);
	end
endtask
endmodule
