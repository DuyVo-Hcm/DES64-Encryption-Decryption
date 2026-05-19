`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2026 02:00:00 PM
// Design Name: 
// Module Name: FSM
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


module FSM(
input CLK, Start, Resetn,
output reg [2:0] State
);

reg [3:0] n;

localparam
    S0 = 3'b000,
    S1 = 3'b001,
    S2 = 3'b010,
    S3 = 3'b011,
    S4 = 3'b100,
    S5 = 3'b101;


always @ (posedge CLK or negedge Resetn )
begin
    if(!Resetn) begin
        n <= 0;
        State <= 0;
    end
   else 
   begin
        case(State)
        S0:
        begin
            n <= 0;

            if(Start)
                State <= S1;
        end
        
        S1:
        begin
            State <= S2;
        end
        
        S2:
        begin
            State <= S3;
        end
            
        S3:
        begin
            State <= S4;
        end
        
        S4:
        begin
            if( n < 15 ) begin
                State <= S2;
                n <= n + 1;
                end
             else
                State <= S5;
        end
        
        S5:
        begin
                if(!Start)
                State <= S0;
        end
        
        endcase
        end
end
endmodule
