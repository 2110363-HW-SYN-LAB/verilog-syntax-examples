import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def and_gate_test(dut):
    a = (0, 0, 1, 1)
    b = (0, 1, 0, 1)
    out = (0, 0, 0, 1)
    
    for i in range(4):
        dut.a.value = a[i]
        dut.b.value = b[i]
        await Timer(1, units='ns')
        assert dut.out.value == out[i], f"[Iteration {i}] output is {dut.out.value}, expected {out[i]}"