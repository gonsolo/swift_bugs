SIZE=10000
SHELL:=/bin/bash

CONFIGURATION=-O

SWIFTC=swiftc

all: size time_swift time_cpp time_python

size:
	@echo "Size: $(SIZE)"
	@echo ""

time_swift: bug.swift
	@echo "Swift:"
	@time $(SWIFTC) $(CONFIGURATION) bug.swift
	@echo ""

time_cpp: bug.cc
	@echo "C++ (GCC):"
	@time g++ -c -O3 bug.cc
	@echo ""
	@echo "C++ (Clang):"
	@time clang++ -c -O3 bug.cc
	@echo ""

time_python: bug.py
	@echo "Python:"
	@time python bug.py

bug.swift: Makefile
	@echo "let x: [UInt] = [" > $@
	@LANG=C printf '0x%x, ' $$(seq $(SIZE)) >> $@
	@echo "]" >> $@

bug.cc: Makefile
	@echo "unsigned int x[] = {" > $@
	@LANG=C printf '0x%x, ' $$(seq $(SIZE)) >> $@
	@echo "};" >> $@

bug.py: Makefile
	@echo "x = [" > $@
	@LANG=C printf '0x%x, ' $$(seq $(SIZE)) >> $@
	@echo "]" >> $@

time_tuple: tuple.swift
	@time $(SWIFTC) $(CONFIGURATION) tuple.swift

.PHONY: c clean e edit r report p perf
c: clean
clean:
	rm -f bug.cc bug.py bug.swift bug bug.o tuple
e: edit
edit:
	vi Makefile
p: perf
perf: bug.swift
	time perf record -e cycles -c 10000 --call-graph=lbr $(SWIFTC) $(CONFIGURATION) bug.swift
	perf report

