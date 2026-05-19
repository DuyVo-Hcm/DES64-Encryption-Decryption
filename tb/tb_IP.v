`timescale 1ns/1ps

module tb_IP;

reg  [1:64] Data;
wire [1:64] out;

// g?i module IP
IP uut (
    .Data(Data),
    .IP(out)
);

// in ra console
initial begin
    $monitor("Time=%0t | Data=%b | Out=%b", $time, Data, out);
end

initial begin
    $display("===== TEST IP =====");

    // Test 1: all 0
    Data = 64'b1111111111111111111111111111111111111111111111111111111111111111;
    #10;


    $display("===== END TEST =====");
    $stop;
end

endmodule