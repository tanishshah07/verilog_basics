module main(input a,
	    input b,
	    input c,
	    input d,
	    output out);
wire [3:0]y;
/*
nor(y[0],a,b);
nor(y[1],c,d);
nor(y[2],y[0],y[0]);
nor(y[3],y[1],y[1]);
nor(out,y[2],y[3]);
*/

xor(y[0],a,b);
xor(y[1],c,d);
xor(out,y[0],y[1]);


endmodule
