module Reg48 (
    input clk,
    input rst,
    input WE,
    input [1:48] in,
    output [1:48] out
);
reg [1:48] data_reg;

always @(posedge clk or negedge rst) begin
    if (!rst)
        data_reg <= 48'b0;
    else if (WE)
        data_reg <= in;
end
assign out = data_reg;
endmodule