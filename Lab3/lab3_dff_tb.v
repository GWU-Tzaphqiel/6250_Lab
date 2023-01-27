`timescale 1ns/10ps

module dff_tb();
//
// Parameter declarations
//
parameter PERIOD = 20;
parameter FINISHTIME = 1000;
parameter WAIT = 3;

//
// DUT Inputs
//
reg clk;
reg d, rst;

//
// DUT Outputs
//
wire q_d1, q_d2, qb_d1, qb_d2;

//
// DUT Instances
//
dff_behav dut_behav (.d(d), .clk(clk), .rst(rst), .q(q_d1), .qb(qb_d1));
dff_pro  dut_pro (.d(d), .clk(clk), .rst(rst), .q(q_d2), .qb(qb_d2));

//
// Initial and Final Conditions
//
initial
begin
	clk =1;
	d=0;
	rst=0;	
	#FINISHTIME ;
	$display ("Finishing simulation due to simulation constraint.");
	$display ("Time is - %d",$time);
	$finish;
end

//
// Clock Generator
//
always
	 #(PERIOD/2) clk = ~clk;


//
// DUT Stimulus 
// 
initial
begin
	//#(PERIOD/2) ;
	#PERIOD	;
	#PERIOD ;
	d=1;
	#PERIOD	;
	#PERIOD ;
	d=0;
	#PERIOD	;
	#PERIOD ;
	d=1;
	#PERIOD	;
	#PERIOD ;

	#(PERIOD/2) ;
	rst = 1;
	#(PERIOD/2) ;
	#PERIOD ;
	rst = 0;
	#PERIOD ;
	#PERIOD ;
	d=0;
	#PERIOD ;
	#PERIOD ;
	
	$display ("Finishing simulation due to end of testbench");
	$finish;
end

//
// Check the output of the flipflops
//
always @(posedge clk)
begin
	#WAIT ;
	if (q_d1 != q_d2)
	begin
		$display ("Q outputs are not identical.  Exiting...");
		$finish;
	end
	else if(qb_d1 != qb_d2)
	begin
		$display ("Qbar outputs are not identical.  Exiting...");
		$finish;
	end
	else
		$display ("Q & Qbar outputs are identical. Time: %d ",$time);

end

//
// Save the output of the simulation
// 

initial
 begin
        // Open a db file for saving simulation data
  $shm_open ("dff_tb.db");
        // Collect all signals (hierarchically) from the tb module
  $shm_probe (dff_tb,"AS");
 end


endmodule
