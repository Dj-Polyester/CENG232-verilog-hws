`timescale 1ns / 1ps

module PharmacyMem_tb;

reg clk;
reg [1:0] mode;
reg [4:0] studentID;
reg [7:0] checkInTime;
wire [4:0] listOutput;
wire listBusy;
wire ready;
integer i;

PharmacyMem UUT(
    .clk(clk),
    .mode(mode),
    .studentID(studentID),
    .checkInTime(checkInTime),
    .listOutput(listOutput),
    .listBusy(listBusy),
    .ready(ready)
);

initial clk=0;
always #5 clk=~clk;

initial begin

    //$monitor("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    
    i=0;
    #1;
    $display("-------------------\t Insert 12 students");
    mode=2;
    checkInTime =  3; studentID = checkInTime;#10;
    checkInTime =  1; studentID = checkInTime;#10;
    checkInTime =  4; studentID = checkInTime;#10;
    checkInTime =  2; studentID = checkInTime;#10;
    checkInTime =  7; studentID = checkInTime;#10;
    checkInTime =  8; studentID = checkInTime;#10;
    checkInTime = 11; studentID = checkInTime;#10;
    checkInTime = 10; studentID = checkInTime;#10;
    checkInTime = 12; studentID = checkInTime;#10;
    checkInTime =  6; studentID = checkInTime;#10;
    checkInTime =  9; studentID = checkInTime;#10;
    checkInTime = 17; studentID = checkInTime;#10;
    mode=0;
    #10;    //Make it ready
    for (i = 0; i < 12; i = i + 1) if (ready === 0) begin
        $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    end    //Wait till display is ready again
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    $display("-------------------\t Delete Once");
    mode=3; #10;
    mode=0;
    #10;    //Make it ready
    for (i = 0; i < 12; i = i + 1) if (ready === 0) begin
        $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    end    //Wait till display is ready again
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    $display("-------------------\t Delete Once");
    mode=3; #10;
    mode=0;
    #10;    //Make it ready
    for (i = 0; i < 12; i = i + 1) if (ready === 0) begin
        $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    end    //Wait till display is ready again
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    $display("-------------------\t Delete Everything");
    $display("If this is the last thing you see there is something wrong with your delete. CTRL+C then write finish");
    mode=3;
    #110;
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    mode=0;
    #10;    //Make it ready
    for (i = 0; i < 12; i = i + 1) if (ready === 0) begin
        $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    end    //Wait till display is ready again
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    $display("-------------------\t Insert 6 students");
    mode=2;
    checkInTime =  5; studentID = checkInTime;#10;
    checkInTime =  24; studentID = checkInTime;#10;
    checkInTime =  12; studentID = checkInTime;#10;
    checkInTime =  17; studentID = checkInTime;#10;
    checkInTime =  11; studentID = checkInTime;#10;
    checkInTime =  1; studentID = checkInTime;#10;
    //mode=1; #10;    //DEBUG
    mode=0;
    #10;    //Make it ready
    for (i = 0; i < 12; i = i + 1) if (ready === 0) begin
        $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    end    //Wait till display is ready again
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    $display("-------------------\t Delete 5 students");
    mode=3; #50;
    mode=0;
    #10;    //Make it ready
    for (i = 0; i < 12; i = i + 1) if (ready === 0) begin
        $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    end    //Wait till display is ready again
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    $display("-------------------\t Test for checkInTime 0");
    mode=3;
    #50;
    mode=2;
    checkInTime =  5; studentID = checkInTime;#10;
    checkInTime =  24; studentID = checkInTime;#10;
    checkInTime =  12; studentID = checkInTime;#10;
    checkInTime =  17; studentID = checkInTime;#10;
    checkInTime =  11; studentID = checkInTime;#10;
    checkInTime =  0; studentID = checkInTime;#10;
    mode=0;
    #10;    //Make it ready
    for (i = 0; i < 12; i = i + 1) if (ready === 0) begin
        $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    end    //Wait till display is ready again
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    $display("-------------------\t Delete Everything");
    $display("If this is the last thing you see there is something wrong with your delete. CTRL+C then write finish");
    mode=3;
    #110;
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    mode=0;
    #10;    //Make it ready
    for (i = 0; i < 12; i = i + 1) if (ready === 0) begin
        $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    end    //Wait till display is ready again
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    $display("-------------------\t Heap Insertion Worst Case");
    mode=2;
    checkInTime =  10; studentID = checkInTime;#10;
    checkInTime =  9; studentID = checkInTime;#10;
    checkInTime =  8; studentID = checkInTime;#10;
    checkInTime =  7; studentID = checkInTime;#10;
    checkInTime =  6; studentID = checkInTime;#10;
    checkInTime =  5; studentID = checkInTime;#10;
    checkInTime =  4; studentID = checkInTime;#10;
    checkInTime =  3; studentID = checkInTime;#10;
    checkInTime =  2; studentID = checkInTime;#10;
    checkInTime =  1; studentID = checkInTime;#10;
    mode=0;
    #10;    //Make it ready
    for (i = 0; i < 12; i = i + 1) if (ready === 0) begin
        $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    end    //Wait till display is ready again
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    $display("-------------------\t Listing Interrupt with deletion after 3rd student");
    mode=0;
    #10; $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    #10; $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    #10; $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    mode=3;
    #10;
    $display("-------------------\t Output after interrupt");
    mode=0;
    #10;    //Make it ready
    for (i = 0; i < 12; i = i + 1) if (ready === 0) begin
        $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    end    //Wait till display is ready again
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    $display("-------------------\t Listing Interrupt with insertion after 3rd student");
    mode=0;
    #10; $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    #10; $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    #10; $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    mode=2;
    checkInTime =  1; studentID = checkInTime;#10;
    $display("-------------------\t Output after interrupt");
    mode=0;
    #10;    //Make it ready
    for (i = 0; i < 12; i = i + 1) if (ready === 0) begin
        $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready); #10;
    end    //Wait till display is ready again
    $display("Time %0d ListOutput %0d listBusy %0d ready %0d", $time, listOutput, listBusy, ready);
    $finish;
end

endmodule
