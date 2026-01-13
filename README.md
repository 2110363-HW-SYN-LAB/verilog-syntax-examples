# Verilog Syntax Examples

This repository is based on slides, which shows examples for Verilog syntax with testbenches (both Verilog testbenches (for some examples) and Cocotb testbenches).

**Lab 1**
- [Example 1: AND Gate](https://github.com/2110363-HW-SYN-LAB/verilog-syntax-examples/tree/main/ex01_and_gate)
- [Example 2: 1-bit Full Adder](https://github.com/2110363-HW-SYN-LAB/verilog-syntax-examples/tree/main/ex02_1_bit_full_adder)
- [Example 3: 4-bit Full Adder](https://github.com/2110363-HW-SYN-LAB/verilog-syntax-examples/tree/main/ex03_4_bit_half_adder)
- [Example 4: 4-input Multiplexer](https://github.com/2110363-HW-SYN-LAB/verilog-syntax-examples/tree/main/ex04_4_input_multiplexer)
- [Example 5: D Flip Flop](https://github.com/2110363-HW-SYN-LAB/verilog-syntax-examples/tree/main/ex05_dff)

**Lab 2**
- [Example 6: Odd Parity Checker](https://github.com/2110363-HW-SYN-LAB/verilog-syntax-examples/tree/main/ex06_odd_parity_checker)
- [Example 7: Single Pulser](https://github.com/2110363-HW-SYN-LAB/verilog-syntax-examples/tree/main/ex07_single_pulser)

## Running Cocotb Tests

To run Cocotb testbenches, you need to install Cocotb (using Python 3.6+) with GNU Make and Icarus Verilog. The guide for installation is in MCV.

- Go to the directory of example we want to run testbench and go to `test` directory.

```sh
cd test
```

- If Conda or Miniconda is used, activate the virtual environment that contains Cocotb and Pytest libraries.

```sh
conda activate <venv_name>
```

- Run the test.

```sh
python <python_file>
```

