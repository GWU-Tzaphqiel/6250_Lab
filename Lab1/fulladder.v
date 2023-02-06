
module fulladder(s, cout, a, b, cin); 
input a, b, cin; 
output s, cout; 
wire half_sum_1, half_carry_1, half_carry_2; 
halfadder HA0(a, b, half_carry_1, half_sum_1); //instance 1 of Half Adder
halfadder HA1(half_sum_1, cin, half_carry_2, s); //instance 2 of Half Adder
or or0(cout, half_carry_2, half_carry_1); 
endmodule

module fulladder_2b (a, b, cin, s, cout);
input [1:0] a,b;
input cin;
output [1:0] s;
output cout;

wire c1,c2;

fulladder FA0 (a[0], b[0], cin, s[0], c1);
fulladder FA1 (a[1], b[1], c1, s[1], c2);
assign cout = c2;
endmodule

/*
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
wire w_ha0s_s0;
wire w_ha0c_s0;
reg ha0s_s0;
reg ha0c_s0;
//Stage 1 Out
wire w_ha1c_s1;
wire w_s_s1;
reg ha1c_s1;
reg s_s1;
//Stage 2 Out
reg cout_s2;

halfadder ha0(
	a_s0,
	b_s0,
	w_ha0c_s0,
	w_ha0s_s0
);

halfadder ha1(
	ha0s_s1,
	cin_s1,
	w_ha1c_s1,
	w_s_s1
);

//sequential logic
always @(*) begin
	//Stage 0
	a_s0 <= a;
	b_s0 <= b;
	cin_s0 <= cin;
	//Stage 1
	ha0s_s1 <= ha0s_s0;
	ha0c_s1 <= ha0c_s0;
	cin_s1 <= cin_s0;
	//Stage 2
	s_s2 <= s_s1;
	ha1c_s2 <= ha1c_s1;
	ha0c_s2 <= ha0c_s1;
	//Stage 3
	cout <= cout_s2;
	s <= s_s2;
end

//combinational logic
always @(*) begin
	cout_s2 = ha0c_s2 || ha1c_s2;
end

assign w_ha0s_s0 = ha0s_s0;
assign w_ha0c_s0 = ha0c_s0;
assign w_s_s1 = s_s1;
assign w_ha1c_s1 = ha1c_s1;
endmodule
*/
/*
module fulladder_2b (a, b, cin, s, cout);
//port declarations
input[1:0] a,b;
input cin;
output cout;
output [1:0] s;

//port data types
wire [1:0] a,b;
wire cin;
reg cout;
reg [1:0] s;

//internal sequential logic variables
//Stage 0 In
reg [1:0]a_s0;
reg [1:0]b_s0;
reg cin_s0;
//Stage 1 In
reg a1_s1;
reg b1_s1;
reg s0_s1;
reg fa0c_s1;

//internal combinational logic variables
//Stage 0 Out
wire w_s0_s0;
wire w_fa0c_s0;
reg s0_s0;
reg fa0c_s0;
//Stage 1 Out
wire w_s1_s1;
wire w_cout_s1;
reg s1_s1;
reg cout_s1;

fulladder fa0(
	.a(a_s0[0]),
	.b(b_s0[0]),
	.cin(cin_s0),
	.s(w_s0_s0),
	.cout(w_fa0c_s0)
);

fulladder fa1(
	.a(a1_s1),
	.b(b1_s1),
	.cin(fa0c_s1),
	.s(w_s1_s1),
	.cout(w_cout_s1)
);

//sequential logic
always @(a or b or cin) begin
	//Stage 0
	a_s0[1:0] <= a[1:0];
	b_s0[1:0] <= b[1:0];
	cin_s0 <= cin;
	//Stage 1
	s0_s1 <= s0_s0;
	fa0c_s1 <= fa0c_s0;
	a1_s1 <= a_s0[1];
	b1_s1 <= b_s0[1];
	//Stage 2
	s[0] <= s0_s1;
	s[1] <= s1_s1;
	cout <= cout_s1;
end

assign w_s0_s0 = s0_s0;
assign w_fa0c_s0 = fa0c_s0;
assign w_s1_s1 = s1_s1;
assign w_cout_s1 = cout_s1;

endmodule
*/