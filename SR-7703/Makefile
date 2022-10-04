SIZE=10000
SHELL:=/bin/bash

CONFIGURATION=-O

#SWIFTC=/home/gonsolo/src/apple/build/buildbot_linux/swift-linux-x86_64/bin/swiftc
SWIFTC=swiftc

all: size time_swift time_cpp time_python

size:
	@echo "Size: $(SIZE)"

time_swift: bug.swift
	@echo "Swift:"
	@#time $(SWIFTC) -v -driver-show-incremental $(CONFIGURATION) bug.swift
	@time $(SWIFTC) $(CONFIGURATION) bug.swift

time_cpp: bug.cc
	@echo "C++:"
	@time g++ -c -O3 bug.cc
	@time clang++ -c -O3 bug.cc

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


.PHONY: c clean e edit r report p perf
c: clean
clean:
	rm -f bug.swift
e: edit
edit:
	vi Makefile
p: perf
perf: bug.swift
	time perf record -e cycles -c 10000 --call-graph=lbr $(SWIFTC) $(CONFIGURATION) bug.swift
	perf report

