include ../Makefile.inc
include ../mibench.mk

all: susan

build/.stamp: | dl/${MIBENCH_AUTOMOTIVE}
	mkdir -p $(dir $@)
	(cd build && tar -xz --strip-components 2 -f ../dl/${MIBENCH_AUTOMOTIVE} automotive/susan)
	touch $@

susan: build/.stamp build/susan.c
	(cd build; ${RUMPRUN_CC} -osusan.o susan.c -lm -lc -g)

.PHONY: clean

clean:
	rm build/susan.o
