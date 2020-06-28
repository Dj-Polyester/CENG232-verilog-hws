module hasher (
	input clk,    // Clock
	input [15:0] cur_time,
	input [15:0] student_id,
	output [15:0] cur_hash	
);

reg [15:0] cur_hash_tmp;

initial begin
	cur_hash_tmp=0;
end

always @(posedge clk ) begin
	cur_hash_tmp <= ((((cur_time ^ student_id) - cur_hash_tmp)**2) >> 8) & (2**16-1);
end

assign cur_hash = cur_hash_tmp;

endmodule