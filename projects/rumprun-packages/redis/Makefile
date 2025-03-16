include ../Makefile.inc
UPSTREAM=http://download.redis.io/releases/redis-3.0.6.tar.gz
TARBALL=$(notdir $(UPSTREAM))
PERSISTENCE_SIZE=2048
CC=$(RUMPRUN_CC)
CXX=$(RUMPRUN_CXX)
export CC CXX

BUILD_DIR ?= .

all: redis-server $(BUILD_DIR)/images/data.iso $(BUILD_DIR)/images/datapers.img

cache: redis-server $(BUILD_DIR)/images/data.iso

.PHONY: redis-server
redis-server: $(BUILD_DIR)/bin/redis-server


$(BUILD_DIR)/bin/redis-server: $(BUILD_DIR)/build/src/redis-server
	mkdir -p $(dir $@)
	cp $^ $@

$(BUILD_DIR)/build/src/redis-server: $(BUILD_DIR)/build/Makefile
	$(MAKE) -C $(BUILD_DIR)/build MALLOC=libc redis-server

$(BUILD_DIR)/build/Makefile: dl/${TARBALL}
	mkdir -p $(BUILD_DIR)/build
	tar -xz --strip-components 1 -f dl/${TARBALL} -C $(BUILD_DIR)/build

dl/$(TARBALL):
	mkdir -p dl
	../scripts/fetch.sh ${UPSTREAM} dl/$(TARBALL)

$(BUILD_DIR)/images/data.iso: images/data/conf/*
	$(RUMPRUN_GENISOIMAGE) -o $@ images/data

$(BUILD_DIR)/images/datapers.img:
	dd if=/dev/zero of=$@ bs=1024k seek=$(PERSISTENCE_SIZE) count=0
	mkfs.ext2 -F -q $@

.PHONY: clean
clean:	clean/build clean/bin
	
clean/build:
	rm -rf $(BUILD_DIR)/build

clean/bin:
	rm -rf $(BUILD_DIR)/bin
	rm -f $(BUILD_DIR)/images/data.iso
	rm -f $(BUILD_DIR)/images/datapers.iso
