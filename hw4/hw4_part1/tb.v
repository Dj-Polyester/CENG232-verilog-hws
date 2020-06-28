`timescale 1ns / 1ps
module AddParity_tb;

    reg [1:8] dataIn;
    wire [1:12] dataOut;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  

    AddParity UUT (.dataIn(dataIn), .dataOut(dataOut));
    
    initial // initial block executes only once
        begin
            //i=0;
            $display("0)%b %b",dataIn, dataOut);
            dataIn = 8'b0;
            $display("1)%b %b",dataIn, dataOut);
            #period
            $display("2)%b %b",dataIn, dataOut);
        end
endmodule
