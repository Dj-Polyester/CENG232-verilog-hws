`timescale 1ns / 1ps 
module lab3_2(
			input[3:0] command,
			input CLK, 
			input mode,
			output reg [7:0] total_time1,
			output reg [7:0] total_time0,
			output reg [7:0] total_cost1,
			output reg [7:0] total_cost0,
			output reg [3:2] coord_x,
			output reg [1:0] coord_y,
			output reg warning
    );
	wire [7:0] addTime = 8'b00000001;
	reg [7:0] addCost;
	reg [15:0] resultTotalTime;
	reg [15:0] resultTotalCost;
	reg [1:0] resultH;
	reg [3:0] resultD;
	reg [3:2] coord_xtmp;
	reg [1:0] coord_ytmp;
	
	task addTotal;
		input [7:0] total1, total2, add; 
		output [15:0] result;
		begin
			total2 = total2 + add;
			if (total2 > 8'b00001001) begin
				total2 = total2 - 8'b00001010;
				if (total1 === 8'b00000001) begin
					total1 = 8'b00000000;
				end else begin
					total1 = 8'b00000001;
				end
			end 
			result = {total1,total2};
		end
	endtask

	task toRightOrDown;
		input [1:0] a; 
		output [1:0] result;
		begin
			if (a === 2'b10) begin
				result = 2'b00;
			end else begin
				result = a + 2'b01;
			end
		end
	endtask
	task toLeftOrUp;
		input [1:0] a; 
		output [1:0] result;
		begin
			if (a === 2'b00) begin
				result = 2'b10;
			end else begin
				result = a - 2'b01;
			end
		end
	endtask
	task toUpRight;
		input [1:0] x, y; 
		output [3:0] result;
		begin
			if (x === 2'b00 || y === 2'b10) begin
				result = {x,y};
			end else begin
				result = {x-2'b01,y+2'b01};
			end
		end
	endtask
	task toDownRight;
		input [1:0] x, y; 
		output [3:0] result;
		begin
			if (x === 2'b10 || y === 2'b10) begin
				result = {x,y};
			end else begin
				result = {x+2'b01,y+2'b01};
			end
		end
	endtask
	task toDownLeft;
		input [1:0] x, y; 
		output [3:0] result;
		begin
			if (x === 2'b10 || y === 2'b00) begin
				result = {x,y};
			end else begin
				result = {x+2'b01,y-2'b01};
			end
		end
	endtask
	task toUpLeft;
		input [1:0] x, y; 
		output [3:0] result;
		begin
			if (x === 2'b00 || y === 2'b00) begin
				result = {x,y};
			end else begin
				result = {x-2'b01,y-2'b01};
			end
		end
	endtask
	
   //Modify the lines below to implement your design .
	initial begin
		coord_x = 2'b01;
        coord_y = 2'b01;
		total_time1 = 8'b00000000;
		total_time0 = 8'b00000000;
		total_cost1 = 8'b00000000;
		total_cost0 = 8'b00000000;
    end

	always @(posedge CLK ) begin
		//reset mode
		if (mode === 1) begin
			warning = 1;
			coord_x = 2'b00;
    		coord_y = 2'b00;
			total_time1 = 8'b00000000;
			total_time0 = 8'b00000000;
			total_cost1 = 8'b00000000;
			total_cost0 = 8'b00000000;
		end else begin //working mode
			warning = 0;
			case (command)
				4'b0000: begin //still
					addCost = 8'b00000001;
					addTotal(total_cost1, total_cost0, addCost, resultTotalCost);
					{total_cost1, total_cost0} = resultTotalCost;
					addTotal(total_time1, total_time0, addTime, resultTotalTime);
					{total_time1, total_time0} = resultTotalTime;
					
				end
				4'b0001: begin //upright
					{coord_xtmp,coord_ytmp} = {coord_x,coord_y};
					
					toUpRight(coord_x, coord_y,resultD);
					{coord_x,coord_y} = resultD;
					
					addCost = ({coord_xtmp,coord_ytmp} === {coord_x,coord_y} ? 8'b00000001 : 8'b00000011);
					
					addTotal(total_cost1, total_cost0, addCost, resultTotalCost);
					{total_cost1, total_cost0} = resultTotalCost;
					addTotal(total_time1, total_time0, addTime, resultTotalTime);
					{total_time1, total_time0} = resultTotalTime;
					
				end
				4'b0010: begin //right
					toRightOrDown(coord_y,resultH);
					coord_y = resultH;
					addCost = 8'b00000010;
					
					addTotal(total_cost1, total_cost0, addCost, resultTotalCost);
					{total_cost1, total_cost0} = resultTotalCost;
					addTotal(total_time1, total_time0, addTime, resultTotalTime);
					{total_time1, total_time0} = resultTotalTime;
				end
				4'b0011: begin //downright
					{coord_xtmp,coord_ytmp} = {coord_x,coord_y};
					toDownRight(coord_x, coord_y,resultD);
					{coord_x,coord_y} = resultD;
					
					addCost = ({coord_xtmp,coord_ytmp} === {coord_x,coord_y} ? 8'b00000001 : 8'b00000011);
			
					addTotal(total_cost1, total_cost0, addCost, resultTotalCost);
					{total_cost1, total_cost0} = resultTotalCost;
					addTotal(total_time1, total_time0, addTime, resultTotalTime);
					{total_time1, total_time0} = resultTotalTime;
				end
				4'b0100: begin //down
					toRightOrDown(coord_x,resultH);
					coord_x = resultH;
					
					addCost = 8'b00000010;

					addTotal(total_cost1, total_cost0, addCost, resultTotalCost);
					{total_cost1, total_cost0} = resultTotalCost;
					addTotal(total_time1, total_time0, addTime, resultTotalTime);
					{total_time1, total_time0} = resultTotalTime;
				end
				4'b0101: begin //downleft
					{coord_xtmp,coord_ytmp} = {coord_x,coord_y};
					toDownLeft(coord_x, coord_y,resultD);
					{coord_x,coord_y} = resultD;
					
					addCost = ({coord_xtmp,coord_ytmp} === {coord_x,coord_y} ? 8'b00000001 : 8'b00000011);

					addTotal(total_cost1, total_cost0, addCost, resultTotalCost);
					{total_cost1, total_cost0} = resultTotalCost;
					addTotal(total_time1, total_time0, addTime, resultTotalTime);
					{total_time1, total_time0} = resultTotalTime;
				end
				4'b0110: begin //left
					toLeftOrUp(coord_y,resultH);
					coord_y = resultH;
					
					addCost = 8'b00000010;

					addTotal(total_cost1, total_cost0, addCost, resultTotalCost);
					{total_cost1, total_cost0} = resultTotalCost;
					addTotal(total_time1, total_time0, addTime, resultTotalTime);
					{total_time1, total_time0} = resultTotalTime;
				end
				4'b0111: begin //upleft
					{coord_xtmp,coord_ytmp} = {coord_x,coord_y};
					toUpLeft(coord_x, coord_y,resultD);
					{coord_x,coord_y} = resultD;
					
					addCost = ((coord_xtmp == coord_x) && (coord_ytmp === coord_y) ? 8'b00000001 : 8'b00000011);

					addTotal(total_cost1, total_cost0, addCost, resultTotalCost);
					{total_cost1, total_cost0} = resultTotalCost;
					addTotal(total_time1, total_time0, addTime, resultTotalTime);
					{total_time1, total_time0} = resultTotalTime;
				end
				4'b1000: begin //up
					toLeftOrUp(coord_x,resultH);
					coord_x = resultH;
					
					addCost = 8'b00000010;

					addTotal(total_cost1, total_cost0, addCost, resultTotalCost);
					{total_cost1, total_cost0} = resultTotalCost;
					addTotal(total_time1, total_time0, addTime, resultTotalTime);
					{total_time1, total_time0} = resultTotalTime;
				end
				default: begin
					addTotal(total_time1, total_time0, addTime, resultTotalTime);
					{total_time1, total_time0} = resultTotalTime;
				end

			endcase
		end
	end
	
	
	

	
	
	
    
    
   

endmodule