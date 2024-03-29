`include "dual_port_ram.v"
module tb_dual_port_ram();

parameter DEP =32;
parameter WID_D=4;
parameter WID_A=5;

reg              cs,clk1,clk2,rstn;
reg              wra,wrb;
reg  [WID_D-1:0] dia,dib;
reg  [WID_A-1:0] addra,addrb;
wire [WID_D-1:0] doa,dob;
integer i;

tdpr dut(.clk1(clk1),
         .clk2(clk2),
	 .rstn(rstn),
	 .cs(cs),
	 .wra(wra),
	 .wrb(wrb),
         .dia(dia),
         .dib(dib),
         .addra(addra),
         .addrb(addrb),
         .doa(doa),
         .dob(dob));
initial forever #5 clk1=~clk1; //clock 1
initial forever #7 clk2=~clk2; //clock 2
//-------------------------------------------------------------------
initial begin
{clk1,clk2}=2'b00;
reset();  //initial reset

//----------------Extreme_Cases(simutaneously also)-----------------------------------------------
write_a(5'd31,4'd0);
read_a(5'd31);
write_b(5'd0,4'd15);
read_b(5'd0);

//simultaneously
fork
 write_a(5'd0,4'd12);
 write_b(5'd31,4'd10);
join
fork
 read_a(5'd0);
 read_b(5'd31);
join
//------------------multiple_read-----------------------------
//
for(i=0;i<32;i=i+2) begin
 write_b(i,{$random}%16);
 write_a(i+1,{$random}%16);
end
//-------------------multiple_Write------------------------------------------
for(i=0;i<32;i=i+2) begin
 read_b(i);
 read_a(i+1);
end
//--------------------Back_2_Back---------------------------------------------
for(i=0;i<32;i=i+1) begin
 write_a(i,{$random}%16);
 read_b(i);
end
//-------------Same_address_write(ERROR)--------------------------------

fork
 write_a(5'd12,4'd12);
 write_b(5'd12,4'd7);
join
fork
 read_a(5'd12);
 read_b(5'd12);
join


//-----------------------In_Between_reset()-----------------------
for(i=0;i<32;i=i+1) begin
	if(i==23) begin
	  reset();
	end
	else begin
          write_a(i,{$random}%16);
          read_b(i);
 end
end
//---------------------CS=0(Read,Write)------------------------
/*begin
 cs=1'b0;
 addra=5'd12;
 dia=4'd7;
 wra=1'b1;
 @(negedge clk1);
 wra=1'b0;
end
*/
//------------------------------------------------------------
//---------------------------------------------------------------
//-----------------------In_Between_Enable_lOw----------------------
for(i=0;i<32;i=i+1) begin
	if(i==12) begin
	  wra=1'b0;
	  wrb=1'b1;
	end
	else begin
          write_a(i,{$random}%16);
          read_b(i);
 end
end

repeat(10) @(negedge clk1);
$finish;
end
//-------------------------------------------------------------------

//--------------------------Tasks---------------------------------------------
task write_a(input [WID_A-1:0] addr,input [WID_D-1:0] data);
	begin
	  @(negedge clk1);
	  cs=1'b1;
	  wra=1'b1;
	  addra=addr;
          dia=data;
	  //err_s();

	end
endtask
task write_b(input [WID_A-1:0] addr,input [WID_D-1:0] data);
	begin
          @(negedge clk2);
	  cs=1'b1;
	  wrb=1'b1;
	  addrb=addr;
          dib=data;
          //err_s();
	end
endtask
task read_a(input [WID_A-1:0] addr);
	begin
	  @(negedge clk1);
	  cs=1'b1;
	  wra=1'b0;
          addra=addr;
	  //err_s();
	end
endtask
task read_b(input [WID_A-1:0] addr);
	begin
	  @(negedge clk2);
	  cs=1'b1;
	  wrb=1'b0;
          addrb=addr;
	  //err_s();
	end
endtask

task err_s();
	begin
		@(negedge clk1);
		if(addra==addrb) begin
		  $display("changing address");
		  addra={$random}%32;
		  addrb={$random}%32;
		end
	end
endtask

task reset();
     begin
       rstn=1'b0;
       @(negedge clk1);
       rstn=1'b1;
     end
endtask
endmodule
