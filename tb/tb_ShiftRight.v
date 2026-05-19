`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2026 11:20:09 AM
// Design Name: 
// Module Name: tb_ShiftRight
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_ShiftRight();

reg [1:56] Data;
reg [4:0] n;
wire [1:56] out;

integer i;

ShiftRight uut (
    .Data(Data),
    .n(n),
    .out(out)
);

initial 
begin
    $display ("====================TEST=====================");
    Data = 14'h00000000000001;
    for (i = 1; i <= 16; i = i + 1)
    begin
        n = i;
        #10;
        $display("Round=%0d | Data=%h | Out=%h", n, Data, out);
        Data = out;
    end
    $stop;
end
endmodule
