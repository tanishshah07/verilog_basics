module main();
//writing 2,8,11 bit to zero of each index
reg [15:0] arr[0:11];
integer i,j;
initial begin
	for (i=0;i<12;i=i+1) begin
	 arr[i]={$random}%65535;
	end
end

initial begin
 for(i=0;i<12;i=i+1) begin
	 for (j=15;j>=0;j=j-1) begin
	   if(j==2||j==8||j==11) begin
	     arr[i][j]=1'b0;
	   end
	 end
 end

 $display("%p",arr);
end
initial begin
 for(i=0;i<12;i=i+1) begin
	 for (j=15;j>=0;j=j-1) begin
	   if(j==2||j==8||j==11) begin
		   if(arr[i][j]==1'b0) begin
		    $display("TEST PASSED!!");
		   end
	   end
	 end
 end
end






endmodule
