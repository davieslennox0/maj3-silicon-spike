/*
 * Copyright (c) 2026 davieslennox0
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_davieslennox0_latch1 (
  input wire [7:0] ui_in, output wire [7:0] uo_out,
  input wire [7:0] uio_in, output wire [7:0] uio_out, output wire [7:0] uio_oe,
  input wire ena, input wire clk, input wire rst_n);
  wire d = ui_in[0];
  wire en = ui_in[1];
  reg q;
  always @(*) begin
    if (en) q = d;
  end
  assign uo_out = {7'b0, q};
  assign uio_out = 8'b0;
  assign uio_oe = 8'b0;
  wire _unused = &{ena, clk, rst_n, uio_in, ui_in[7:2], 1'b0};
endmodule
