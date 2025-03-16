include ../Makefile.inc
include ../mibench.mk

all: mad

CC=$(RUMPRUN_CC)
CXX=$(RUMPRUN_CXX)
export CC CXX

build/.stamp: | dl/${MIBENCH_CONSUMER}
	mkdir -p $(dir $@)
	(cd build && tar -xz --strip-components 2 -f ../dl/${MIBENCH_CONSUMER} consumer/mad)
	(cd build && ../../scripts/apply-patches.sh ./ ../patches/*)
	touch $@

build/mad-0.14.2b/Makefile: build/.stamp
	(cd $(dir $@) && ./configure --host=$(RUMPRUN_TOOLCHAIN_TUPLE);)


SRC=$(wildcard build/mad-0.14.2b/*.c)

mad: build/mad-0.14.2b/Makefile $(SRC)
	(cd $(dir $^) && make)

.PHONY: clean
clean:
	(cd build && make clean)
