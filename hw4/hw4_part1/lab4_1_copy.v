`timescale 1ns / 1ps

module AddParity(
input [1:8] dataIn,
output reg [1:12] dataOut
);

always @(*) 
begin
    dataOut[1] = 
        dataIn[1] ^ dataIn[2] ^ dataIn[4] ^ dataIn[5] ^ dataIn[7];
    dataOut[2] =
        dataIn[1] ^ dataIn[3] ^ dataIn[4] ^ dataIn[6] ^ dataIn[7];
    dataOut[4] =
        dataIn[2] ^ dataIn[3] ^ dataIn[4] ^ dataIn[8];
    dataOut[8] =
        dataIn[5] ^ dataIn[6] ^ dataIn[7] ^ dataIn[8];

    dataOut[3] = dataIn[1];
    dataOut[5] = dataIn[2];
    dataOut[6] = dataIn[3];
    dataOut[7] = dataIn[4];
    dataOut[9] = dataIn[5];
    dataOut[10] = dataIn[6];
    dataOut[11] = dataIn[7];
    dataOut[12] = dataIn[8];
end
endmodule

module CheckParity(
input [1:12] dataIn,
output reg [1:8] dataOut
);

reg [1:4] C;

always@(*) begin
    C[4] = dataIn[1] ^ dataIn[3] ^ dataIn[5] ^ dataIn[7] ^ dataIn[9] ^ dataIn[11];
    C[3] = dataIn[2] ^ dataIn[3] ^ dataIn[6] ^ dataIn[7] ^ dataIn[10] ^ dataIn[11];
    C[2] = dataIn[4] ^ dataIn[5] ^ dataIn[6] ^ dataIn[7] ^ dataIn[12];
    C[1] = dataIn[8] ^ dataIn[9] ^ dataIn[10] ^ dataIn[11] ^ dataIn[12];

    dataOut[1]=dataIn[3];
    dataOut[2]=dataIn[5];
    dataOut[3]=dataIn[6];
    dataOut[4]=dataIn[7];
    dataOut[5]=dataIn[9];
    dataOut[6]=dataIn[10];
    dataOut[7]=dataIn[11];
    dataOut[8]=dataIn[12];
    
    case (C)  
        0:;
        1:;
        2:;
        3: dataOut[1]=~dataOut[1];
        4:;
        5: dataOut[2]=~dataOut[2]; 
        6: dataOut[3]=~dataOut[3]; 
        7: dataOut[4]=~dataOut[4]; 
        8:;
        9: dataOut[5]=~dataOut[5]; 
        10:  dataOut[6]=~dataOut[6]; 
        11:  dataOut[7]=~dataOut[7];
        12:  dataOut[8]=~dataOut[8];
    endcase
end

endmodule


module RAM(
input [7:0] dataIn, //0:read, 1:write
input clk,
input mode,
input [3:0] addr,
output reg [7:0] dataOut);

reg [7:0] mem [15:0];
reg [4:0] j;
initial begin
    for (j=0; j < 16; j=j+1) mem[j] <= 0;
end

always @(posedge clk ) begin
    if (mode) begin //write
        mem[addr] = dataIn;
    end else begin //read
        dataOut = mem[addr];
    end
end
endmodule

module SEC_MEM(
input [1:12] dataIn,
input clk,
input mode, //0:read, 1:write
input [3:0] addr,
output  [1:12] dataOut);

//DO NOT EDIT THIS MODULE
wire  [7:0]  ramDataIn;
wire  [7:0]  ramDataOut;
CheckParity CP(dataIn,ramDataIn);
RAM RM(ramDataIn, clk, mode, addr, ramDataOut);
AddParity AP(ramDataOut,dataOut);

endmodule
