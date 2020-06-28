`timescale 1ns / 1ps

module checkParity_tb;

reg [1:12] dataIn;
wire [1:8] dataOut;

reg [4:0] i;

CheckParity UUT(
    .dataIn(dataIn),
    .dataOut(dataOut)
);


initial begin
    i=0;
    
    dataIn = 12'b000000000000; #1
    if(dataOut !== 8'b00000000) begin $display("CheckParity test no: 1 wrong! | Your answer: %b | Correct answer: 00000000", dataOut); i=i+1; end
    //else $display("CheckParity test no: 1 correct");
    
    dataIn = 12'b000110100101; #1
    if(dataOut !== 8'b01010101) begin $display("CheckParity test no: 2 wrong! | Your answer: %b | Correct answer: 01010101", dataOut); i=i+1; end
    //else $display("CheckParity test no: 2 correct");
    
    dataIn = 12'b111101001010; #1
    if(dataOut !== 8'b10101010) begin $display("CheckParity test no: 3 wrong! | Your answer: %b | Correct answer: 10101010", dataOut); i=i+1; end
    //else $display("CheckParity test no: 3 correct");
    
    dataIn = 12'b110010011011; #1
    if(dataOut !== 8'b01001011) begin $display("CheckParity test no: 4 wrong! | Your answer: %b | Correct answer: 01001011", dataOut); i=i+1; end
    //else $display("CheckParity test no: 4 correct");
    
    dataIn = 12'b111011101111; #1
    if(dataOut !== 8'b11111111) begin $display("CheckParity test no: 5 wrong! | Your answer: %b | Correct answer: 11111111", dataOut); i=i+1; end
    //else $display("CheckParity test no: 5 correct");
    
    dataIn = 12'b111110000110; #1
    if(dataOut !== 8'b11000110) begin $display("CheckParity test no: 6 wrong! | Your answer: %b | Correct answer: 11000110", dataOut); i=i+1; end
    //else $display("CheckParity test no: 6 correct");
    
    dataIn = 12'b110001010111; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no: 7 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no: 7 correct");

    //error check starts

    dataIn = 12'b010001010111; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no: 8 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no: 8 correct");

    dataIn = 12'b100001010111; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no: 9 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no: 9 correct");

    dataIn = 12'b111001010111; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no:10 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no:10 correct");

    dataIn = 12'b110101010111; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no:11 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no:11 correct");

    dataIn = 12'b110011010111; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no:12 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no:12 correct");

    dataIn = 12'b110000010111; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no:13 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no:13 correct");

    dataIn = 12'b110001110111; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no:14 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no:14 correct");

    dataIn = 12'b110001000111; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no:15 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no:15 correct");

    dataIn = 12'b110001011111; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no:16 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no:16 correct");

    dataIn = 12'b110001010011; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no:17 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no:17 correct");

    dataIn = 12'b110001010101; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no:18 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no:18 correct");

    dataIn = 12'b110001010110; #1
    if(dataOut !== 8'b00100111) begin $display("CheckParity test no:19 wrong! | Your answer: %b | Correct answer: 00100111", dataOut); i=i+1; end
    //else $display("CheckParity test no:19 correct");

    if(!i) $display("All Correct");

    $finish;
end

endmodule
