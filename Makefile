#
# Build the helper C library for the Tcl8_6 Swift package
# 

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
    EXTRA_CFLAGS=-I$(BREWROOT)/tcl-tk/$(TCLVERSION)/include
    INSTALL_DIR=/usr/local/lib
else
    INSTALL_DIR=/usr/lib/x86_64-linux-gnu
endif

all: tclrefcount.a

tclrefcount.a: tclrefcount.o
	ar -r libtclrefcount8.6.a tclrefcount.o 

tclrefcount.o: c/tclrefcount.c c/include/tclrefcount.h
	$(CC) $(EXTRA_CFLAGS) -Ic/include -c -fPIC -o tclrefcount.o c/tclrefcount.c

install: tclrefcount.a
	cp libtclrefcount8.6.a $(INSTALL_DIR)

clean:
	rm -rf tclrefcount.o libtclrefcount8.6.a .build
