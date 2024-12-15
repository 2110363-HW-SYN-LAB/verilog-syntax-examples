SUBDIRS = ex01_and_gate/test \
	ex02_1_bit_full_adder/test \
	ex03_4_bit_half_adder/test \
	ex04_4_input_multiplexer/test

BETTER_SOURCES = \
	$(PWD)/ex01_and_gate/better_and_gate.v \
	$(PWD)/ex02_1_bit_full_adder/better_full_adder.v \
	$(PWD)/ex03_4_bit_half_adder/better_half_adder_4.v \
	$(PWD)/ex04_4_input_multiplexer/better_mux_4.v

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

better:
	@for source in $(BETTER_SOURCES); do \
		dir="$$(dirname $$source)/test"; \
		module_name="$$(basename $$source .v)"; \
		echo "Processing $$source in $$dir"; \
		if [ ! -f "$$source" ]; then \
			echo "Error: Verilog source file $$source not found" >&2; \
			continue; \
		fi; \
		$(MAKE) -C $$dir TOPLEVEL=$$module_name VERILOG_SOURCES=$$source; \
	done

build-all:
	@for subdir in $(SUBDIRS); do \
		$(MAKE) -C $$subdir build; \
	done
		@for source in $(BETTER_SOURCES); do \
		dir="$$(dirname $$source)/test"; \
		module_name="$$(basename $$source .v)"; \
		echo "Processing $$source in $$dir"; \
		if [ ! -f "$$source" ]; then \
			echo "Error: Verilog source file $$source not found" >&2; \
			continue; \
		fi; \
		$(MAKE) -C $$dir TOPLEVEL=$$module_name VERILOG_SOURCES=$$source build; \
	done

simulate-all:
	@for subdir in $(SUBDIRS); do \
		$(MAKE) -C $$subdir simulate; \
	done
		@for source in $(BETTER_SOURCES); do \
		dir="$$(dirname $$source)/test"; \
		module_name="$$(basename $$source .v)"; \
		echo "Processing $$source in $$dir"; \
		if [ ! -f "$$source" ]; then \
			echo "Error: Verilog source file $$source not found" >&2; \
			continue; \
		fi; \
		$(MAKE) -C $$dir TOPLEVEL=$$module_name VERILOG_SOURCES=$$source simulate; \
	done

build-simulate-all:
	$(MAKE) build-all;
	$(MAKE) simulate-all;

clean:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done