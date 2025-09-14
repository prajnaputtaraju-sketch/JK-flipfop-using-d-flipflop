module testbench;
    reg J, K, clk;
    wire Q;

    // Instantiate the JK Flip-Flop
    jk_using_d uut (
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q)
    );
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
end

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period = 10 time units
    end

    // Test all combinations of J and K inputs
    initial begin
        // Initialize inputs
        J = 0; K = 0; #10;  // Q should remain the same
        J = 0; K = 1; #10;  // Q should reset
        J = 1; K = 0; #10;  // Q should set
        J = 1; K = 1; #10;  // Q should toggle
        $finish;
    end

    // Monitor the output
    initial begin
        $monitor("Time=%0t : J=%b K=%b Q=%b", $time, J, K, Q);
    end
endmodule
