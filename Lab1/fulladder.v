module fulladder (a,b,cin,s,cout);
//port declarations
input a,b,cin;
output cout,s;

//port data types
wire a,b,cin;
reg cout,s;

//internal sequential logic variables
//Stage 0 In
reg a_s0;
reg b_s0;
reg cin_s0;
//Stage 1 In
reg ha0s_s1;
reg ha0c_s1;
reg cin_s1;
//Stage 2 In
reg s_s2;
reg ha1c_s2;
reg ha0c_s2;

//internal combinational logic variables
//Stage 0 Out
reg ha0s_s0;
reg ha0c_s0;
//Stage 1 Out
reg ha1c_s1;
reg s_s1;
//Stage 2 Out
reg cout_s2;

halfadder ha0(
	.a(a),
	.b(b),
	.s(ha0s_s0),
	.c(ha0c_s0)
);

halfadder ha1(
	.a(ha0s_s1),
	.b(cin_s1),
	.s(s),
	.c(ha1c_s1)
);

//sequential logic
always @(a or b or cin) begin
	//Stage 0
	a_s0 <= a;
	b_s0 <= b;
	cin_s0 <= cin;
	//Stage 1
	ha0s_s1 <= ha0c_s0;
	ha0c_s1 <= ha0c_s0;
	cin_s1 <= cin_s0;
	//Stage 2
	s_s2 <= s_s1;
	ha1c_s2 <= ha1c_s1;
	ha0c_s2 <= ha0c_s1;
end

//combinational logic
always @(a or b or cin) begin
	cout_s2 = ha0c_s2 or ha1c_s2;
end
endmodule

module 2b_fulladder ()

endmodule