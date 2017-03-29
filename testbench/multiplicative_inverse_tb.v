`include "../src/multiplicative_inverse.v"

module multiplicative_inverse_tb ();

  parameter n = 16;
  reg [n-1:0] A;
  reg [n-1:0] p;
  wire [n-1:0] X;
  reg clk;
  reg reset;
  wire result_ready;



  multiplicative_inverse #(n) multi_inv (.clk(clk), .reset(reset), .p(p), .A(A), .X(X), .result_ready(result_ready));

  initial begin
    clk = 1; forever #5 clk = ~clk;
  end

  initial begin
    reset <= 1;
    #10 reset <= 0;
    p <= 23497;
    A <= 345;
    #10
    wait(result_ready == 1);
    #10

    $write("\nA = %0d, p = %0d, A^{-1} = %0d\n", A, p, X);
    $display("time %0d", $time);

    #10
    $stop;
  end




endmodule // modular_multiplication_tb
