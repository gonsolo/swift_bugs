SIZE=15000
SHELL:=/bin/bash

#CONFIGURATION=
#CONFIGURATION=-Onone
#CONFIGURATION=-O

#SWIFTC=/media/gonsolo/Bla/src/swift/build/buildbot_linux/swift-linux-x86_64/bin/swiftc
#SWIFTC=/home/gonsolo/bin/swift/usr/bin/swiftc
SWIFTC=swiftc

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
	vi bug.swift
m:
	vi Makefile
p: perf
perf: bug.swift
	time perf record -e cycles -c 10000 --call-graph=lbr $(SWIFTC) $(CONFIGURATION) bug.swift
	perf report

