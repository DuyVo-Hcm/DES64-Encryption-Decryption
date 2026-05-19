`timescale 1ns / 1ps
module DES_TOP(
    input CLK,
    input Resetn,
    input Start,

    input [1:64] Plaintext,
    input [1:64] Key,

    output [1:64] Ciphertext,
    output done,
    output [1:32] L_dbg,
	output [1:32] R_dbg,
    output [1:48] K_dbg
);

//================= WIRE =================
wire S_Data, S_Key;
wire [4:0] n;
wire WE_D;
wire WE_K;

//================= CONTROL UNIT =================
ControllUnit CU (
    .CLK(CLK),
    .Start(Start),
    .Resetn(Resetn),

    .S_Data(S_Data),
    .S_Key(S_Key),
    .n(n),
    .WE_D(WE_D),
    .WE_K(WE_K),
    .done(done)
);

//================= DATAPATH =================
Datapath DP (
    .CLK(CLK),
    .RST(Resetn),   

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
    .K_dbg(K_dbg)
);
endmodule