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
	$dumpfile("lab3_2.vcd");
	//$dumpvars(0,testbench_part2);
    //Time=%t $time, 
	$monitor("Time = %t Your answers: command=%b mode=%b | coords=%d,%d | total_cost=%d%d | total_time=%d%d | warning=%b", $time, command, mode, coord_x, coord_y, total_cost1, total_cost0, total_time1, total_time0, warning);
		// Add stimulus here
		//#1;
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
		command = 3; mode = 0;
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
		command = 7; mode = 0;
		#10; // Wait for clock edge
		if (coord_x != 0) $display("coord_x-7 wrong ---- correct answer: 0");
		if (coord_y != 0) $display("coord_y-7 wrong ---- correct answer: 2");
		if (total_cost1 != 0) $display("total_cost1-7 wrong ---- correct answer: 0");
		if (total_cost0 != 6) $display("total_cost0-7 wrong ---- correct answer: 6");
        if (total_time1 != 0) $display("total_time1-7 wrong ---- correct answer: 0");
        if (total_time0 != 2) $display("total_time0-7 wrong ---- correct answer: 2");
        if (warning != 0) $display("warning-7 wrong ---- correct answer: 0");
		else $display("Done - Test No:7");


		
		$finish;
        
	end
endmodule