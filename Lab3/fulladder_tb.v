`include "globals.vh"
module fulladder_tb();
parameter finishtime = 5;

reg [4:0] test_vectors;
wire [1:0]s;
wire cout;
integer i;

fulladder_2b U0(
.a(test_vectors[4:3]),
.b(test_vectors[2:1]),
.cin(test_vectors[0]),
.cout(cout),
.s(s));

initial begin 
$display ("------------------------------------------------");
$display ("                                           abcin");
$display ("------------------------------------------------");
$monitor ("TIME = %d, test_vectors= %b, cout=%b, s=%b", $time, test_vectors, cout, s);

test_vectors = 5'b00000;
end

initial begin
	for (i = 0; i < 31; i = i + 1) begin
	#`DELAY test_vectors = test_vectors+1;
	#(`DELAY/5)
	if({cout, s} == test_vectors[4:3] + test_vectors[2:1] + test_vectors[0]) $display ("PASS");
	else $display ("FAIL");
	end

#finishtime    // The $finish call ends simulation.	
$display ("Finish simulation due to simulation constraint");
$display ("Time is -%d", $time);
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