/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_matrix_mult (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // All output pins must be assigned. If not used, assign to 0.
    assign uio_oe[1:0] = 2'b11;
    assign uio_oe[7:2] = 6'b000000;
    assign uio_out[7:2] = 6'b000000;
  

    // List all unused inputs to prevent warnings
    wire _unused = &{ena, clk, rst_n, 1'b0};

    matrix_mult mat_mult1 (.mat1(ui_in), .mat2(uio_in[7:4]), .clk(clk), .reset_n(rst_n), .mat_out({uo_out, uio_out[1:0]}));

endmodule
