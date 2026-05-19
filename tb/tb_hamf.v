`timescale 1ns / 1ps

module tb_Hamf;

reg  [1:32] R;
reg  [1:48] K;
wire [1:32] F;

Hamf uut (
    .R(R),
    .K(K),
    .F(F)
);

// M?ng l?u R và K
reg [1:32] R_array [1:16];
reg [1:48] K_array [1:16];

integer i;

initial begin
    // =========================
    // GÁN R (16 ROUND)
    // =========================
    R_array[1]  = 32'hE054F0AA;
    R_array[2]  = 32'h0F2FAD9A;
    R_array[3]  = 32'h681C7DA1;
    R_array[4]  = 32'hD5148B08;
    R_array[5]  = 32'h9C552D13;
    R_array[6]  = 32'h0D26BCF5;
    R_array[7]  = 32'h33911636;
    R_array[8]  = 32'h43779F57;
    R_array[9]  = 32'h5F6CFA8E;
    R_array[10] = 32'hB8719FE6;
    R_array[11] = 32'h8A79F26A;
    R_array[12] = 32'h4487EEA0;
    R_array[13] = 32'hFA3651CF;
    R_array[14] = 32'h3F79C6A6;
    R_array[15] = 32'h9FCA2B87;
    R_array[16] = 32'h6E46DBB7;

    // =========================
    // GÁN K (16 SUBKEY)
    // =========================
    K_array[1]  = 48'h1B02EFDB49A5;
    K_array[2]  = 48'h69AED925AE66;
    K_array[3]  = 48'h55FC8AB4ACD2;
    K_array[4]  = 48'h72ADD2AD8657;
    K_array[5]  = 48'h7CEC071FE6C2;
    K_array[6]  = 48'h63A51E3CC545;
    K_array[7]  = 48'h6C84B78AE4C6;
    K_array[8]  = 48'hF7883AECE781;
    K_array[9]  = 48'hC0DBEB27B839;
    K_array[10] = 48'hB1F347631D76;
    K_array[11] = 48'h215FC30D89BE;
    K_array[12] = 48'h7171F5455CD5;
    K_array[13] = 48'h95C5D14B80FD;
    K_array[14] = 48'h05743B783D8D; // thêm 0 cho ?? 48 bit
    K_array[15] = 48'hBF91850A17B5;
    K_array[16] = 48'hCB3D0BBC7072;

    $display("===== TEST HAM F 16 ROUND =====");

    for (i = 1; i <= 16; i = i + 1) begin
        R = R_array[i];
        K = K_array[i];
        #10;
        $display("Round %0d: R=%h, K=%h => F=%h", i, R, K, F);
    end

    $stop;
end

endmodule