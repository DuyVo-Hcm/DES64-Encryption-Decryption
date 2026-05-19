`timescale 1ns / 1ps

module tb_Reg64();
reg clk, rst, WE;
reg [1:64] in;
wire [1:64] out;

Reg64 dut (
    .clk(clk), 
    .rst(rst), 
    .WE(WE), 
    .in(in), 
    .out(out) 
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 0;
    WE = 0;
    in = 64'b0;
    
    #20 in = 64'h123456789ABCDEF0;
    #20 WE = 1;
    #40 rst = 1;
end
endmodule
