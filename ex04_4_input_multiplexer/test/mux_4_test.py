import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def mux_4_test_all_combination(dut):
    a = []
    b = []
    c = []
    d = []
    sel = []
    out = []
    
    for i in range(2):
        for j in range(2):
            for k in range(2):
                for l in range(2):
                    for s in range(4):
                        a.append(i)
                        b.append(j)
                        c.append(k)
                        d.append(l)
                        sel.append(s)
                        if s == 0:
                            out.append(i)
                        elif s == 1:
                            out.append(j)
                        elif s == 2:
                            out.append(k)
                        elif s == 3:
                            out.append(l)
    
    for i in range(4):
        dut.a.value = a[i]
        dut.b.value = b[i]
        dut.c.value = c[i]
        dut.d.value = d[i]
        dut.sel.value = sel[i]
        await Timer(1, units='ns')
        assert dut.out.value == out[i], f"[Iteration {i}] output is {dut.out.value}, expected {out[i]}"
        
        
@cocotb.test()
async def mux_4_test_change_selector(dut):
    a = 1
    b = 0
    c = 1
    d = 0
    out = (1, 0, 1, 0)
    
    dut.a.value = a
    dut.b.value = b
    dut.c.value = c
    dut.d.value = d
    
    for i in range(4):
        dut.sel.value = i
        await Timer(1, units='ns')
        assert dut.out.value == out[i], f"[Iteration {i}] output is {dut.out.value}, expected {out[i]}"
