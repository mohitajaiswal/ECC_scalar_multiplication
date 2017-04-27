`include "../src/point_addition.v"

module point_addition_tb ();

  parameter n = 230;
  reg [n-1:0] x1, x2, y1, y2;
  wire [n-1:0] x3, y3;
  reg clk;
  reg reset;
  wire result_ready, infinity;

  wire [n-1:0] p = 224'hffffffffffffffffffffffffffffffff000000000000000000000001;
//384'hfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeffffffff0000000000000000ffffffff;//521'h000001ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;//256'hffffffff00000001000000000000000000000000ffffffffffffffffffffffff;

  point_addition #(n) ptaddition (.clk(clk), .reset(reset), .p(p), .x1(x1),
        .y1(y1), .x2(x2), .y2(y2), .x3(x3), .y3(y3), .result(result_ready), .infinity(infinity));

  initial begin
    clk = 1; forever #5 clk = ~clk;
  end

  initial begin
    reset <= 1;
    #10 reset <= 0;
    //x1 <= 192'hd458e7d127ae671b0c330266d246769353a012073e97acf8;
    x1 <= 224'h6eca814ba59a930843dc814edd6c97da95518df3c6fdf16e9a10bb5b;
    //x1 <= 256'hde2444bebc8d36e682edd27e0f271508617519b3221a8fa0b77cab3989da97c9;
    // x1 <= 384'hfba203b81bbd23f2b3be971cc23997e1ae4d89e69cb6f92385dda82768ada415ebab4167459da98e62b1332d1e73cb0e;
    // x1 <= 521'h000001d5c693f66c08ed03ad0f031f937443458f601fd098d3d0227b4bf62873af50740b0bb84aa157fc847bcf8dc16a8b2b8bfd8e2d0a7d39af04b089930ef6dad5c1b4;
    // y1 <= 192'h325930500d851f336bddc050cf7fb11b5673a1645086df3b;
    y1 <= 224'hef4b497f0963bc8b6aec0ca0f259b89cd80994147e05dc6b64d7bf22;
    //y1 <= 256'hc093ae7ff36e5380fc01a5aad1e66659702de80f53cec576b6350b243042a256;
    // y1 <= 384'h5ffedbaefdeba603e7923e06cdb5d0c65b22301429293376d5c6944e3fa6259f162b4788de6987fd59aed5e4b5285e45;
    // y1 <= 521'h00000144b7770963c63a39248865ff36b074151eac33549b224af5c8664c54012b818ed037b2b7c1a63ac89ebaa11e07db89fcee5b556e49764ee3fa66ea7ae61ac01823;
    // x2 <= 192'hf22c4395213e9ebe67ddecdd87fdbd01be16fb059b9753a4;
    x2 <= 224'hb72b25aea5cb03fb88d7e842002969648e6ef23c5d39ac903826bd6d;
    //x2 <= 256'h55a8b00f8da1d44e62f6b3b25316212e39540dc861c89575bb8cf92e35e0986b;
    // x2 <= 384'haacc05202e7fda6fc73d82f0a66220527da8117ee8f8330ead7d20ee6f255f582d8bd38c5a7f2b40bcdb68ba13d81051;
    // x2 <= 521'h000000f411f2ac2eb971a267b80297ba67c322dba4bb21cec8b70073bf88fc1ca5fde3ba09e5df6d39acb2c0762c03d7bc224a3e197feaf760d6324006fe3be9a548c7d5;
    // y2 <= 192'h264424096af2b3597796db48f8dfb41fa9cecc97691a9c79;
    y2 <= 224'hc42a8a4d34984f0b71b5b4091af7dceb33ea729c1a2dc8b434f10c34;
    //y2 <= 256'h5421c3209c2d6c704835d82ac4c3dd90f61a8a52598b9e7ab656e9d8c8b24316;
    // y2 <= 384'h84009a263fefba7c2c57cffa5db3634d286131afc0fca8d25afa22a7b5dce0d9470da89233cee178592f49b6fecb5092;
    // y2 <= 521'h000001fdf842769c707c93c630df6d02eff399a06f1b36fb9684f0b373ed064889629abb92b1ae328fdb45534268384943f0e9222afe03259b32274d35d1b9584c65e305;
    #10
    wait(result_ready == 1 | infinity == 1);
    #20 //I have to wait at least one cycle in order for the results to be shown in the registers.
    $write("\nP = (%0h, %0h), Q = (%0h, %0h), P + Q = (%0h, %0h)\n",
          x1, y1, x2, y2, x3, y3);
    $display("time %0d", $time);




    $stop;
  end




endmodule // modular_multiplication_tb
