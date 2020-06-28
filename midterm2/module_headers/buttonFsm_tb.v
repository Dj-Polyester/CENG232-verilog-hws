`timescale 1ns / 1ps

module buttonFsm_tb;

reg clk;
reg button;
wire stateful_button; 
localparam period = 2;
integer i, j, limit, file;

buttonFsm UUT(
    .clk(clk),
    .button(button),
    .stateful_button(stateful_button)
);

initial clk=0;
always #period clk=~clk;

always @(posedge clk) begin
    $display("CLOCK CYCLE %0d\nTime %0t (posedge) current output %0d", i, $time, stateful_button);
    $fdisplay(file,"CLOCK CYCLE %0d\nTime %0t (posedge) current output %0d", i, $time, stateful_button);
    #(period/2)
    $display("Time %0t (hi-level) current output %0d", $time, stateful_button);
    $fdisplay(file,"Time %0t (hi-level) current output %0d", $time, stateful_button);
end
always @(negedge clk) begin
    $display("Time %0t (negedge) current output %0d", $time, stateful_button);
    $fdisplay(file,"Time %0t (negedge) current output %0d", $time, stateful_button);
    #(period/2)
    $display("Time %0t (lo-level) current output %0d\n\n\n", $time, stateful_button);
    $fdisplay(file,"Time %0t (lo-level) current output %0d\n\n\n", $time, stateful_button);
end

initial 
begin

    limit = 100;
    $timeformat(-9, 0, " ns", 20);
    file = $fopen("buttonFsm.log","a");
    $display("Time %0t pre-initial output %0d", $time, stateful_button);
    $fdisplay(file,"Time %0t pre-initial output %0d", $time, stateful_button);
    #(period/2)
    $display("Time %0t initial output %0d\n\n\n", $time, stateful_button);
    $fdisplay(file, "Time %0t initial output %0d\n\n\n", $time, stateful_button);
    for (i = 0; i<limit; i=i+1) begin
        button = $random % 2;
        #period;
        #period;
    end
    $fclose(file);
    $finish;
end

endmodule
