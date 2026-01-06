import os
from pathlib import Path
import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge
from cocotb_tools.runner import get_runner

@cocotb.test()
async def dff_test_simple(dut):
    
    # Create clock with 10ns period
    clock = Clock(dut.clk, 10, unit="ns")
    
    assert dut.q.value == "x", f"[Initial Assertion] Expected q to be x, but got {dut.q.value}"
    
    dut.d.value = 0
    
    # Start the clock. Start it low to avoid issues on the first RisingEdge
    clock.start(start_high=False)
    
    await RisingEdge(dut.clk)
    await FallingEdge(dut.clk)
    assert dut.q.value == 0, f"[Assertion 0] Expected q to be 0, but got {dut.q.value}"
    
    dut.d.value = 1
    await FallingEdge(dut.clk)
    assert dut.q.value == 1, f"[Assertion 1] Expected q to be 1, but got {dut.q.value}"
    
    await FallingEdge(dut.clk)
    assert dut.q.value == 1, f"[Assertion 2] Expected q to be 1, but got {dut.q.value}"
    
    dut.d.value = 0
    await FallingEdge(dut.clk)
    assert dut.q.value == 0, f"[Assertion 3] Expected q to be 0, but got {dut.q.value}"


@cocotb.test()
async def dff_test_random(dut):
    
    # Create clock with 10ns period
    clock = Clock(dut.clk, 10, unit="ns")
    
    # Start the clock. Start it low to avoid issues on the first RisingEdge
    clock.start(start_high=False)
    
    for i in range(20):
        dut.d.value = random.randint(0, 1)
        await RisingEdge(dut.clk)
        await FallingEdge(dut.clk)
        assert dut.q.value == dut.d.value, f"[Assertion {i}] Expected q to be {dut.d.value}, but got {dut.q.value}"
    
def runner():  
    # Path to all related Verilog files
    verilog_files = [
        "../dff.v"
    ]
    
    # Top-level module name
    top_module = "dff"
    
    # Test module name
    test_module = "dff_test"
    
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