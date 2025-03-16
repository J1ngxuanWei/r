
# upstream for mibench packages
MIBENCH_SERVER_URL=http://vhosts.eecs.umich.edu/mibench//
# file name for each package
MIBENCH_AUTOMOTIVE=automotive.tar.gz
MIBENCH_CONSUMER=consumer.tar.gz
MIBENCH_NETWORK=network.tar.gz
MIBENCH_OFFICE=office.tar.gz
MIBENCH_SECURITY=security.tar.gz
MIBENCH_TELECOMM=telecomm.tar.gz

dl/%.tar.gz:
	mkdir -p dl
	../scripts/fetch.sh $(MIBENCH_SERVER_URL)$(notdir $@) $@
