`timescale 1ns / 1ps

module RAM_tb;

reg clk, mode;
reg [3:0] addr;
reg [7:0] dataIn;
reg [7:0] holder;
wire [7:0] dataOut;
reg [4:0] i;
reg [4:0] j;

RAM UUT(
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
initial #1;

initial begin
    $display("RAM initialization test all dataOut must be 0");
    j=0;
    for(i=0; i<16; i = i+1) begin
        addr=i; #10;
        if(dataOut !== 0) begin $display("RAM initial test no: %0d is wrong! | Your answer: %b | Address: %0d", i+1, dataOut, addr); j=j+1; end
    end
    if(!j) $display("All Correct!");

    $display("");
    $display("Writes some data, you won't see here");
    mode=1;
    for(i=0; i<16; i = i+1) begin
        addr=i; dataIn=511 - i*13; #10;
        //$display("dataIn: %b | mode: %b | addr: %d", dataIn, mode, addr);
    end

    $display("Now let read 'em");
    mode=0;
    j=0;
    for(i=0; i<16; i = i+1) begin
        addr=i; holder = 511 - i*13; #10;
        if(dataOut !== holder) begin  $display("Write and read test no: %0d is wrong! | Your answer: %b | Correct answer: %b", i+1, dataOut, holder); j=j+1; end
        //else $display("Write and read test no: %d is correct", i);
    end
    if(!j) $display("All Correct!");


    

    $finish;
end

endmodule
