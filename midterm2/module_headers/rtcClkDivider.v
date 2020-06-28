module rtcClkDivider (
	input sys_clk,    // 1 MHz
	output clk_500Hz, // 500 Hz
	output clk_5s  // 0.2 Hz
);
reg clk500Hz, clk5s;
integer counter1, counter2, period1, period2;

parameter KEYCHANGE_PERIOD = 0.001;  // DO NOT CHANGE THE NAME OF THIS PARAMETER 
// AND MAKE SURE TO USE THIS PARAMETER INSTEAD OF HARDCODING OTHER VALUES


assign clk_500Hz = clk500Hz;
assign clk_5s = clk5s;
initial begin
	counter1 = 1;
	counter2 = 1;
	clk500Hz = 0;
 	clk5s = 0;
	period1 = 2000;
	period2 = 1000000*KEYCHANGE_PERIOD;
end

always @(sys_clk ) begin
	
	if(counter1==period1) begin
        clk500Hz <= ~clk500Hz;
        counter1 <= 1;
    end else counter1 <= counter1 + 1;
	if(counter2==period2) begin
        clk5s <= ~clk5s;
        counter2 <= 1;
    end else counter2 <= counter2 + 1;
end

endmodule