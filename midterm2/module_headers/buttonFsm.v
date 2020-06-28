module buttonFsm (
	input clk,
	input button,    
	output stateful_button
);

localparam S0 = 2'b00;//off-not pressed
localparam S1 = 2'b01;//off-pressed
localparam S2 = 2'b10;//on-pressed
localparam S3 = 2'b11;//on-not pressed

reg [2:0] curr;
reg out; 
assign stateful_button = out;

initial begin
	out = 0;
	curr = S0;
end

always @(posedge clk) begin
	case (curr)
		S0:begin
			if (button) begin
				curr<=S2;
				out<=1;
			end
			else begin
				out<=0;
			end
		end
		S1:begin
			if (!button) begin
				curr<=S0;
			end
			out<=0;
		end
		S2:begin
			if (!button) begin
				curr<=S3;
			end
			out<=1;
		end
		S3:begin
			if (button) begin
				curr<=S1;
				out<=0;
			end
			else begin
				out<=1;
			end
		end
	endcase
end



endmodule
