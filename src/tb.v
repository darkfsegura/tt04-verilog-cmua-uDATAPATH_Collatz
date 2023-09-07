`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
    input BB_SYSTEM_CLOCK_50,
    input BB_SYSTEM_RESET_InHigh,
    input [7:0] BB_SYSTEM_data_InBUS,
    output [7:0] BB_SYSTEM_data_OutBUS
   );

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    
    wire clk = BB_SYSTEM_CLOCK_50;
    wire rst_n = BB_SYSTEM_RESET_InHigh;
    wire [7:0] ui_in = BB_SYSTEM_data_InBUS;
    wire [7:0] uo_out;
    assign BB_SYSTEM_data_OutBUS = uo_out[7:0];
    
    reg  ena;
    
 //   reg  [7:0] BB_SYSTEM_data_InBUS = ui_in[7:0]
 //   reg  [7:0] ui_in;   
    reg  [7:0] uio_in;

  //  wire [7:0] BB_SYSTEM_data_OutBUS = uo_out[7:0];
 //   wire [7:0] uo_out;
    wire [7:0] uio_out;
   wire [7:0] uio_oe;
    
    // instantiate the DUT
    tt_um_darkfsegura_collatz tt_um_darkfsegura_collatz(
        `ifdef GL_TEST
            .vccd1( 1'b1),
            .vssd1( 1'b0),
        `endif
        .ui_in      (ui_in),    // Dedicated inputs
        .uo_out     (uo_out),   // Dedicated outputs
        .uio_in     (uio_in),   // IOs: Input path
        .uio_out    (uio_out),  // IOs: Output path
        .uio_oe     (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
        .ena        (ena),      // enable - goes high when design is selected
        .clk        (clk),      // clock
        .rst_n      (rst_n)     // not reset
        );

endmodule
