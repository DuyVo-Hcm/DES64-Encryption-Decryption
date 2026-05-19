module Reg64 (
    input clk,
    input rst,
    input WE,
    input [1:64] in,
    output [1:64] out
);

reg [1:64] data_reg;

always @(posedge clk or negedge rst) begin
    if (!rst)
        data_reg <= 0;
    else if (WE)
        data_reg <= in;
end

assign out = data_reg;

endmodule
