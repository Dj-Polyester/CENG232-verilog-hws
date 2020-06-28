`timescale 1ns / 1ps

module sf(
    input S,
    input F,
    input clk,
    output reg Q
    );

    initial begin
        Q = 0;
    end
	
    // write your code here
    always @(posedge clk) begin
        case ({S,F})
        
           2'b00: Q<=1'b0;
           2'b01: Q<=1'b1;
           2'b10: Q<=Q;
           2'b11: Q<=~Q;
        endcase
    end
	 
endmodule

module ic1500(
    input B, 
    input A, 
    input X, 
	 input clk,
	 output D0,
	 output D1,
	 output Q,
    output Z
    );
    // write your code here
    wire C1 = A & ~B & ~X,
         C2 = ~A & B & ~X,
         C3 = A & ~B;
         
    assign D0 = C3 | X,
    D1 = C1 | C2;

    sf sf_a(
        .S(D1),
        .F(D0),
        .clk(clk),
        .Q(Q)
    );

    assign Z = Q & X;
endmodule
