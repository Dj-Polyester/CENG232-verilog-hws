`timescale 1s/1ns

module lab3_2_testbench;
    
    // Inputs
	reg[3:0] command;
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

     //additional
    reg[4:0] result_tb;
    localparam period = 10;

    initial begin
        mode = 1;
    end

    always 
    begin
        CLK = 1'b1; 
        #period; // high for 20 * timescale

        CLK = 1'b0;
        #period; // low for 20 * timescale
    end

    task test;
		input [2:0] initialx, initialy, x, y;  
		output [4:0] result_test;
		begin
            command = 4'b0000;
            #period;
			assign {x,y} = result_test;
            assign x=initialx;
            assign y=initialy;

            
            
			command = 4'b0001;
            #period;
			assign {x,y} = result_test;
            assign x=initialx;
            assign y=initialy;

			command = 4'b0010;
            #period;
			assign {x,y} = result_test;
            assign x=initialx;
            assign y=initialy;

			command = 4'b0011;
            #period;
			assign {x,y} = result_test;
            x=initialx;
            y=initialy;

			command = 4'b0100;
            #period;
			assign {x,y} = result_test;
            x=initialx;
            y=initialy;

			command = 4'b0101;
            #period;
			assign {x,y} = result_test;
            assign x=initialx;
            assign y=initialy;

			command = 4'b0110;
            #period;
			assign {x,y} = result_test;
            assign x=initialx;
            assign y=initialy;

			command = 4'b0111;
            #period;
			assign {x,y} = result_test;
            assign x=initialx;
            assign y=initialy;

			command = 4'b1000;
            #period;
			assign {x,y} = result_test;
            assign x=initialx;
            assign y=initialy;

		end
	endtask

    initial CLK = 1;
	always #(period/2) CLK = ~CLK;

    initial
    begin
        $monitor("Your answers: command=%b mode=%b | coords=%d,%d | total_cost=%b %b | total_time=%b %b | warning=%b", command, mode, coord_x, coord_y, total_cost1, total_cost0, total_time1, total_time0, warning);

        coord_x = 2'b00;
        coord_y = 2'b00;
        
        test(coord_x, coord_y, coord_x, coord_y, result_tb);
        
        

        coord_x = 2'b00;
        coord_y = 2'b01;
        
        test(coord_x, coord_y, coord_x, coord_y, result_tb);
        
        

        coord_x = 2'b00;
        coord_y = 2'b10;
        
        test(coord_x, coord_y, coord_x, coord_y, result_tb);
        
        

        coord_x = 2'b01;
        coord_y = 2'b00;
        
        test(coord_x, coord_y, coord_x, coord_y, result_tb);
        
        

        coord_x = 2'b01;
        coord_y = 2'b01;
        
        test(coord_x, coord_y, coord_x, coord_y, result_tb);
        
        

        coord_x = 2'b01;
        coord_y = 2'b10;
        
        test(coord_x, coord_y, coord_x, coord_y, result_tb);
        
        

        coord_x = 2'b10;
        coord_y = 2'b00;
        
        test(coord_x, coord_y, coord_x, coord_y, result_tb);
        
        

        coord_x = 2'b10;
        coord_y = 2'b01;
        
        test(coord_x, coord_y, coord_x, coord_y, result_tb);
        
        

        coord_x = 2'b10;
        coord_y = 2'b10;
        
        test(coord_x, coord_y, coord_x, coord_y, result_tb);
        
        

    end
endmodule