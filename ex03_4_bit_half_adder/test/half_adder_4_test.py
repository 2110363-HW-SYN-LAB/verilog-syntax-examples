import os
from pathlib import Path
import cocotb
from cocotb.triggers import Timer
from cocotb_tools.runner import get_runner

@cocotb.test()
async def half_adder_4_test(dut):
    a = []
    b = []
    s = []
    cout = []
    
    for i in range(2**4):
        for j in range(2**4):
            a.append(i)
            b.append(j)
            s.append((i+j)%16)
            cout.append((i+j)//16)
    
    for i in range(len(a)):
        dut.a.value = a[i]
        dut.b.value = b[i]
        await Timer(1, unit='ns')
        assert dut.s.value == s[i] and dut.cout.value == cout[i], f"[Iteration {i}] output is (s,cout) = ({dut.s.value},{dut.cout.value}), expected ({s[i]},{cout[i]})"
        
def runner():  
    # Path to all related Verilog files
    verilog_files = [
        "../half_adder_4.v"
    ]
    
    # Top-level module name
    top_module = "half_adder_4"
    
    # Test module name
    test_module = "half_adder_4_test"
    
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