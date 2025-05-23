# Copyright (c) ZeroC, Inc.

top_srcdir      := ..
lang_srcdir     := $(top_srcdir)/$(notdir $(patsubst %/,%,$(dir $(lastword $(abspath $(MAKEFILE_LIST))))))

include $(top_srcdir)/config/Make.rules

icetoolbox_file = toolbox/ice-$(version)-$(MATLAB_VERSION)-linux.mltbx

#
# Load C++ dependencies
#
$(eval $(call load-translator-dependencies,$(top_srcdir)/cpp/src/slice2matlab))
$(eval $(call load-dependencies,$(addprefix $(top_srcdir)/cpp/src/,Ice IceLocatorDiscovery IceDiscovery)))

#
# Load MATLAB rules after loading C++ dependencies
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

$(eval $(call make-matlab-package,$(slicedir),lib/generated,Ice,%F.ice \
    %/FacetMap.ice \
    %/ImplicitContext.ice \
    %/Instrumentation.ice \
    %/Logger.ice \
    %/ObjectAdapter.ice \
    %/ObjectFactory.ice \
    %/Plugin.ice \
    %/Properties.ice \
    %/ServantLocator.ice))
$(eval $(call make-matlab-package,$(slicedir),lib/generated,Glacier2))
$(eval $(call make-matlab-package,$(slicedir),lib/generated,IceGrid))
$(eval $(call make-matlab-package,$(slicedir),lib/generated,IceStorm))

#
# icethunk mex library
#
icethunk_libdir = $(lang_srcdir)/lib/x86_64-linux-gnu
icethunk_srcdir = $(lang_srcdir)/src
icethunk_builddir = $(lang_srcdir)/src/build
icethunk_cflags = $(matlab_cflags) -I$(lang_srcdir)/src -m64 -fPIC -shared -pthread -Wl,--no-undefined
icethunk_target = $(icethunk_libdir)/icethunk.so
icethunk_proto = $(icethunk_libdir)/iceproto.m
cpp_libdir = $(top_srcdir)/cpp/lib/x86_64-linux-gnu
cpp_bindir = $(top_srcdir)/cpp/bin

.PRECIOUS: $(icethunk_proto)

$(icethunk_builddir)/ice.i: $(icethunk_srcdir)/ice.h
	mkdir -p $(icethunk_builddir)
	$(CC) -P -E -DMATLAB_PROTO $(icethunk_srcdir)/ice.h > $(icethunk_builddir)/ice.i

$(icethunk_builddir)/icethunk.c: $(icethunk_builddir)/ice.i
	cd $(icethunk_builddir) && \
	perl $(MATLAB_HOME)/toolbox/matlab/general/private/prototypes.pl ice.i \
	-thunkfile=icethunk.c \
	-outfile=iceproto.m

$(icethunk_proto): $(icethunk_builddir)/icethunk.c
	mkdir -p $(icethunk_libdir)
	cp $(icethunk_builddir)/iceproto.m $(icethunk_libdir)/

$(icethunk_target): $(lang_srcdir)/src/build/icethunk.c $(icethunk_proto)
	$(CC) $(lang_srcdir)/src/build/icethunk.c $(icethunk_cflags) -o $(icethunk_target)

clean::
	rm -rf $(lang_srcdir)/lib/x86_64-linux-gnu
	rm -rf $(icethunk_builddir)

all:: srcs $(icethunk_target)

