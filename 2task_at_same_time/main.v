module main();
integer a,b;
task setter(input integer a,output integer b);
 begin
  #10;
  b=2*a;
  $display("this is value from task of b is%d",b);
 end

endtask

function integer setter_A(input integer a);
 begin
  setter_A=2*a;
 end

endfunction


initial begin
//setter(2,b);
a=setter_A(4);
$display("this is from initial a=%d",a);
//$display("this is from initial b=%d",b);
end
initial begin
#5;
//setter(13,a);
b=setter_A(7);
$display("this is from initial b=%d",b);
//$display("this is from initial a=%d",a);


end


endmodule
