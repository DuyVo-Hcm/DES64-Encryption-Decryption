module Reg56 (
    input clk,
    input rst,
    input WE,                         
    input [1:56] in,
    output [1:56] out
);

reg [1:56] data_reg;

always @(posedge clk or negedge rst) begin
    if (!rst)
        data_reg <= 0;
    else if (WE)          
        data_reg <= in;
end

assign out = data_reg;

endmodule
