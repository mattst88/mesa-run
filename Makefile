DESTDIR ?= $(or $(XDG_BIN_HOME),$(HOME)/.local/bin)

SCRIPTS = \
	deqp-results-to-markdown \
	deqp-run \
	mesa-debug \
	mesa-debug-asan \
	mesa-debug-optimized \
	mesa-gdb \
	mesa-release \
	mesa-run \
	nj

SRCDIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

.PHONY: install uninstall

install:
	mkdir -p $(DESTDIR)
	$(foreach script,$(SCRIPTS),ln -sf $(SRCDIR)/$(script) $(DESTDIR)/$(script);)

uninstall:
	$(foreach script,$(SCRIPTS),rm -f $(DESTDIR)/$(script);)
