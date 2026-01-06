import os
from pathlib import Path
import cocotb
from cocotb.triggers import Timer
from cocotb_tools.runner import get_runner

@cocotb.test()
async def full_adder_test(dut):
    a = (0, 0, 1, 1, 0, 0, 1, 1)
    b = (0, 1, 0, 1, 0, 1, 0, 1)
    cin = (0, 0, 0, 0, 1, 1, 1, 1)
    
    s = (0, 1, 1, 0, 1, 0, 0, 1)
    cout = (0, 0, 0, 1, 0, 1, 1, 1)
    
    for i in range(8):
        dut.a.value = a[i]
        dut.b.value = b[i]
        dut.cin.value = cin[i]
        await Timer(1, unit='ns')
        assert dut.s.value == s[i] and dut.cout.value == cout[i], f"[Iteration {i}] output is (s,cout) = ({dut.s.value},{dut.cout.value}), expected ({s[i]},{cout[i]})"
        
def runner():  
    # Path to all related Verilog files
    verilog_files = [
        "../full_adder.v"
    ]
    
    # Top-level module name
    top_module = "full_adder"
    
    # Test module name
    test_module = "full_adder_test"
    
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