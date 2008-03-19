#
# Makefile
#

all:
	ruby certdata2pem.rb < certdata.txt

clean:
	-rm -f *.crt

install:
	for p in *.crt; do \
	 install -m 644 $$p $(CERTSDIR)/$$p ; \
	done
