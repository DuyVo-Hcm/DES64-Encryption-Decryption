`timescale 1ns / 1ps

module tb_PC2;

reg  [1:56] Data;
wire [1:48] Key_out;

integer i;

// ================= DUT =================
PC2 dut (
    .key(Data),
    .out(Key_out)
);

// ================= 16 INPUT =================
reg [1:56] shift_out [1:16];

initial begin
   shift_out[1]  = 56'he1995575599e15;
shift_out[2]  = 56'hc332aafab33c2a;
shift_out[3]  = 56'h0ccaabfaccf0aa;
shift_out[4]  = 56'h332aafcb33c2aa;
shift_out[5]  = 56'hccaabf0ccf0aaa;
shift_out[6]  = 56'h32aafc333c2aab;
shift_out[7]  = 56'hcaabf0ccf0aaac;
shift_out[8]  = 56'h2aafc333c2aab3;
shift_out[9]  = 56'h555f8667855566;
shift_out[10] = 56'h557e199e155599;
shift_out[11] = 56'h55f86658555667;
shift_out[12] = 56'h57e1995155599e;
shift_out[13] = 56'h5f866555556678;
shift_out[14] = 56'h7e1995555599e1;
shift_out[15] = 56'hf8665555566785;
shift_out[16] = 56'hf0ccaabaaccf0a;

    // ================= IN KEY =================
    for (i = 1; i <= 16; i = i + 1) begin
        Data = shift_out[i];
        #1;
        $display("K%0d = %h", i, Key_out);
    end

    $finish;
end

endmodule