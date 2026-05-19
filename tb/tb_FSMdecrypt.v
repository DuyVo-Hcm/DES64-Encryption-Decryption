`timescale 1ns / 1ps

module tb_FSMdecrypt;

reg CLK;
reg Start;
reg nReset;
wire [2:0] State;

// Instantiate DUT
FSM_Decrypt uut (
    .CLK(CLK),
    .Start(Start),
    .Resetn(nReset),
    .State(State)
);

// Clock 10ns
always #5 CLK = ~CLK;

// Stimulus
initial begin
    CLK = 0;
    Start = 0;
    nReset = 0;

    // Reset
    #20;
    nReset = 1;

    // Ch? ?n ??nh
    #20;

    // Start FSM
    Start = 1;
    #100 
    Start = 0;
    // Ch?y ?? 32 cycle (t?o K16 + decrypt)
    #900;

    // Stop
    

    $stop;
end

// Monitor
initial begin
    $display("===== FSM Simulation =====");
    $monitor("T=%0t | Start=%b | State=%b",
              $time, Start, State);
end

endmodule