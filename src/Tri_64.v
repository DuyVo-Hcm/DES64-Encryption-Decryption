module Tri_64(
    input [1:64] in,
    input en,
    output [1:64] out
);
assign out = en ? in : 64'bz;
endmodule
