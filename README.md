# JK-flipfop-using-d-flipflop
This repository contains a Verilog implementation of a JK Flip-Flop using a D Flip-Flop. 
module jk_using_d(
    input J,
    input K,
    input clk,
    output reg Q
);
    wire D;

    // JK to D conversion logic
    assign D = (J & ~Q) | (~K & Q);

    // D Flip-Flop behavior
    always @(posedge clk) begin
        Q <= D;
    end
endmodule
