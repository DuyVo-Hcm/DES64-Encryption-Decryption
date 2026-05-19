`timescale 1ns/1ps

module tb_tri64;

reg  [1:64] in;
reg  en;
wire [1:64] out;

// Instantiate DUT
Tri_64 dut (
    .in(in),
    .en(en),
    .out(out)
);

initial begin
    en = 1;
    in = 64'h1234_ABCD_5678_EF00;
    #20;
    en = 0;
    #10;
    in = 64'hFFFF_FFFF_FFFF_FFFF;
    #20;
    en = 1;
    #20;

    $finish;
end

endmodule