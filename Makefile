QEMU := qemu-system-x86_64
KERNEL := build/images/kernel-x86_64-pc99
INITRD := build/images/roottask-image-x86_64-pc99
CPU := Nehalem,-vme,+pdpe1gb,-xsave,-xsaveopt,-xsavec,-fsgsbase,-invpcid,+syscall,+lm,enforce
MEMORY := 512M
GRAPHIC := -nographic
SERIAL := -serial mon:stdio
NET := -net nic,model=e1000

build:
	rm -rf build
	mkdir build
	cd build && ../init-build.sh -DPLATFORM=x86_64 -DSIMULATION=TRUE -DAPP=iperf3
	cd build && ninja

clean:
	rm -rf build

run:
	$(QEMU) -cpu $(CPU) $(GRAPHIC) $(SERIAL) -m size=$(MEMORY) -kernel $(KERNEL) -initrd $(INITRD)