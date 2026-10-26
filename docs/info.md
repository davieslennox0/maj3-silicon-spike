<!---
Datasheet source for the Tiny Tapeout flow.
-->

## How it works

The design is a purely combinational NAND network (34 synthesized cells) for FabX task GC-012, a 4-to-2 one-hot encoder with error detector. Inputs `ui[3:0]` are `in0..in3`; outputs `uo[3:0]` are `out0..out3`; all other pins are unused and tied low. The netlist comes from Forgeout's optimizer and was re-checked against the task's published test vectors.

## How to test

Apply a value on `ui[3:0]` and read `uo[3:0]`. The 16 input/output pairs are listed in `test/test.py`; for example input 0b0001 gives output 0b0100 and input 0b1000 gives 0b0111. Run the RTL test with `cd test && make` (needs cocotb and Icarus Verilog).

## External hardware

None.

## Status

Tapeout-ready export. We have not ordered fabrication. Ordering is a separate paid step that the circuit owner completes on Tiny Tapeout. We do not claim a physical chip exists.
