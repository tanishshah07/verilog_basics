module tdpr(clk1
            ,clk2
	    ,rstn
	    ,cs
	    ,wra
	    ,wrb
	    ,dia
	    ,dib
	    ,addra
	    ,addrb
	    ,doa
	    ,dob);

parameter DEP =32;
parameter WID_D=4;
parameter WID_A=5;

input wire             cs,clk1,clk2,rstn;
input wire             wra,wrb;
input wire [WID_D-1:0] dia,dib;
input wire [WID_A-1:0] addra,addrb;
output reg [WID_D-1:0] doa,dob;

reg [WID_D-1:0] mem [0:DEP-1];  //Declarign an array
reg [WID_A:0] i;

//------------------Port_A---------------------------------------
always@(posedge clk1,negedge rstn) begin
	if(!rstn) begin
	  for(i=0;i<DEP;i=i+1) begin
	    mem[i]<=4'd0; 
	  end
        end
	else if(cs) begin
		if(wra) begin
		  mem[addra]<=dia;
		end
		else if (wra==1'b0) begin
		  doa<=mem[addra];
		end
	end
end
//------------------Port_B-----------------------------------------
always@(posedge clk2,negedge rstn) begin
	if(!rstn) begin
	  for(i=0;i<DEP;i=i+1) begin
	    mem[i]<=4'd0; 
	  end
        end
	else if(cs) begin
		if(wrb) begin
		  mem[addrb]<=dib;
		end
		else if (wrb==1'b0) begin
		  dob<=mem[addrb];
		end
	end
end
endmodule
