`timescale 1ns / 1ps

module tb_DES_TOP;

reg CLK;
reg Resetn;
reg Start;

reg [1:64] Plaintext;
reg [1:64] Key;

wire [1:64] Ciphertext;
wire done;

wire [1:32] L_dbg, R_dbg;
wire [1:48] K_dbg;


// DUT
DES_TOP uut (
    .CLK(CLK),
    .Resetn(Resetn),
    .Start(Start),
    .Plaintext(Plaintext),
    .Key(Key),
    .Ciphertext(Ciphertext),
    .done(done),

    .L_dbg(L_dbg),
    .R_dbg(R_dbg),
    .K_dbg(K_dbg)
);

// clock
always #5 CLK = ~CLK;

integer round;

initial begin
    CLK = 0;
    Resetn = 0;
    Start = 0;

    Plaintext = 64'h00123456789abcde;
    Key       = 64'h0133457799bbcdff;

    #20;
    Resetn = 1;
    Start = 1;
    #10
    Start = 0;
    round = 0;

    while (!done) begin
        @(posedge CLK);
    #10; 
        if (uut.CU.State == 3'b100) begin
            round = round + 1;

            $display("=================================");
            $display("ROUND %0d", round);
            $display("L = %h", L_dbg);
            $display("R = %h", R_dbg);
            $display("K = %h", K_dbg);
        end
    end

    $display("=================================");
    $display("FINAL CIPHERTEXT = %h", Ciphertext);

    #20;
    $finish;
end

endmodule