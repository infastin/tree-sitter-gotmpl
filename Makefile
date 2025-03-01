TS ?= tree-sitter

all install uninstall clean:
	$(MAKE) -C gotmpl $@
	$(MAKE) -C helm $@

generate:
	cd gotmpl && $(TS) generate
	cd helm && $(TS) generate

.PHONY: all install uninstall clean test update generate
