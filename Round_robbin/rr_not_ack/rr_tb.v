module rr_tb();
reg clk,rstn;
reg [3:0] req;
wire [3:0] grant;

reg [3:0] grant_exp;
reg [3:0] flag=4'b0000;
round_robin dut(.clk(clk),.rstn(rstn),.req(req),.grant(grant));

initial begin    // clock_Generation
clk=1'b1;
forever #5 clk=~clk;
end
//------------------------------------------------------------

initial begin
	forever @(posedge clk or negedge rstn) begin
		if(!rstn) begin
			grant_exp<=4'd0;
			flag<=4'd0;
		end
	  else begin
		  if(req[0] && !flag[0]) begin
			  grant_exp<=4'd1;
			  flag[0]<=1'b1;
			  waitp(3);
			  if (!(req[1] || req[2] || req[3])) begin
			    flag<=4'd0;
			  end
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
	          else if(req[1] && !flag[1]) begin
			  grant_exp<=4'd2;
			  flag[1]<=1'b1;
			  waitp(3);
			  if (!(req[2] || req[3])) begin
			    flag<=4'd0;
			  end

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
	          else if(req[2] && !flag[2]) begin
			  grant_exp<=4'd4;
			  flag[2]<=1'b1;
			  waitp(3);
			  if (!req[3]) begin
			    flag<=4'd0;
			  end

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

	          else if(req[3] && !flag[3]) begin
			  grant_exp<=4'd8;
			  flag[3]<=1'b1;
			  waitp(3);
			  flag<=4'd0;
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
		  else begin
		    grant_exp<=4'd0;
		  end
	  end 
	end
end

initial begin
 forever @(grant,grant_exp) begin
	 #1;
   if(grant_exp==grant) $display("test is PASSED!! %t grant_exp=%d grant=%d",$time,grant_exp,grant);
   else $display("test FAILED    %t  grant_exp=%d grant=%d",$time,grant_exp,grant);
 end
end

//------------------------------------------------------------
initial begin
reset();
if($test$plusargs("priority")) begin //Checking the priority of the Masters
 @(negedge clk);  // giving req @ negedge
 req=4'b1000;
 n_delay(4);  // giving the delay as we have alloted 4 cycle for one 
 req=4'b1110;
 n_delay(12);
 req=4'b1100;
 n_delay(8);
 req=4'b1000;
 n_delay(4);
end
if($test$plusargs("S0")) begin //checking all the posibilities From S0
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

if($test$plusargs("S1")) begin //checking all the posibilities From S1
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

if($test$plusargs("S2")) begin //checking all the posibilities From S2
@(negedge clk);
req=4'b1100;
n_delay(9); 
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

if($test$plusargs("S3")) begin //checking all the posibilities From S3
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
if ($test$plusargs("reset_on_fly")) begin : delay_block  // reset in between
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
