SIZE=5000
SHELL:=/bin/bash

#CONFIGURATION=-Onone
CONFIGURATION=-O

#SWIFTC=/home/gonsolo/src/apple/swift-nightly-install/usr/bin/swift
SWIFTC=/home/gonsolo/bin/swiftc

time: bug.swift
	time $(SWIFTC) 	$(CONFIGURATION) bug.swift
bug.swift: Makefile
	@echo "Size: $(SIZE)"

	@echo "let x: [UInt] = [" > $@
	@LANG=C printf '0x%x, ' $$(seq $(SIZE)) >> $@

	#@LANG=C seq -s, -f"%d" $(SIZE) >> $@

	#@echo "let x: [UInt] = [" > $@
	#@seq -s',' $(SIZE) >> $@

	# With newline
	#@for i in $$(seq $(SIZE)); do echo -e "$$i,"; done >> $@

	@echo "]" >> $@

.PHONY: c clean e edit
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

