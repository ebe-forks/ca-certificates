#
# Makefile
#

all:

clean:
	rm -f cacert.org.crt

install:
	cat root.crt class3.crt > cacert.org.crt
	for p in *.crt; do \
	 install -m 644 $$p $(CERTSDIR)/$$p ; \
	done
