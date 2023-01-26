module mux (c,a,b,s);
input a,b,s;
output c;

assign c=(s)?a:b; // This is a behavioral style

endmodule