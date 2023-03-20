`include "globals.vh"
module halfadder (a,b,c,s);
input a,b;
output c,s;

and I0 (c,a,b);
xor I1 (s,a,b);

endmodule