#
# Toolbox
#
$(icetoolbox_file):: $(icethunk_target) $(slice2matlab_path) $(lang_srcdir)/lib/x86_64-linux-gnu/ice.mexa64
	rm -rf $(lang_srcdir)/toolbox/build
	mkdir -p $(lang_srcdir)/toolbox/build
	cp $(lang_srcdir)/toolbox/toolbox.template.prj $(lang_srcdir)/toolbox/toolbox.prj
	sed -i 's|@RootDir@|$(lang_srcdir)|g' $(lang_srcdir)/toolbox/toolbox.prj
	sed -i 's|@MatlabHome@|$(MATLAB_HOME)|g' $(lang_srcdir)/toolbox/toolbox.prj
	sed -i 's/@IceVersion@/$(version)/g' $(lang_srcdir)/toolbox/toolbox.prj
	sed -i 's/@MatlabVersion@/$(MATLAB_VERSION)/g' $(lang_srcdir)/toolbox/toolbox.prj
	sed -i 's/@SLICE2MATLAB@/slice2matlab/g' $(lang_srcdir)/toolbox/toolbox.prj
	sed -i 's/@IS_WINDOWS@/false/g' $(lang_srcdir)/toolbox/toolbox.prj
	sed -i 's/@IS_LINUX@/true/g' $(lang_srcdir)/toolbox/toolbox.prj
	cp $(lang_srcdir)/toolbox/info.template.xml $(lang_srcdir)/toolbox/info.xml
	sed -i 's/@MatlabVersion@/$(MATLAB_VERSION)/g' $(lang_srcdir)/toolbox/info.xml
	# Sources and libraries
	mkdir -p $(lang_srcdir)/toolbox/build
	cp -rf $(lang_srcdir)/lib/*.m $(lang_srcdir)/toolbox/build
	cp -rf $(lang_srcdir)/lib/+* $(lang_srcdir)/toolbox/build
	cp -rf $(lang_srcdir)/lib/generated/+* $(lang_srcdir)/toolbox/build
	cp -rf $(lang_srcdir)/lib/x86_64-linux-gnu/* $(lang_srcdir)/toolbox/build
	cp -rLf $(cpp_libdir)/libIce.so.38a0 $(lang_srcdir)/toolbox/build
	cp -rLf $(cpp_libdir)/libIceDiscovery.so.38a0 $(lang_srcdir)/toolbox/build
	cp -rLf $(cpp_libdir)/libIceLocatorDiscovery.so.38a0 $(lang_srcdir)/toolbox/build
	# Slice files
	mkdir -p $(lang_srcdir)/toolbox/build/slice
	cp -rf $(top_srcdir)/slice/Glacier2 $(lang_srcdir)/toolbox/build/slice
	cp -rf $(top_srcdir)/slice/Ice $(lang_srcdir)/toolbox/build/slice
	cp -rf $(top_srcdir)/slice/IceStorm $(lang_srcdir)/toolbox/build/slice
	cp -rf $(top_srcdir)/slice/IceGrid $(lang_srcdir)/toolbox/build/slice
	# Tools
	cp -rf $(cpp_bindir)/slice2matlab $(lang_srcdir)/toolbox/build/
	# Doc files
	cp -rf $(lang_srcdir)/toolbox/doc $(lang_srcdir)/toolbox/build
ifneq (,$(MATLAB_COMMAND))
	cd $(lang_srcdir)/toolbox && $(MATLAB_COMMAND) "addFolderToPath '`realpath build`'"
	cd $(lang_srcdir)/toolbox && $(MATLAB_COMMAND) "buildToolbox '$(version)'"
	cd $(lang_srcdir)/toolbox && $(MATLAB_COMMAND) "removeFolderFromPath '`realpath build`'"
else
	cd $(lang_srcdir)/toolbox && $(MATLAB_HOME)/bin/matlab -nodisplay -r "addFolderToPath '`realpath build`'"
	cd $(lang_srcdir)/toolbox && $(MATLAB_HOME)/bin/matlab -nodisplay -r "buildToolbox '$(version)'"
	cd $(lang_srcdir)/toolbox && $(MATLAB_HOME)/bin/matlab -nodisplay -r "removeFolderFromPath '`realpath build`'"
endif

clean::
	rm -rf $(icetoolbox_file)
	rm -rf $(lang_srcdir)/toolbox/build
	rm -rf $(lang_srcdir)/toolbox/toolbox.prj
	rm -rf $(lang_srcdir)/toolbox/info.xml

toolbox:: $(icetoolbox_file)

#
# Translate the Slice files from test directories
#
tests := $(call tests-without-project-makefile,m)
include $(shell find test -name Makefile.mk)
$(foreach t,$(tests),$(eval $(call make-matlab-test-project,$(t))))
