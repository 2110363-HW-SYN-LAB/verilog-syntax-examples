import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def full_adder_test_w1(dut):
    a = (0, 1, 0, 1)
    b = (0, 0, 1, 1)
    
    s = (0, 1, 1, 0)
    cout = (0, 0, 0, 1)
    
    for i in range(4):
        dut.a.value = a[i]
        dut.b.value = b[i]
        await Timer(1, units='ns')
        assert dut.s.value == s[i] and dut.cout.value == cout[i], f"[Iteration {i}] output is (s,cout) = ({dut.s.value},{dut.cout.value}), expected ({s[i]},{cout[i]})"