`timescale 1ns / 1ps

module AddParity_tb;

reg [1:8] dataIn;
wire [1:12] dataOut;

integer i;

AddParity UUT(
    .dataIn(dataIn),
    .dataOut(dataOut)
);
localparam period = 1;
initial begin
    i=0;
    dataIn = 8'b0;

    #period
    if(dataOut !== 12'b000000000000) begin 
        $display("AddParity test no:1 wrong! | Your answer: %b | Correct answer: 000000000000", dataOut); 
        //i=i+1; 
    end
    //else $display("AddParity test no:1 correct");
    dataIn = 8'b01010101; 
    #period
    if(dataOut !== 12'b000110100101) begin 
        $display("AddParity test no:2 wrong! | Your answer: %b | Correct answer: 000110100101", dataOut); 
        //i=i+1; 
    end
    //else $display("AddParity test no:2 correct");
    dataIn = 8'b10101010; 
    #period
    if(dataOut !== 12'b111101001010) begin 
        $display("AddParity test no:3 wrong! | Your answer: %b | Correct answer: 111101001010", dataOut); 
        //i=i+1; 
    end
    //else $display("AddParity test no:3 correct");
    
    dataIn = 8'b01001011; 
    #period
    if(dataOut !== 12'b110010011011) begin 
        $display("AddParity test no:4 wron!g | Your answer: %b | Correct answer: 110010011011", dataOut); 
        //i=i+1; 
    end
    //else $display("AddParity test no:4 correct");
    
    dataIn = 8'b11111111; 
    #period
    if(dataOut !== 12'b111011101111) begin 
        $display("AddParity test no:5 wrong! | Your answer: %b | Correct answer: 111011101111", dataOut); 
        //i=i+1; 
    end
    //else $display("AddParity test no:5 correct");
    
    dataIn = 8'b11000110; 
    #period
    if(dataOut !== 12'b111110000110) begin 
        $display("AddParity test no:6 wrong! | Your answer: %b | Correct answer: 111110000110", dataOut); 
        //i=i+1; 
    end
    //else $display("AddParity test no:6 correct");
    
    dataIn = 8'b00100111; 
    #period
    if(dataOut !== 12'b110001010111) begin 
        $display("AddParity test no:7 wrong! | Your answer: %b | Correct answer: 110001010111", dataOut); 
        //i=i+1; 
    end
    //else $display("AddParity test no:7 correct");

    if(!i) $display("All Correct!");

    $finish;
end

endmodule
