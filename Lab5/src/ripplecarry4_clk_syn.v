/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Mon Mar  6 11:43:26 2023
/////////////////////////////////////////////////////////////


module halfadder_7 ( s, c, a, b );
  input a, b;
  output s, c;


  AND2X2 U1 ( .A(b), .B(a), .Y(c) );
  XOR2X1 U2 ( .A(b), .B(a), .Y(s) );
endmodule


module halfadder_6 ( s, c, a, b );
  input a, b;
  output s, c;


  AND2X2 U1 ( .A(b), .B(a), .Y(c) );
  XOR2X1 U2 ( .A(b), .B(a), .Y(s) );
endmodule


module fulladder_3 ( s, cout, a, b, cin );
  input a, b, cin;
  output s, cout;
  wire   wire1, wire2, wire3;

  halfadder_7 ha1 ( .s(wire1), .c(wire2), .a(a), .b(b) );
  halfadder_6 ha2 ( .s(s), .c(wire3), .a(wire1), .b(cin) );
  OR2X1 U1 ( .A(wire2), .B(wire3), .Y(cout) );
endmodule


module halfadder_0 ( s, c, a, b );
  input a, b;
  output s, c;


  AND2X2 U1 ( .A(b), .B(a), .Y(c) );
  XOR2X1 U2 ( .A(b), .B(a), .Y(s) );
endmodule


module halfadder_1 ( s, c, a, b );
  input a, b;
  output s, c;


  AND2X2 U1 ( .A(b), .B(a), .Y(c) );
  XOR2X1 U2 ( .A(b), .B(a), .Y(s) );
endmodule


module fulladder_0 ( s, cout, a, b, cin );
  input a, b, cin;
  output s, cout;
  wire   wire1, wire2, wire3;

  halfadder_1 ha1 ( .s(wire1), .c(wire2), .a(a), .b(b) );
  halfadder_0 ha2 ( .s(s), .c(wire3), .a(wire1), .b(cin) );
  OR2X1 U1 ( .A(wire2), .B(wire3), .Y(cout) );
endmodule


module halfadder_2 ( s, c, a, b );
  input a, b;
  output s, c;


  AND2X2 U1 ( .A(b), .B(a), .Y(c) );
  XOR2X1 U2 ( .A(b), .B(a), .Y(s) );
endmodule


module halfadder_3 ( s, c, a, b );
  input a, b;
  output s, c;


  AND2X2 U1 ( .A(b), .B(a), .Y(c) );
  XOR2X1 U2 ( .A(b), .B(a), .Y(s) );
endmodule


module fulladder_1 ( s, cout, a, b, cin );
  input a, b, cin;
  output s, cout;
  wire   wire1, wire2, wire3;

  halfadder_3 ha1 ( .s(wire1), .c(wire2), .a(a), .b(b) );
  halfadder_2 ha2 ( .s(s), .c(wire3), .a(wire1), .b(cin) );
  OR2X1 U1 ( .A(wire2), .B(wire3), .Y(cout) );
endmodule


module halfadder_4 ( s, c, a, b );
  input a, b;
  output s, c;


  AND2X2 U1 ( .A(b), .B(a), .Y(c) );
  XOR2X1 U2 ( .A(b), .B(a), .Y(s) );
endmodule


module halfadder_5 ( s, c, a, b );
  input a, b;
  output s, c;


  AND2X2 U1 ( .A(b), .B(a), .Y(c) );
  XOR2X1 U2 ( .A(b), .B(a), .Y(s) );
endmodule


module fulladder_2 ( s, cout, a, b, cin );
  input a, b, cin;
  output s, cout;
  wire   wire1, wire2, wire3;

  halfadder_5 ha1 ( .s(wire1), .c(wire2), .a(a), .b(b) );
  halfadder_4 ha2 ( .s(s), .c(wire3), .a(wire1), .b(cin) );
  OR2X1 U1 ( .A(wire2), .B(wire3), .Y(cout) );
endmodule


module ripplecarry4_clk ( sum, cout, a, b, cin, clk, rst );
  output [3:0] sum;
  input [3:0] a;
  input [3:0] b;
  input cin, clk, rst;
  output cout;
  wire   wire0, wire1, c0_reg, wire2, c1_reg, c2_reg, N3, N4, N5, n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19;

  fulladder_3 fa0 ( .s(sum[0]), .cout(wire0), .a(n13), .b(n5), .cin(n3) );
  fulladder_2 fa1 ( .s(sum[1]), .cout(wire1), .a(n15), .b(n7), .cin(c0_reg) );
  fulladder_1 fa2 ( .s(sum[2]), .cout(wire2), .a(n17), .b(n9), .cin(c1_reg) );
  fulladder_0 fa3 ( .s(sum[3]), .cout(cout), .a(n19), .b(n11), .cin(c2_reg) );
  DFFPOSX1 c0_reg_reg ( .D(N3), .CLK(clk), .Q(c0_reg) );
  DFFPOSX1 c1_reg_reg ( .D(N4), .CLK(clk), .Q(c1_reg) );
  DFFPOSX1 c2_reg_reg ( .D(N5), .CLK(clk), .Q(c2_reg) );
  AND2X2 U3 ( .A(wire2), .B(n1), .Y(N5) );
  AND2X2 U4 ( .A(wire1), .B(n1), .Y(N4) );
  AND2X2 U5 ( .A(wire0), .B(n1), .Y(N3) );
  INVX2 U6 ( .A(rst), .Y(n1) );
  INVX2 U7 ( .A(cin), .Y(n2) );
  INVX2 U8 ( .A(n2), .Y(n3) );
  INVX2 U9 ( .A(b[0]), .Y(n4) );
  INVX2 U10 ( .A(n4), .Y(n5) );
  INVX2 U11 ( .A(b[1]), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n7) );
  INVX2 U13 ( .A(b[2]), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n9) );
  INVX2 U15 ( .A(b[3]), .Y(n10) );
  INVX2 U16 ( .A(n10), .Y(n11) );
  INVX2 U17 ( .A(a[0]), .Y(n12) );
  INVX2 U18 ( .A(n12), .Y(n13) );
  INVX2 U19 ( .A(a[1]), .Y(n14) );
  INVX2 U20 ( .A(n14), .Y(n15) );
  INVX2 U21 ( .A(a[2]), .Y(n16) );
  INVX2 U22 ( .A(n16), .Y(n17) );
  INVX2 U23 ( .A(a[3]), .Y(n18) );
  INVX2 U24 ( .A(n18), .Y(n19) );
endmodule

