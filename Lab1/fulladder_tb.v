module tb_fulladd;

reg [1:0] a,b;
reg cin;
wire [1:0]s;
wire cout;
integer i;

fulladder_2b U0(
.a(a),
.b(b),
.cin(cin),
.cout(cout),
.s(s));

initial 
begin
a=2'b00;
b=2'b01;
cin=1'b1;

#30 
a=2'b01;
b=2'b01;
cin=1'b1;


#30
a=2'b10;
b=2'b01;
cin=1'b0;

#30;
a=2'b00;
b=2'b01;
cin=1'b0;

#30;
a=2'b00;
b=2'b01;
cin=1'b0;
#30;
$finish;

end
endmodule