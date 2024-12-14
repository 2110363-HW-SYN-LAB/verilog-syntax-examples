import cocotb
from cocotb.triggers import Timer

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
        await Timer(1, units='ns')
        assert dut.s.value == s[i] and dut.cout.value == cout[i], f"[Iteration {i}] output is (s,cout) = ({dut.s.value},{dut.cout.value}), expected ({s[i]},{cout[i]})"