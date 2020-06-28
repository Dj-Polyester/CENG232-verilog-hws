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
		$monitor("Time=%t | A=%b B=%b X=%b| D0=%b D1=%b Q=%b Z=%b", $time, A, B, X, D0, D1, Q, Z);
		
        
		// Initialize Inputs
		A = 0; B = 0; X = 0;

		// Wait 5 ns for global reset to finish
		#5;
		// Add stimulus here
		A = 0; B = 0; X = 0;
		#10; // Wait for clock edge
		$display("Now A=%b B=%b X=%b, results should be D0=0 D1=0 Q=0 Z=0", A, B, X);
		if(D0!=0 || D1!=0 || Q!=0 || Z!=0) $display("Before checking others, correct this case. Rest of the test depends on this");
		else $display("Successful");
		
		A = 0; B = 0; X = 1;
		#10; // Wait for clock edge
		$display("Now A=%b B=%b X=%b, results should be D0=1 D1=0 Q=1 Z=1", A, B, X);
		if(D0!=1 || D1!=0 || Q!=1 || Z!=1) $display("Before checking others, correct this case. Rest of the test depends on this");
		else $display("Successful");
		
		
		
		A = 0; B = 0; X = 0;
		#10; // Wait for clock edge
		
		A = 0; B = 0; X = 0;
		#10; // Wait for clock edge
		$display("After Q=0, now A=%b B=%b X=%b, results should be D0=0 D1=0 Q=0 Z=0", A, B, X);
		if(D0!=0 || D1!=0 || Q!=0 || Z!=0) $display("Wrong");
		else $display("Successful");
		
		A = 0; B = 0; X = 1;
		#10; // Wait for clock edge
		
		A = 0; B = 0; X = 0;
		#10; // Wait for clock edge
		$display("After Q=1, now A=%b B=%b X=%b, results should be D0=0 D1=0 Q=0 Z=0", A, B, X);
		if(D0!=0 || D1!=0 || Q!=0 || Z!=0) $display("Wrong");
		else $display("Successful");		
		
		
		A = 0; B = 0; X = 0;
		#10; // Wait for clock edge
		
		A = 0; B = 0; X = 1;
		#10; // Wait for clock edge
		$display("After Q=0, now A=%b B=%b X=%b, results should be D0=1 D1=0 Q=1 Z=1", A, B, X);
		if(D0!=1 || D1!=0 || Q!=1 || Z!=1) $display("Wrong");
		else $display("Successful");
		
		A = 0; B = 0; X = 1;
		#10; // Wait for clock edge
		
		A = 0; B = 0; X = 1;
		#10; // Wait for clock edge
		$display("After Q=1, now A=%b B=%b X=%b, results should be D0=1 D1=0 Q=1 Z=1", A, B, X);
		if(D0!=1 || D1!=0 || Q!=1 || Z!=1) $display("Wrong");
		else $display("Successful");
		
		
		A = 0; B = 0; X = 0;
		#10; // Wait for clock edge
		
		A = 0; B = 1; X = 0;
		#10; // Wait for clock edge
		$display("After Q=0, now A=%b B=%b X=%b, results should be D0=0 D1=1 Q=0 Z=0", A, B, X);
		if(D0!=0 || D1!=1 || Q!=0 || Z!=0) $display("Wrong");
		else $display("Successful");
		
		A = 0; B = 0; X = 1;
		#10; // Wait for clock edge
		
		A = 0; B = 1; X = 0;
		#10; // Wait for clock edge
		$display("After Q=1, now A=%b B=%b X=%b, results should be D0=0 D1=1 Q=1 Z=0", A, B, X);
		if(D0!=0 || D1!=1 || Q!=1 || Z!=0) $display("Wrong");
		else $display("Successful");
		
		
		A = 0; B = 0; X = 0;
		#10; // Wait for clock edge
		
		A = 0; B = 1; X = 1;
		#10; // Wait for clock edge
		$display("After Q=0, now A=%b B=%b X=%b, results should be D0=1 D1=0 Q=1 Z=1", A, B, X);
		if(D0!=1 || D1!=0 || Q!=1 || Z!=1) $display("Wrong");
		else $display("Successful");
		
		A = 0; B = 0; X = 1;
		#10; // Wait for clock edge
		
		A = 0; B = 1; X = 1;
		#10; // Wait for clock edge
		$display("After Q=1, now A=%b B=%b X=%b, results should be D0=1 D1=0 Q=1 Z=1", A, B, X);
		if(D0!=1 || D1!=0 || Q!=1 || Z!=1) $display("Wrong");
		else $display("Successful");		


		A = 0; B = 0; X = 0;
		#10; // Wait for clock edge
		
		A = 1; B = 0; X = 0;
		#10; // Wait for clock edge
		$display("After Q=0, now A=%b B=%b X=%b, results should be D0=1 D1=1 Q=1 Z=0", A, B, X);
		if(D0!=1 || D1!=1 || Q!=1 || Z!=0) $display("Wrong");
		else $display("Successful");
		
		A = 0; B = 0; X = 1;
		#10; // Wait for clock edge
		
		A = 1; B = 0; X = 0;
		#10; // Wait for clock edge
		$display("After Q=1, now A=%b B=%b X=%b, results should be D0=1 D1=1 Q=0 Z=0", A, B, X);
		if(D0!=1 || D1!=1 || Q!=0 || Z!=0) $display("Wrong");
		else $display("Successful");		
		
		
		A = 0; B = 0; X = 0;
		#10; // Wait for clock edge
		
		A = 1; B = 0; X = 1;
		#10; // Wait for clock edge
		$display("After Q=0, now A=%b B=%b X=%b, results should be D0=1 D1=0 Q=1 Z=1", A, B, X);
		if(D0!=1 || D1!=0 || Q!=1 || Z!=1) $display("Wrong");
		else $display("Successful");
		
		A = 0; B = 0; X = 1;
		#10; // Wait for clock edge
		
		A = 1; B = 0; X = 1;
		#10; // Wait for clock edge
		$display("After Q=1, now A=%b B=%b X=%b, results should be D0=1 D1=0 Q=1 Z=1", A, B, X);
		if(D0!=1 || D1!=0 || Q!=1 || Z!=1) $display("Wrong");
		else $display("Successful");
		
		
		A = 0; B = 0; X = 0;
		#10; // Wait for clock edge
		
		A = 1; B = 1; X = 0;
		#10; // Wait for clock edge
		$display("After Q=0, now A=%b B=%b X=%b, results should be D0=0 D1=0 Q=0 Z=0", A, B, X);
		if(D0!=0 || D1!=0 || Q!=0 || Z!=0) $display("Wrong");
		else $display("Successful");
		
		A = 0; B = 0; X = 1;
		#10; // Wait for clock edge
		
		A = 1; B = 1; X = 0;
		#10; // Wait for clock edge
		$display("After Q=1, now A=%b B=%b X=%b, results should be D0=0 D1=0 Q=0 Z=0", A, B, X);
		if(D0!=0 || D1!=0 || Q!=0 || Z!=0) $display("Wrong");
		else $display("Successful");
		
		
		A = 0; B = 0; X = 0;
		#10; // Wait for clock edge
		
		A = 1; B = 1; X = 1;
		#10; // Wait for clock edge
		$display("After Q=0, now A=%b B=%b X=%b, results should be D0=1 D1=0 Q=1 Z=1", A, B, X);
		if(D0!=1 || D1!=0 || Q!=1 || Z!=1) $display("Wrong");
		else $display("Successful");
		
		A = 0; B = 0; X = 1;
		#10; // Wait for clock edge
		
		A = 1; B = 1; X = 1;
		#10; // Wait for clock edge
		$display("After Q=1, now A=%b B=%b X=%b, results should be D0=1 D1=0 Q=1 Z=1", A, B, X);
		if(D0!=1 || D1!=0 || Q!=1 || Z!=1) $display("Wrong");
		else $display("Successful");		



		$finish;
	end
      
endmodule


