`timescale 1ns / 1ps

module SEC_MEM_tb;

reg clk, mode;
reg [3:0] addr;
reg [1:12] dataIn;
reg [7:0] holder;
wire [1:12] dataOut;
integer i;

SEC_MEM UUT(
    .clk(clk),
    .mode(mode),
    .addr(addr),
    .dataIn(dataIn),
    .dataOut(dataOut)
);

initial clk=0;
always #5 clk=~clk;

initial mode=0;
initial addr=0;
initial i=0;
initial #1;

initial begin

    dataIn = 12'b000000000000; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b000000000000) begin $display("SEC_MEM test no:  1 is wrong! | Your answer: %b | Correct answer: 000000000000", dataOut); i=i+1; end
    
    dataIn = 12'b111111111111; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b111111111110) begin $display("SEC_MEM test no:  2 is wrong! | Your answer: %b | Correct answer: 111111111110", dataOut); i=i+1; end

    dataIn = 12'b111111000000; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b111111100000) begin $display("SEC_MEM test no:  3 is wrong! | Your answer: %b | Correct answer: 111111100000", dataOut); i=i+1; end
    
    dataIn = 12'b000001111100; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b000001111000) begin $display("SEC_MEM test no:  4 is wrong! | Your answer: %b | Correct answer: 000001111000", dataOut); i=i+1; end
    
    dataIn = 12'b001100100110; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b101100100110) begin $display("SEC_MEM test no:  5 is wrong! | Your answer: %b | Correct answer: 101100100110", dataOut); i=i+1; end
    
    dataIn = 12'b000001000000; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b000000000000) begin $display("SEC_MEM test no:  6 is wrong! | Your answer: %b | Correct answer: 000000000000", dataOut); i=i+1; end
    
    dataIn = 12'b000011110000; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b000011110001) begin $display("SEC_MEM test no:  7 is wrong! | Your answer: %b | Correct answer: 000011110001", dataOut); i=i+1; end
    
    dataIn = 12'b000100000000; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b000000000000) begin $display("SEC_MEM test no:  8 is wrong! | Your answer: %b | Correct answer: 000000000000", dataOut); i=i+1; end
    
    dataIn = 12'b011111011000; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b011111111000) begin $display("SEC_MEM test no:  9 is wrong! | Your answer: %b | Correct answer: 011111111000", dataOut); i=i+1; end
    
    dataIn = 12'b001101111010; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b001101111011) begin $display("SEC_MEM test no: 10 is wrong! | Your answer: %b | Correct answer: 001101111011", dataOut); i=i+1; end
    
    dataIn = 12'b101010101010; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b111010101010) begin $display("SEC_MEM test no: 11 is wrong! | Your answer: %b | Correct answer: 111010101010", dataOut); i=i+1; end
    
    dataIn = 12'b111011101110; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b111011101111) begin $display("SEC_MEM test no: 12 is wrong! | Your answer: %b | Correct answer: 111011101111", dataOut); i=i+1; end
    
    dataIn = 12'b001000100000; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b001100100000) begin $display("SEC_MEM test no: 13 is wrong! | Your answer: %b | Correct answer: 001100100000", dataOut); i=i+1; end
    
    dataIn = 12'b000001100011; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b000000100011) begin $display("SEC_MEM test no: 14 is wrong! | Your answer: %b | Correct answer: 000000100011", dataOut); i=i+1; end
    
    dataIn = 12'b000000000001; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b000000000000) begin $display("SEC_MEM test no: 15 is wrong! | Your answer: %b | Correct answer: 000000000000", dataOut); i=i+1; end
    
    dataIn = 12'b100000000000; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b000000000000) begin $display("SEC_MEM test no: 16 is wrong! | Your answer: %b | Correct answer: 000000000000", dataOut); i=i+1; end
    
    dataIn = 12'b011000010000; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b011000011000) begin $display("SEC_MEM test no: 17 is wrong! | Your answer: %b | Correct answer: 011000011000", dataOut); i=i+1; end
    
    dataIn = 12'b000001000000; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b000000000000) begin $display("SEC_MEM test no: 18 is wrong! | Your answer: %b | Correct answer: 000000000000", dataOut); i=i+1; end
    
    dataIn = 12'b000000001000; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b000000000000) begin $display("SEC_MEM test no: 19 is wrong! | Your answer: %b | Correct answer: 000000000000", dataOut); i=i+1; end
    
    dataIn = 12'b111111111110; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b111111111110) begin $display("SEC_MEM test no: 20 is wrong! | Your answer: %b | Correct answer: 111111111110", dataOut); i=i+1; end
    
    dataIn = 12'b101011101010; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b101111101010) begin $display("SEC_MEM test no: 21 is wrong! | Your answer: %b | Correct answer: 101111101010", dataOut); i=i+1; end
    
    dataIn = 12'b111101010101; mode=1; #10; mode=0; #10;
    if(dataOut !== 12'b111101010100) begin $display("SEC_MEM test no: 22 is wrong! | Your answer: %b | Correct answer: 111101010100", dataOut); i=i+1; end

    if(!i) $display("All Correct!");

    $finish;
end

endmodule
