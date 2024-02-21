module main(input a,b,c,d
            ,output out);
wire [2:0] y;
/*
and(y[0],~a,b,~c);
and(y[1],a,~b,~d);
and(y[2],~c,~d);
or(out,y[1],y[0],y[2]);
*/

or(y[0],~c,~d);
or(y[1],b,~c);
or(y[2],a,~b,~d);
and(out,y[0],y[1],y[2]);


endmodule
