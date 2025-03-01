TS ?= tree-sitter

all install uninstall clean:
	$(MAKE) -C gotmpl $@
	$(MAKE) -C goyamltmpl $@

generate:
	cd gotmpl && $(TS) generate
	cd goyamltmpl && $(TS) generate

.PHONY: all install uninstall clean test update generate
