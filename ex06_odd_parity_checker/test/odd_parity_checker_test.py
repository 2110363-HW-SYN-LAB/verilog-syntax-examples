import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
from cocotb.triggers import RisingEdge, FallingEdge

import os
from pathlib import Path
from cocotb_tools.runner import get_runner

@cocotb.test()
async def test(dut):
    input_in = (0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0)
    input_rst = (1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0)
    output_out = (None, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1)
    clock = Clock(dut.clk, 10, unit="ns")
    clock.start(start_high=False)

    for i in range(0, len(input_in), 2):
        dut['in'].value = input_in[i]
        dut['rst'].value = input_rst[i]
        await Timer(1, unit='ns')
        if output_out[i] is not None:    # Check waveform at falling edge
            assert dut['out'].value == output_out[i], f"[Assertion {i}] Expected out to be {output_out[i]}, but got {dut['out'].value}"
        await RisingEdge(dut.clk)
        if i+1 >= len(input_in):
            break
        dut['in'].value = input_in[i+1]
        dut['rst'].value = input_rst[i+1]
        await Timer(1, unit='ns')
        if output_out[i+1] is not None:  # Check waveform at rising edge
            assert dut['out'].value == output_out[i+1], f"[Assertion {i+1}] Expected out to be {output_out[i+1]}, but got {dut['out'].value}"
        await FallingEdge(dut.clk)

        
def runner():
    # --- Fill the information below ---
    
    # Path to all related Verilog files
    verilog_files = [
        "../odd_parity_checker.v"
    ]
    
    # Top-level module name
    top_module = "odd_parity_checker"
    
    # Test module name (normally it is the name of this file without .py
    # except your testcase is in other Python file)
    test_module = "odd_parity_checker_test"
    
    # ----------------------------------
    
    sim = os.getenv("SIM", "icarus")

    proj_path = Path(__file__).resolve().parent

    sources = [proj_path / Path(f) for f in verilog_files]
    
    runner = get_runner(sim)

    runner.build(
        sources=sources,
        hdl_toplevel=top_module,
        always=True,
        waves=True,
        timescale=('1ns','1ps')
    )
    
    runner.test(hdl_toplevel=top_module, test_module=test_module, waves=True)

if __name__ == "__main__":
    runner()