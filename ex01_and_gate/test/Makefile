OS := $(shell uname -s)

# Simulator
SIM ?= icarus

# Top level language
TOPLEVEL_LANG ?= verilog

# Files
VERILOG_SOURCES = $(shell pwd)/../and_gate.v

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = and_gate

# MODULE is the basename of the Python test file
MODULE = and_gate_test

ifeq ($(OS), Darwin)
	include ../../Makefile.Unix
else ifeq ($(OS), Linux)
	include ../../Makefile.Unix
else
	# include cocotb's make rules to take care of the simulator setup
	include $(shell cocotb-config --makefiles)/Makefile.sim
endif