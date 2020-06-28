module timekeeper (
	input clk,    // Clock
	output[15:0] cur_time	
);

reg [15:0] currt;

initial begin
	currt = 0;
end

always @(posedge clk ) begin
	currt <= ((currt === 65535)? 0: currt+1);
end

assign cur_time = currt;

endmodule