`include "../src/double_and_add.v"

module double_and_add_tb ();

  parameter n = 10;
  reg [n-1:0] x1, y1;
  wire [n-1:0] x3, y3;
  reg clk, reset;
  reg [n-1:0] a, k;

  wire done;

  reg [n-1:0] p;

  double_and_add #(n) doubleandadd (.clk(clk), .reset(reset), .p(p), .k(k), .x1(x1), .y1(y1), .a(a), .x3(x3), .y3(y3), .done(done));

  initial begin
    clk = 1; forever #5 clk = ~clk;
  end

  initial begin
    reset <= 1;
    #10 reset <= 0;
    p <= 17;
    //Adding point P = (x1, y1)
    x1 <= 5;
    y1 <= 1;
    //Depends on the elliptic curve function Y^2 = X^3 + bX + a
    a <= 2;
    k <= 4;

    #10
    //checks if the result is ready, or the point is infinity.
    wait(done == 1);
    #20 //I have to wait at least one cycle in order for the results to be shown in the registers.
    $write("\nP = (%0d, %0d), kP = (%0d, %0d)\n",
          x1, y1, x3, y3);
    $display("time %0d", $time);




    $stop;
  end




endmodule // modular_multiplication_tb