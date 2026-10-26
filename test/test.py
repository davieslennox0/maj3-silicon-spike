# SPDX-License-Identifier: Apache-2.0
# RTL test for tt_um_davieslennox0_gc012 (FabX task GC-012, 4-to-2 one-hot encoder with error detector).
# Expected outputs are the 16 distinct input/output pairs of the task's published test vectors
# (the 256 official vectors repeat these 16), so this checks the design against the task, not against itself.

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

# ui_in[3:0] -> uo_out[3:0]; uo_out[7:4] is tied low by the wrapper.
EXPECTED = {
    0x00: 0x00,
    0x01: 0x04,
    0x02: 0x05,
    0x03: 0x08,
    0x04: 0x06,
    0x05: 0x08,
    0x06: 0x08,
    0x07: 0x08,
    0x08: 0x07,
    0x09: 0x08,
    0x0a: 0x08,
    0x0b: 0x08,
    0x0c: 0x08,
    0x0d: 0x08,
    0x0e: 0x08,
    0x0f: 0x08,
}


@cocotb.test()
async def test_all_input_rows(dut):
    dut._log.info("Start")
    clock = Clock(dut.clk, 10, unit="us")
    cocotb.start_soon(clock.start())

    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    for x, want in EXPECTED.items():
        dut.ui_in.value = x
        await ClockCycles(dut.clk, 1)
        got = int(dut.uo_out.value)
        assert got == want, f"ui_in=0x{x:02x}: uo_out=0x{got:02x}, expected 0x{want:02x}"
