/*
 * Copyright (c) 2026 davieslennox0
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_davieslennox0_maj3 (
  input wire [7:0] ui_in, output wire [7:0] uo_out,
  input wire [7:0] uio_in, output wire [7:0] uio_out, output wire [7:0] uio_oe,
  input wire ena, input wire clk, input wire rst_n);
  wire a = ui_in[0], b = ui_in[1], c = ui_in[2];
  wire n5 = ~(a & b), n6 = ~(a & c), n7 = ~(b & c);
  wire n8 = ~(n5 & n6), n9 = ~(n8 & n8);
  wire y = ~(n9 & n7);
  assign uo_out = {7'b0, y};
  assign uio_out = 8'b0;
  assign uio_oe = 8'b0;
  wire _unused = &{ena, clk, rst_n, uio_in, ui_in[7:3], 1'b0};
endmodule
