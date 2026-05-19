`timescale 1ns/1ps

module tb_ShiftLeft;

reg  [1:56] Data;
reg  [4:0]  n;
wire [1:56] out;

integer i;

ShiftLeft uut (
    .Data(Data),
    .n(n),
    .out(out)
);

initial begin
    $display("===== TEST SHIFT LEFT =====");

    Data = 56'hf0ccaabaaccf0a;

    for (i = 1; i <= 16; i = i + 1) begin
        n = i;
        #10;
        $display("Round=%0d | Data=%h | Out=%h", n, Data, out);
        
        Data = out;
    end

    $display("===== END TEST =====");
    $stop;
end

endmodule