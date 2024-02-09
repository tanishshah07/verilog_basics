`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 18:18:18
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main();
integer i,j,count;

// first pattern
/*
initial begin
count=0;
for(i=32'b1;i<32'd5;i=i+1'b1)begin
	for(j=0;j<=i;j=j+1'b1) begin
	 $write("%d",count);
	 count=count+1;
	end
	$display(" ");
end

end
*/
//second pattern
/*
initial begin
 i=0;
 j=0;
 count=0;
 while(i<=5) begin
  while(j<=i) begin
   $write("%d",j);
   j=j+1;
  end
  $display(" ");
  i=i+1;
  j=0;
 end
end
*/
/*
initial begin
 i=0;
 j=0;
 count=0;
 for(i=0;i<=5;i=i+1) begin
  for(j=0;j<=5;j=j+1) begin
   $write("%d",j);
   
  end
  $display(" ");
  
 end
end
*/
initial begin
i=1;
j=1;
count=0;
while(i<=5)begin
	count=5-i;
 while (count>0) begin
	 $write(" ");
	 count=count-1;
	 end
	 while(i>=j) begin
	  
	 $write("*");
	 j=j+1;
	 
	 end
 $display(" ");
 i=i+1;
 j=0;
end





end


endmodule
