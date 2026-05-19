`timescale 1ns / 1ps

module tb_Datapath;

reg CLK;
reg RST;

reg [1:64] Plaintext;
reg [1:64] Key;

reg S_Data, S_Key;
reg [4:0] n;
reg done;

reg WE_D;
reg WE_K;

wire [1:64] Ciphertext;
wire [1:32] L_dbg, R_dbg;
wire [1:48] K_dbg;
wire [1:32] F_dbg;

// DUT
Datapath dut (
    .CLK(CLK),
    .RST(RST),
    .Plaintext(Plaintext),
    .Key(Key),
    .S_Data(S_Data),
    .S_Key(S_Key),
    .n(n),
    .done(done),
    .WE_D(WE_D),
    .WE_K(WE_K),
    .Ciphertext(Ciphertext),
    .L_dbg(L_dbg),
    .R_dbg(R_dbg),
    .K_dbg(K_dbg),
    .F_dbg(F_dbg)
);

// clock
always #5 CLK = ~CLK;

integer i;

initial begin
    CLK = 0;
    RST = 0;

    S_Data = 0;
    S_Key  = 0;
    WE_D   = 0;
    WE_K   = 0;
    done   = 0;
    n      = 0;

    Plaintext = 64'h00123456789abcde;
    Key       = 64'h0133457799bbcdff;

    // RESET
    #10 RST = 1;

    // LOAD
    @(negedge CLK);
    S_Data = 0;
    S_Key  = 0;
    WE_D   = 1;
    WE_K   = 1;

    @(posedge CLK);
    @(negedge CLK);

    WE_D = 0;
    WE_K = 0;

    $display("After LOAD:");
    $display("L=%h | R=%h", L_dbg, R_dbg);

    // 16 ROUNDS
    for (i = 1; i <= 16; i = i + 1) begin

        // SHIFT KEY
        @(negedge CLK);
        n      = i;
        S_Key  = 1;
        WE_K   = 1;

        @(posedge CLK);

        // ROUND
        @(negedge CLK);
        S_Key  = 0;
        WE_K   = 0;

        S_Data = 1;
        WE_D   = 1;

        @(posedge CLK);
        @(negedge CLK);

        $display("R%0d | L=%h | R=%h | K=%h | F=%h",
                  i, L_dbg, R_dbg, K_dbg, F_dbg);

        WE_D = 0;
    end

    // DONE
    @(negedge CLK);
    done = 1;

    @(posedge CLK);
    @(negedge CLK);

    $display("====================================");
    $display("Ciphertext = %h", Ciphertext);
    $display("Expected   = 85E813540F0AB405");
    $display("====================================");

    #20;
    $stop;
end

endmodule