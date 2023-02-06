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

initial begin
	a <= 0;
	b <= 0;
	cin <= 0;
	s <= 0;
	cout <= 0;
	
	for (i = 0; i < 25; i = i + 1) begin
		#10 a <= $random;
			b <= $random;
				cin <= $random;
	end
	$finish;
end

initial
 begin
	// Open a db file for saving simulation data
  $shm_open ("fulladder_tb.db");
	// Collect all signals (hierarchically) from the module "adder_tb"
  $shm_probe (fulladder_tb,"AS");
 end
endmodule
endmodule