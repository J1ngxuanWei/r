include ../Makefile.inc
include ../mibench.mk

all: jpeg

export RUMPRUN_CC

build/.stamp: | dl/${MIBENCH_CONSUMER}
	mkdir -p $(dir $@)
	(cd build && tar -xz --strip-components 2 -f ../dl/${MIBENCH_CONSUMER} consumer/jpeg)
	(cd build && ../../scripts/apply-patches.sh ./ ../patches/*)
	touch $@

SRC=$(wildcard jpeg-6a/*.c) $(wildcard jpeg-6a/*.h)

jpeg: build/.stamp $(SRC)
	(cd build/jpeg-6a; make)

.PHONY: clean

clean:
	(cd build && make clean)
