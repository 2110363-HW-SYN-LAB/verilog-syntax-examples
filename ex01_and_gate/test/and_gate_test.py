import os
from pathlib import Path
import cocotb
from cocotb.triggers import Timer
from cocotb_tools.runner import get_runner

@cocotb.test()
async def and_gate_test(dut):
    a = (0, 0, 1, 1)
    b = (0, 1, 0, 1)
    out = (0, 0, 0, 1)
    
    for i in range(4):
        dut.a.value = a[i]
        dut.b.value = b[i]
        await Timer(1, unit='ns')
        assert dut.out.value == out[i], f"[Iteration {i}] output is {dut.out.value}, expected {out[i]}"

def runner():  
    # Path to all related Verilog files
    verilog_files = [
        "../and_gate.v"
    ]
    
    # Top-level module name
    top_module = "and_gate"
    
    # Test module name
    test_module = "and_gate_test"
    
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