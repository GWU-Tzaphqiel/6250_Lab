module halfadder (a,b,c,s);
input a,b;
output c,s;

and I0 (a,b,c);
xor I1 (a,b,s);

endmodule