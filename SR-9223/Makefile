SIZE=15000
SHELL:=/bin/bash

CONFIGURATION=-O

SWIFTC=swiftc

time: bug.swift
	@echo "Size: $(SIZE)"
	time $(SWIFTC) 	$(CONFIGURATION) bug.swift

bug.swift: Makefile

	@echo "let x: [UInt] = [" > $@
	@LANG=C printf '0x%x, ' $$(seq $(SIZE)) >> $@
	@echo "]" >> $@

.PHONY: c clean e edit
c: clean
clean:
	rm -f bug bug.swift
e: edit
edit:
	vi bug.swift
m:
	vi Makefile
p: perf
perf: bug.swift
	time perf record -e cycles -c 10000 --call-graph=lbr $(SWIFTC) $(CONFIGURATION) bug.swift
	perf report

