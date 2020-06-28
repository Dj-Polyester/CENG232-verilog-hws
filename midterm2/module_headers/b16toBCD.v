module b16toBCD (
	input [15:0] to_display,
	input enable,
	output [3:0] D5,	
	output [3:0] D4,	
	output [3:0] D3,	
	output [3:0] D2,	
	output [3:0] D1	
);
//sum-carry
reg [4:0] sum;
reg carry;
//Accumulator registers
reg [3:0] ACC5;	
reg [3:0] ACC4;	
reg [3:0] ACC3;	
reg [3:0] ACC2;	
reg [3:0] ACC1;
//Temporary registers
reg [3:0] tmp5;	
reg [3:0] tmp4;	
reg [3:0] tmp3;	
reg [3:0] tmp2;	
reg [3:0] tmp1;
//additional registers for outputs
output reg [3:0] tmpD5;	
output reg [3:0] tmpD4;	
output reg [3:0] tmpD3;	
output reg [3:0] tmpD2;	
output reg [3:0] tmpD1;
//counters
integer i, j;
//tasks
task addBCD_1_digit;
	input [3:0] fst;
	input [3:0] snd;
	input [3:0] crry;
	begin
		sum=fst+snd+crry;
		carry = 0;
		if (sum >= 10) begin
			carry=1;
			sum=sum-10;
		end 
	end
endtask
task addBCD;
	//tmp input
	begin
		carry=0;
		addBCD_1_digit(tmp1,ACC1,0);
		ACC1 = sum;
		addBCD_1_digit(tmp2,ACC2,carry);
		ACC2 = sum;
		addBCD_1_digit(tmp3,ACC3,carry);
		ACC3 = sum;
		addBCD_1_digit(tmp4,ACC4,carry);
		ACC4 = sum;
		addBCD_1_digit(tmp5,ACC5,carry);
		ACC5 = sum;
	end
endtask
task convertTo2sPower;
	begin
		if (to_display[i]) begin
			tmp5 = 0;
			tmp4 = 0;
			tmp3 = 0;
			tmp2 = 0;
			tmp1 = 1;
			for (j = 1; j<i+1; j=j+1) begin
				tmp5 = ( (tmp5<5) ? ((tmp4<5) ? (2*tmp5):(2*tmp5+1)):((tmp4<5) ? (2*(tmp5-5)):(2*(tmp5-5)+1)));
				tmp4 = ( (tmp4<5) ? ((tmp3<5) ? (2*tmp4):(2*tmp4+1)):((tmp3<5) ? (2*(tmp4-5)):(2*(tmp4-5)+1)));
				tmp3 = ( (tmp3<5) ? ((tmp2<5) ? (2*tmp3):(2*tmp3+1)):((tmp2<5) ? (2*(tmp3-5)):(2*(tmp3-5)+1)));
				tmp2 = ( (tmp2<5) ? ((tmp1<5) ? (2*tmp2):(2*tmp2+1)):((tmp1<5) ? (2*(tmp2-5)):(2*(tmp2-5)+1)));
				tmp1 = ( (tmp1<5) ? (2*tmp1):(2*(tmp1-5)) );
			end
		end else begin
			tmp5 = 0;
			tmp4 = 0;
			tmp3 = 0;
			tmp2 = 0;
			tmp1 = 0;
		end
	end	
endtask
task convertToBCD;
	begin
		ACC5 = 0;	
		ACC4 = 0;	
		ACC3 = 0;	
		ACC2 = 0;	
		ACC1 = 0;
		for (i = 0; i<16; i=i+1) begin
			convertTo2sPower(i);
			addBCD;
		end
		tmpD5 = ACC5;
		tmpD4 = ACC4;
		tmpD3 = ACC3;
		tmpD2 = ACC2;
		tmpD1 = ACC1;
	end
endtask

always @(enable or to_display) begin
	if (enable) begin
		convertToBCD;
	end else begin
		tmpD5 = 4'b1111;
		tmpD4 = 4'b1111;
		tmpD3 = 4'b1111;
		tmpD2 = 4'b1111;
		tmpD1 = 4'b1111;
	end
end
assign D5 = tmpD5;
assign D4 = tmpD4;
assign D3 = tmpD3;
assign D2 = tmpD2;
assign D1 = tmpD1;
endmodule