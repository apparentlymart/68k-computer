AUTOMAKE_OPTIONS = cygnus

INCLUDES = $(NEWLIB_CFLAGS) $(CROSS_CFLAGS) $(TARGET_CFLAGS)

AM_CCASFLAGS = $(INCLUDES)

noinst_LIBRARIES = lib.a

lib_a_SOURCES = syscalls.c

EXTRA_LIBRARIES = libfoo.a
libfoo_a_SOURCES = crt0.c
   
EXTRA_lib_a_SOURCES =

lib_a_CCASFLAGS = $(AM_CCASFLAGS)
lib_a_CFLAGS = $(AM_CFLAGS)

all: crt0.o

ACLOCAL_AMFLAGS = -I ../../..
CONFIG_STATUS_DEPENDENCIES = $(newlib_basedir)/configure.host
   
install-data-local:
   $(mkinstalldirs) $(DESTDIR)$(tooldir)/include/netinet; \
      for i in $(srcdir)/netinet/*.h; do \
      $(INSTALL_DATA) $$i $(DESTDIR)$(tooldir)/include/netinet/`basename $$i`; done
