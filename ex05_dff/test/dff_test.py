import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge

@cocotb.test()
async def dff_test_simple(dut):
    
    # Create clock with 10ns period
    clock = Clock(dut.clk, 10, units="ns")
    
    assert dut.q.value == "x", f"[Initial Assertion] Expected q to be x, but got {dut.q.value}"
    
    dut.d.value = 0
    
    # Start the clock. Start it low to avoid issues on the first RisingEdge
    cocotb.start_soon(clock.start(start_high=False))
    
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
    clock = Clock(dut.clk, 10, units="ns")
    
    # Start the clock. Start it low to avoid issues on the first RisingEdge
    cocotb.start_soon(clock.start(start_high=False))
    
    for i in range(20):
        dut.d.value = random.randint(0, 1)
        await RisingEdge(dut.clk)
        await FallingEdge(dut.clk)
        assert dut.q.value == dut.d.value, f"[Assertion {i}] Expected q to be {dut.d.value}, but got {dut.q.value}"
    
     