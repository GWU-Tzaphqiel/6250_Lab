/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Mon Feb 27 12:14:35 2023
/////////////////////////////////////////////////////////////


module halfadder_3 ( a, b, c, s );
  input a, b;
  output c, s;


  AND2X2 U1 ( .A(b), .B(a), .Y(c) );
  XOR2X1 U2 ( .A(b), .B(a), .Y(s) );
endmodule


module halfadder_2 ( a, b, c, s );
  input a, b;
  output c, s;


  AND2X2 U1 ( .A(b), .B(a), .Y(c) );
  XOR2X1 U2 ( .A(b), .B(a), .Y(s) );
endmodule


module fulladder_1 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   half_carry_1, half_sum_1, half_carry_2;

  halfadder_3 HA0 ( .a(a), .b(b), .c(half_carry_1), .s(half_sum_1) );
  halfadder_2 HA1 ( .a(half_sum_1), .b(cin), .c(half_carry_2), .s(s) );
  OR2X1 U1 ( .A(half_carry_1), .B(half_carry_2), .Y(cout) );
endmodule


module halfadder_0 ( a, b, c, s );
  input a, b;
  output c, s;


  AND2X2 U1 ( .A(b), .B(a), .Y(c) );
  XOR2X1 U2 ( .A(b), .B(a), .Y(s) );
endmodule


module halfadder_1 ( a, b, c, s );
  input a, b;
  output c, s;


  AND2X2 U1 ( .A(b), .B(a), .Y(c) );
  XOR2X1 U2 ( .A(b), .B(a), .Y(s) );
endmodule


module fulladder_0 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   half_carry_1, half_sum_1, half_carry_2;

  halfadder_1 HA0 ( .a(a), .b(b), .c(half_carry_1), .s(half_sum_1) );
  halfadder_0 HA1 ( .a(half_sum_1), .b(cin), .c(half_carry_2), .s(s) );
  OR2X1 U1 ( .A(half_carry_1), .B(half_carry_2), .Y(cout) );
endmodule


module fulladder_2b ( a, b, cin, s, cout );
  input [1:0] a;
  input [1:0] b;
  output [1:0] s;
  input cin;
  output cout;
  wire   c1, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;

  fulladder_1 FA0 ( .a(n8), .b(n4), .cin(n2), .s(s[0]), .cout(c1) );
  fulladder_0 FA1 ( .a(n10), .b(n6), .cin(c1), .s(s[1]), .cout(cout) );
  INVX2 U1 ( .A(cin), .Y(n1) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(b[0]), .Y(n3) );
  INVX2 U4 ( .A(n3), .Y(n4) );
  INVX2 U5 ( .A(b[1]), .Y(n5) );
  INVX2 U6 ( .A(n5), .Y(n6) );
  INVX2 U7 ( .A(a[0]), .Y(n7) );
  INVX2 U8 ( .A(n7), .Y(n8) );
  INVX2 U9 ( .A(a[1]), .Y(n9) );
  INVX2 U10 ( .A(n9), .Y(n10) );
endmodule

