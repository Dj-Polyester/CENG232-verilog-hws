`timescale 1ns / 1ps

module lab3_2_testbench;
    // Inputs
	reg [3:0] command;
	reg CLK;
	reg mode;

	// Outputs
	wire [7:0] total_time1;
    wire [7:0] total_time0;
    wire [7:0] total_cost1;
    wire [7:0] total_cost0;
    wire [3:2] coord_x;
    wire [1:0] coord_y;
    wire warning;

	// Instantiate the Unit Under Test (UUT)
	lab3_2 uut (
		.command(command), 
		.CLK(CLK),
		.mode(mode), 
		.total_time1(total_time1), 
		.total_time0(total_time0),
		.total_cost1(total_cost1),
        .total_cost0(total_cost0),
        .coord_x(coord_x),
        .coord_y(coord_y),
        .warning(warning)
	);
    
    // At 5, 15, 25, .. CLK will change 1->0 
    // At 10, 20, 30, .. CLK will change 0->1
    initial CLK = 1;
	always #5 CLK = ~CLK;

	initial begin

	$monitor("Your answers: command=%b mode=%b | coords=%d,%d | total_cost=%b %b | total_time=%b %b | warning=%b", command, mode, coord_x, coord_y, total_cost1, total_cost0, total_time1, total_time0, warning);

		// Add stimulus here
		command = 0; mode = 0;
		#10; // my reset  
		if (coord_x != 1) $display("coord_x-1 wrong ---- correct answer: 1");
		if (coord_y != 1) $display("coord_y-1 wrong ---- correct answer: 1");
		if (total_cost1 != 0) $display("total_cost1-1 wrong ---- correct answer: 0");
		if (total_cost0 != 1) $display("total_cost0-1 wrong ---- correct answer: 1");
        if (total_time1 != 0) $display("total_time1-1 wrong ---- correct answer: 0");
        if (total_time0 != 1) $display("total_time0-1 wrong ---- correct answer: 1");
        if (warning != 0) $display("warning-1 wrong ---- correct answer: 0");
		else $display("Done - Test No:1");  
		command = 1; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-2 wrong ---- correct answer: 0");
		if (coord_y != 2) $display("coord_y-2 wrong ---- correct answer: 2");
		if (total_cost1 != 0) $display("total_cost1-2 wrong ---- correct answer: 0");
		if (total_cost0 != 4) $display("total_cost0-2 wrong ---- correct answer: 4");
        if (total_time1 != 0) $display("total_time1-2 wrong ---- correct answer: 0");
        if (total_time0 != 2) $display("total_time0-2 wrong ---- correct answer: 2");
        if (warning != 0) $display("warning-2 wrong ---- correct answer: 0");
        else $display("Done - Test No:2");
		command = 7; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-3 wrong ---- correct answer: 0");
		if (coord_y != 2) $display("coord_y-3 wrong ---- correct answer: 2");
		if (total_cost1 != 0) $display("total_cost1-3 wrong ---- correct answer: 0");
		if (total_cost0 != 5) $display("total_cost0-3 wrong ---- correct answer: 5");
        if (total_time1 != 0) $display("total_time1-3 wrong ---- correct answer: 0");
        if (total_time0 != 3) $display("total_time0-3 wrong ---- correct answer: 3");
        if (warning != 0) $display("warning-3 wrong ---- correct answer: 0");
		else $display("Done - Test No:3");
		command = 2; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-4 wrong ---- correct answer: 0");
		if (coord_y != 0) $display("coord_y-4 wrong ---- correct answer: 0");
		if (total_cost1 != 0) $display("total_cost1-4 wrong ---- correct answer: 0");
		if (total_cost0 != 7) $display("total_cost0-4 wrong ---- correct answer: 7");
        if (total_time1 != 0) $display("total_time1-4 wrong ---- correct answer: 0");
        if (total_time0 != 4) $display("total_time0-4 wrong ---- correct answer: 4");
        if (warning != 0) $display("warning-4 wrong ---- correct answer: 0");
		else $display("Done - Test No:4");
		command = 3; mode = 1;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-5 wrong ---- correct answer: 0");
		if (coord_y != 0) $display("coord_y-5 wrong ---- correct answer: 0");
		if (total_cost1 != 0) $display("total_cost1-5 wrong ---- correct answer: 0");
		if (total_cost0 != 0) $display("total_cost0-5 wrong ---- correct answer: 0");
        if (total_time1 != 0) $display("total_time1-5 wrong ---- correct answer: 0");
        if (total_time0 != 0) $display("total_time0-5 wrong ---- correct answer: 0");
        if (warning != 1) $display("warning-5 wrong ---- correct answer: 1");
		else $display("Done - Test No:5");
		command = 3; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 1) $display("coord_x-6 wrong ---- correct answer: 1");
		if (coord_y != 1) $display("coord_y-6 wrong ---- correct answer: 1");
		if (total_cost1 != 0) $display("total_cost1-6 wrong ---- correct answer: 0");
		if (total_cost0 != 3) $display("total_cost0-6 wrong ---- correct answer: 3");
        if (total_time1 != 0) $display("total_time1-6 wrong ---- correct answer: 0");
        if (total_time0 != 1) $display("total_time0-6 wrong ---- correct answer: 1");
        if (warning != 0) $display("warning-6 wrong ---- correct answer: 0");
		else $display("Done - Test No:6");
        command = 1; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-7 wrong ---- correct answer: 0");
		if (coord_y != 2) $display("coord_y-7 wrong ---- correct answer: 2");
		if (total_cost1 != 0) $display("total_cost1-7 wrong ---- correct answer: 0");
		if (total_cost0 != 6) $display("total_cost0-7 wrong ---- correct answer: 6");
        if (total_time1 != 0) $display("total_time1-7 wrong ---- correct answer: 0");
        if (total_time0 != 2) $display("total_time0-7 wrong ---- correct answer: 2");
        if (warning != 0) $display("warning-7 wrong ---- correct answer: 0");
		else $display("Done - Test No:7");
        command = 5; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 1) $display("coord_x-8 wrong ---- correct answer: 1");
		if (coord_y != 1) $display("coord_y-8 wrong ---- correct answer: 1");
		if (total_cost1 != 0) $display("total_cost1-8 wrong ---- correct answer: 0");
		if (total_cost0 != 9) $display("total_cost0-8 wrong ---- correct answer: 9");
        if (total_time1 != 0) $display("total_time1-8 wrong ---- correct answer: 0");
        if (total_time0 != 3) $display("total_time0-8 wrong ---- correct answer: 3");
        if (warning != 0) $display("warning-8 wrong ---- correct answer: 0");
		else $display("Done - Test No:8");
        command = 1; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-9 wrong ---- correct answer: 0");
		if (coord_y != 2) $display("coord_y-9 wrong ---- correct answer: 2");
		if (total_cost1 != 1) $display("total_cost1-9 wrong ---- correct answer: 1");
		if (total_cost0 != 2) $display("total_cost0-9 wrong ---- correct answer: 2");
        if (total_time1 != 0) $display("total_time1-9 wrong ---- correct answer: 0");
        if (total_time0 != 4) $display("total_time0-9 wrong ---- correct answer: 4");
        if (warning != 0) $display("warning-9 wrong ---- correct answer: 0");
		else $display("Done - Test No:9");
        command = 5; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 1) $display("coord_x-10 wrong ---- correct answer: 1");
		if (coord_y != 1) $display("coord_y-10 wrong ---- correct answer: 1");
		if (total_cost1 != 1) $display("total_cost1-10 wrong ---- correct answer: 1");
		if (total_cost0 != 5) $display("total_cost0-10 wrong ---- correct answer: 5");
        if (total_time1 != 0) $display("total_time1-10 wrong ---- correct answer: 0");
        if (total_time0 != 5) $display("total_time0-10 wrong ---- correct answer: 5");
        if (warning != 0) $display("warning-10 wrong ---- correct answer: 0");
		else $display("Done - Test No:10");
        command = 1; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-11 wrong ---- correct answer: 0");
		if (coord_y != 2) $display("coord_y-11 wrong ---- correct answer: 2");
		if (total_cost1 != 1) $display("total_cost1-11 wrong ---- correct answer: 1");
		if (total_cost0 != 8) $display("total_cost0-11 wrong ---- correct answer: 8");
        if (total_time1 != 0) $display("total_time1-11 wrong ---- correct answer: 0");
        if (total_time0 != 6) $display("total_time0-11 wrong ---- correct answer: 6");
        if (warning != 0) $display("warning-11 wrong ---- correct answer: 0");
		else $display("Done - Test No:11");
        command = 0; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-12 wrong ---- correct answer: 0");
		if (coord_y != 2) $display("coord_y-12 wrong ---- correct answer: 2");
		if (total_cost1 != 1) $display("total_cost1-12 wrong ---- correct answer: 1");
		if (total_cost0 != 9) $display("total_cost0-12 wrong ---- correct answer: 9");
        if (total_time1 != 0) $display("total_time1-12 wrong ---- correct answer: 0");
        if (total_time0 != 7) $display("total_time0-12 wrong ---- correct answer: 7");
        if (warning != 0) $display("warning-12 wrong ---- correct answer: 0");
		else $display("Done - Test No:12");
        command = 2; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-13 wrong ---- correct answer: 0");
		if (coord_y != 0) $display("coord_y-13 wrong ---- correct answer: 0");
		if (total_cost1 != 0) $display("total_cost1-13 wrong ---- correct answer: 0");
		if (total_cost0 != 1) $display("total_cost0-13 wrong ---- correct answer: 1");
        if (total_time1 != 0) $display("total_time1-13 wrong ---- correct answer: 0");
        if (total_time0 != 8) $display("total_time0-13 wrong ---- correct answer: 8");
        if (warning != 0) $display("warning-13 wrong ---- correct answer: 0");
		else $display("Done - Test No:13");
        command = 8; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 2) $display("coord_x-14 wrong ---- correct answer: 2");
		if (coord_y != 0) $display("coord_y-14 wrong ---- correct answer: 0");
		if (total_cost1 != 0) $display("total_cost1-14 wrong ---- correct answer: 0");
		if (total_cost0 != 3) $display("total_cost0-14 wrong ---- correct answer: 3");
        if (total_time1 != 0) $display("total_time1-14 wrong ---- correct answer: 0");
        if (total_time0 != 9) $display("total_time0-14 wrong ---- correct answer: 9");
        if (warning != 0) $display("warning-14 wrong ---- correct answer: 0");
		else $display("Done - Test No:14");
        command = 4; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-15 wrong ---- correct answer: 0");
		if (coord_y != 0) $display("coord_y-15 wrong ---- correct answer: 0");
		if (total_cost1 != 0) $display("total_cost1-15 wrong ---- correct answer: 0");
		if (total_cost0 != 5) $display("total_cost0-15 wrong ---- correct answer: 5");
        if (total_time1 != 1) $display("total_time1-15 wrong ---- correct answer: 1");
        if (total_time0 != 0) $display("total_time0-15 wrong ---- correct answer: 0");
        if (warning != 0) $display("warning-15 wrong ---- correct answer: 0");
		else $display("Done - Test No:15");
        command = 6; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-16 wrong ---- correct answer: 0");
		if (coord_y != 2) $display("coord_y-16 wrong ---- correct answer: 2");
		if (total_cost1 != 0) $display("total_cost1-16 wrong ---- correct answer: 0");
		if (total_cost0 != 7) $display("total_cost0-16 wrong ---- correct answer: 7");
        if (total_time1 != 1) $display("total_time1-16 wrong ---- correct answer: 1");
        if (total_time0 != 1) $display("total_time0-16 wrong ---- correct answer: 1");
        if (warning != 0) $display("warning-16 wrong ---- correct answer: 0");
		else $display("Done - Test No:16");
        command = 4; mode = 1;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-17 wrong ---- correct answer: 0");
		if (coord_y != 0) $display("coord_y-17 wrong ---- correct answer: 0");
		if (total_cost1 != 0) $display("total_cost1-17 wrong ---- correct answer: 0");
		if (total_cost0 != 0) $display("total_cost0-17 wrong ---- correct answer: 0");
        if (total_time1 != 0) $display("total_time1-17 wrong ---- correct answer: 0");
        if (total_time0 != 0) $display("total_time0-17 wrong ---- correct answer: 0");
        if (warning != 1) $display("warning-17 wrong ---- correct answer: 1");
		else $display("Done - Test No:17");
        command = 1; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-18 wrong ---- correct answer: 0");
		if (coord_y != 0) $display("coord_y-18 wrong ---- correct answer: 0");
		if (total_cost1 != 0) $display("total_cost1-18 wrong ---- correct answer: 0");
		if (total_cost0 != 1) $display("total_cost0-18 wrong ---- correct answer: 1");
        if (total_time1 != 0) $display("total_time1-18 wrong ---- correct answer: 0");
        if (total_time0 != 1) $display("total_time0-18 wrong ---- correct answer: 1");
        if (warning != 0) $display("warning-18 wrong ---- correct answer: 1");
		else $display("Done - Test No:18");
        command = 12; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-19 wrong ---- correct answer: 0");
		if (coord_y != 0) $display("coord_y-19 wrong ---- correct answer: 0");
		if (total_cost1 != 0) $display("total_cost1-19 wrong ---- correct answer: 0");
		if (total_cost0 != 1) $display("total_cost0-19 wrong ---- correct answer: 1");
        if (total_time1 != 0) $display("total_time1-19 wrong ---- correct answer: 0");
        if (total_time0 != 1) $display("total_time0-19 wrong ---- correct answer: 1");
        if (warning != 0) $display("warning-19 wrong ---- correct answer: 1");
		else $display("Done - Test No:19");
		
		$finish;
        
	end
endmodule