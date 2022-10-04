SIZE=20000
SHELL:=/bin/bash

time: bug.swift
	@time swiftc bug.swift
bug.swift: Makefile
	@echo "Size: $(SIZE)"
	@echo "let x: [Int] = [" > $@
	@seq -s, $(SIZE) >> $@
	@echo "]" >> $@

.PHONY: c clean e edit
c: clean
clean:
	rm -f bug.swift
e: edit
edit:
	vi bug.swift
perf: bug.swift
	time perf record -e cycles -c 10000 --call-graph=lbr swiftc bug.swift
	perf report

