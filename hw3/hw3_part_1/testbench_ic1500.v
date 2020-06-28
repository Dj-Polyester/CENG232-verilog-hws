`timescale 1ns / 1ps

module testbench_ic1500;

	// Inputs
	reg B;
	reg A;
	reg X;
	reg clk;

	// Outputs
	wire D0;
	wire D1;
	wire Q;
	wire Z;

	// Instantiate the Unit Under Test (UUT)
	ic1500 uut (
		.B(B), 
		.A(A), 
		.X(X),
		.clk(clk),
		.D0(D0), 
		.D1(D1), 
		.Q(Q),
		.Z(Z)
	);

	// At 5, 15, 25, .. clk will change 1->0 
    // At 10, 20, 30, .. clk will change 0->1
    initial clk = 1;
	always #5 clk = ~clk;

	initial begin
		$dumpfile("testbench_ic1500.vcd"); 
        $dumpvars(0, testbench_ic1500);
		// set monitor to inputs and outputs
		$monitor("Time=%t | A=%b B=%b X=%b| Z=%b", $time, A, B, X, Z);
		
        
		// Initialize Inputs
		A = 0; B = 0; X = 0;

		// Wait 5 ns for global reset to finish
		#5;
		// Add stimulus here
		
		A = 0; B = 0; X = 1;
		#10; // Wait for clock edge
		
		A = 0; B = 1; X = 0;
		#10; // Wait for clock edge
		
		A = 0; B = 1; X = 1;
		#10; // Wait for clock edge
		
		A = 1; B = 0; X = 0;
		#10; // Wait for clock edge
		
		A = 1; B = 0; X = 1;
		#10; // Wait for clock edge
		
		A = 1; B = 1; X = 0;
		#10; // Wait for clock edge
		
		A = 1; B = 1; X = 1;
		#10; // Wait for clock edge
		


		$finish;
	end
      
endmodule


