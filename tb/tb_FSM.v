`timescale 1ns / 1ps

module tb_FSM;

reg CLK;
reg Start;
reg Resetn;
wire [2:0] State;

// Debug n?i b?
wire [3:0] n;
assign n = uut.n;

// Instantiate DUT
FSM uut (
    .CLK(CLK),
    .Start(Start),
    .Resetn(Resetn),
    .State(State)
);

// Clock 10ns
always #5 CLK = ~CLK;

// Stimulus
initial begin
    CLK = 0;
    Start = 0;
    Resetn = 0;

    // Reset
    #20;
    Resetn = 1;

    // Ch? ?n ??nh
    #20;

    // Start ch?y FSM
    Start = 1;

    // Ch?y ?? lâu ?? th?y vòng l?p n
    #600;

    // T?t Start (reset v? state 0)
    Start = 0;
    #40;

    // Start l?i
    Start = 1;
    #300;

    $stop;
end

// Monitor
initial begin
    $display("===== FSM Simulation =====");
    $monitor("T=%0t | Start=%b | State=%d | n=%d",
              $time, Start, State, n);
end

endmodule