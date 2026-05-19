`timescale 1ns/1ps

module tb_S_BOX;

reg  [1:48] Data;
wire [1:32] out;

// g?i module c?n test
S_BOX uut (
    .Data(Data),
    .out(out)
);

// in ra console
initial begin
    $monitor("Time=%0t | Data=%b | Out=%b", $time, Data, out);
end

// test
initial begin
    Data = 48'b0; #10;
    Data = 48'b111111111111111111111111111111111111111111111111; #10;
    Data = 48'b101010101010101010101010101010101010101010101010; #10;


    $stop;
end

endmodule