import cocotb
from cocotb.triggers import Timer

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
        await Timer(1, units='ns')
        assert dut.s.value == s[i] and dut.cout.value == cout[i], f"[Iteration {i}] output is (s,cout) = ({dut.s.value},{dut.cout.value}), expected ({s[i]},{cout[i]})"