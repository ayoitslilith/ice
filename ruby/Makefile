# Copyright (c) ZeroC, Inc.

top_srcdir      := ..
lang_srcdir     := $(top_srcdir)/$(notdir $(patsubst %/,%,$(dir $(lastword $(abspath $(MAKEFILE_LIST))))))

include $(top_srcdir)/config/Make.rules

#
# Load C++ dependencies
#
$(eval $(call load-dependencies,$(addprefix $(top_srcdir)/cpp/src/,Ice IceLocatorDiscovery IceDiscovery)))
$(eval $(call load-translator-dependencies,$(top_srcdir)/cpp/src/slice2rb))

#
# Load ruby rules after loading C++ dependencies
#
include $(lang_srcdir)/config/Make.rules

#
# Load Makefile.mk fragments
#
include $(shell find $(lang_srcdir) -name Makefile.mk)

#
# Make the projects (this expands all the build configuration and defines rules for all
# the components).
#
$(call make-projects,$(projects))
srcs:: $(projects)

install:: | $(DESTDIR)$(install_rubydir)
	$(E) "Installing generated code"
	$(Q)$(INSTALL) -m 644 $(lang_srcdir)/ruby/*.rb $(DESTDIR)$(install_rubydir)

$(eval $(call make-ruby-package,$(slicedir),$(lang_srcdir)/ruby,Ice))
$(eval $(call make-ruby-package,$(slicedir),$(lang_srcdir)/ruby,Glacier2))
$(eval $(call make-ruby-package,$(slicedir),$(lang_srcdir)/ruby,IceBox))
$(eval $(call make-ruby-package,$(slicedir),$(lang_srcdir)/ruby,IceGrid))
$(eval $(call make-ruby-package,$(slicedir),$(lang_srcdir)/ruby,IceStorm))

all:: srcs
