`timescale 1ns / 1ps


module idelay2 #(
    parameter REFCLK_FREQUENCY = 200,
    parameter IDELAY_VALUE = 2

) (
    input wire clk,
    input wire reset,
    input wire data_in,
    output wire data_out,
    output RDY);
    
   
IDELAYCTRL IDELAYCTRL_inst (
      .RDY(RDY),       // 1-bit output: Ready output
      .REFCLK(clk), // 1-bit input: Reference clock input
      .RST(reset)        // 1-bit input: Active high reset input
   );

   IDELAYE2 #(
      .CINVCTRL_SEL("FALSE"),          // Enable dynamic clock inversion (FALSE, TRUE)
      .DELAY_SRC("DATAIN"),           // Delay input (IDATAIN, DATAIN)
      .HIGH_PERFORMANCE_MODE("FALSE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
      .IDELAY_TYPE("FIXED"),           // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
      .IDELAY_VALUE(IDELAY_VALUE),                // Input delay tap setting (0-31)
      .PIPE_SEL("FALSE"),              // Select pipelined mode, FALSE, TRUE
      .REFCLK_FREQUENCY(REFCLK_FREQUENCY),        // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
      .SIGNAL_PATTERN("DATA")          // DATA, CLOCK input signal
   )
   IDELAYE2_inst (
      .CNTVALUEOUT(), // 5-bit output: Counter value output
      .DATAOUT(data_out),         // 1-bit output: Delayed data output
      .C(clk),                     // 1-bit input: Clock input
      .CE(1'b0),                   // 1-bit input: Active high enable increment/decrement input
      .CINVCTRL(0),       // 1-bit input: Dynamic clock inversion input
      .CNTVALUEIN(5'b00000),   // 5-bit input: Counter value input
      .DATAIN(data_in),           // 1-bit input: Internal delay data input
      .IDATAIN(0),         // 1-bit input: Data input from the I/O
      .INC(0),                 // 1-bit input: Increment / Decrement tap delay input
      .LD(1'b0),                   // 1-bit input: Load IDELAY_VALUE input
      .LDPIPEEN(0),       // 1-bit input: Enable PIPELINE register to load data input
      .REGRST(1'b1)            // 1-bit input: Active-high reset tap-delay input
   );
endmodule

