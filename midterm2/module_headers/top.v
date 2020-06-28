module top (
	input sysclk,    // 1 MHz
	input button_in,
	input [15:0] student_id,
	output[3:0] D5_out,	
	output[3:0] D4_out,	
	output[3:0] D3_out,	
	output[3:0] D2_out,	
	output[3:0] D1_out		
);

reg _enable;
wire enable;
wire [15:0] cur_time;
wire [15:0] cur_hash;
wire clk_500Hz;
wire clk_5s;//N seconds period
wire button_out;

//prepare N seconds clk
rtcClkDivider RTC(
    .sys_clk(sysclk),
    .clk_500Hz(clk_500Hz),
    .clk_5s(clk_5s)
);

//get button state for display
buttonFsm FSM (
	.clk(sysclk),
	.button(button_in),    
	.stateful_button(button_out)
);

//get cur_time for hash function
timekeeper TIME(
    .clk(clk_5s),
    .cur_time(cur_time)
);

//update key every N seconds
hasher HASH(
    .clk(clk_5s),
    .cur_time(cur_time),
    .student_id(student_id),
    .cur_hash(cur_hash)
);

//display
b16toBCD BCD(
	.to_display(cur_hash),
	.enable(enable),
	.D5(D5_out),	
	.D4(D4_out),	
	.D3(D3_out),	
	.D2(D2_out),	
	.D1(D1_out)
);

assign enable = _enable;

initial begin
	_enable = 0;
end

always @(button_out) begin
	_enable<=button_out;
end

integer file;
always @(sysclk) begin
	file=$fopen("top.log","a");
	$fdisplay(file,"cur_time %0d sysclk %0d button_in %0d enable %0d button_out %0d student_id %0d cur_hash %0d BCD %0d %0d %0d %0d %0d",cur_time,sysclk,button_in,enable,button_out,student_id,cur_hash,D5_out,D4_out,D3_out,D2_out,D1_out);
	$fclose(file);
end

endmodule