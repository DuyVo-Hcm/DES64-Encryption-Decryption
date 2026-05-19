`timescale 1ns / 1ps

module tb_DES_Decrypt;

reg CLK;
reg Resetn;
reg Start;

reg [1:64] Ciphertext;
reg [1:64] Key;

wire [1:64] Plaintext;
wire done;


//================ DUT =================
DES_Decrypt dut (
    .CLK(CLK),
    .Resetn(Resetn),
    .Start(Start),
    .Ciphertext(Ciphertext),
    .Key(Key),
    .Plaintext(Plaintext),
    .done(done)
);


//================ CLOCK =================
always #5 CLK = ~CLK;

integer tc;


//======================================================
// TASK RUN TEST
//======================================================
task run_test;

input [63:0] ct;
input [63:0] key;
input [63:0] expected_pt;

begin

    // reset
    Resetn = 0;
    Start  = 0;

    repeat(2) @(posedge CLK);

    Resetn = 1;

    // input
    Ciphertext = ct;
    Key        = key;

    // start pulse
    @(posedge CLK);
    Start = 1;

    @(posedge CLK);
    Start = 0;

    // wait done
    @(posedge done);
    #1;

    // print result immediately
    $display("==============================================");
    $display("TEST CASE %0d", tc);
    $display("CIPHERTEXT = %h", ct);
    $display("KEY        = %h", key);
    $display("PLAINTEXT  = %h", Plaintext);

    if (Plaintext == expected_pt)
        $display("RESULT     = PASS");
    else
        $display("RESULT     = FAIL");

    @(posedge CLK);

end
endtask



//======================================================
// MAIN TEST
//======================================================
initial begin

    CLK = 0;
    tc  = 1;

    // TEST CASE 1
    run_test(
        64'h1ABFF69D5A93E80B,
        64'h0133457799BBCDFF,
        64'h00123456789ABCDE
    );
    tc = tc + 1;


    // TEST CASE 2
    run_test(
        64'h85E813540F0AB405,
        64'h133457799BBCDFF1,
        64'h0123456789ABCDEF
    );
    tc = tc + 1;


    // TEST CASE 3
    run_test(
        64'h08024FCF811DA672,
        64'h2222222222222222,
        64'h1111111111111111
    );
    tc = tc + 1;


    // TEST CASE 4
    run_test(
        64'h8CA64DE9C1B123A7,
        64'h0000000000000000,
        64'h0000000000000000
    );
    tc = tc + 1;


    // TEST CASE 5
    run_test(
        64'h7359B2163E4EDC58,
        64'hFFFFFFFFFFFFFFFF,
        64'hFFFFFFFFFFFFFFFF
    );
    tc = tc + 1;


    // TEST CASE 6
    run_test(
        64'h343A09F9B2CB5CCA,
        64'h5555555555555555,
        64'hAAAAAAAAAAAAAAAA
    );
    tc = tc + 1;


    // TEST CASE 7
    run_test(
        64'h180419FB1A3814AF,
        64'h0F1571C947D9E859,
        64'h1234567890ABCDEF
    );
    tc = tc + 1;


    // TEST CASE 8
    run_test(
        64'hCA246075E30CA7B7,
        64'hAABB09182736CCDD,
        64'hFEDCBA9876543210
    );
    tc = tc + 1;


    // TEST CASE 9
    run_test(
        64'h55ACF9E2DAA89BE9,
        64'h1A2B3C4D5E6F7788,
        64'h13579BDF2468ACE0
    );
    tc = tc + 1;


    // TEST CASE 10
    run_test(
        64'h9782675A69186083,
        64'h0A0B0C0D0E0F1011,
        64'hCAFEBABE12345678
    );
    tc = tc + 1;


    $display("==============================================");
    $display("ALL TEST CASES FINISHED");
    $display("==============================================");

    #50;
    $finish;

end

endmodule