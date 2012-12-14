# **********************************************************************
#
# Copyright (c) 2003-2012 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

#
# Define OPTIMIZE as yes if you want to build with
# optimization. Otherwise Ice is build with debug information.
#
#OPTIMIZE		= yes

#
# Define if you want pdb files to be generated for optimized/release
# builds
#
#RELEASEPDBS             = yes

#
# Specify your C++ compiler. Supported values are:
# VC100, VC100_EXPRESS, VC110, VC110_EXPRESS
#
#CPP_COMPILER		= VC100

# ----------------------------------------------------------------------
# Don't change anything below this line!
# ----------------------------------------------------------------------

#
# Common definitions
#
ice_language     = cpp
slice_translator = slice2cpp.exe
ice_require_cpp  = 1

!include $(top_srcdir)\config\Make.common.rules.mak

includedir		= $(ice_dir)\include

SETARGV			= setargv.obj

#
# Default C++ compiler
#
!if "$(CPP_COMPILER)" == ""
!if "$(VISUALSTUDIOVERSION)" == "11.0"
CPP_COMPILER            = VC110
!else
CPP_COMPILER		= VC100
!endif
!message CPP_COMPILER set to $(CPP_COMPILER)
!endif

#
# Compiler specific definitions
#
!if "$(CPP_COMPILER)" == "VC100" || "$(CPP_COMPILER)" == "VC100_EXPRESS" || \
    "$(CPP_COMPILER)" == "VC110" || "$(CPP_COMPILER)" == "VC110_EXPRESS"
!include        $(top_srcdir)/config/Make.rules.msvc
!else
!error Invalid setting for CPP_COMPILER: $(CPP_COMPILER)
!endif

!if "$(CPP_COMPILER)" == "VC110" || "$(CPP_COMPILER)" == "VC110_EXPRESS"
libsuff			= \vc110$(x64suffix)
!else
libsuff			= $(x64suffix)
!endif

!if "$(OPTIMIZE)" != "yes"
LIBSUFFIX	= $(LIBSUFFIX)d
RCFLAGS		= -D_DEBUG
!endif

CPPFLAGS		= $(CPPFLAGS) -I"$(includedir)"
ICECPPFLAGS		= -I"$(slicedir)"
SLICE2CPPFLAGS		= $(ICECPPFLAGS)

LDFLAGS			= $(LDFLAGS) $(PRELIBPATH)"$(ice_dir)\lib$(libsuff)"
LDFLAGS			= $(LDFLAGS) $(LDPLATFORMFLAGS) $(CXXFLAGS)

SLICEPARSERLIB		= $(ice_dir)\lib$(x64suffix)\slice$(LIBSUFFIX).lib
SLICE2CPP		= $(ice_dir)\bin$(x64suffix)\slice2cpp.exe
SLICE2XSD		= $(ice_dir)\bin$(x64suffix)\slice2xsd.exe
SLICE2FREEZE		= $(ice_dir)\bin$(x64suffix)\slice2freeze.exe

MT 			= mt.exe

EVERYTHING		= all clean install

.SUFFIXES:
.SUFFIXES:		.ice .cpp .c .obj .res .rc

.cpp.obj::
	$(CXX) /c $(CPPFLAGS) $(CXXFLAGS) $<

.c.obj:
	$(CC) /c $(CPPFLAGS) $(CFLAGS) $<

.ice.cpp:
	del /q $(*F).h $(*F).cpp
	"$(SLICE2CPP)" $(SLICE2CPPFLAGS) $(*F).ice

.rc.res:
	rc $(RCFLAGS) $<


all:: $(SRCS) $(TARGETS)

!if "$(TARGETS)" != ""

clean::
	-del /q $(TARGETS)

!endif

# Suffix set, we're using a debug build.
!if "$(LIBSUFFIX)" != ""

!if "$(LIBNAME)" != ""
clean::
	-del /q $(LIBNAME:d.lib=.lib)
	-del /q $(LIBNAME)
!endif
!if "$(DLLNAME)" != ""
clean::
	-del /q $(DLLNAME:d.dll=.*)
	-del /q $(DLLNAME:.dll=.*)
!endif

!else

!if "$(LIBNAME)" != ""
clean::
	-del /q $(LIBNAME:.lib=d.lib)
	-del /q $(LIBNAME)
!endif
!if "$(DLLNAME)" != ""
clean::
	-del /q $(DLLNAME:.dll=d.*)
	-del /q $(DLLNAME:.dll=.*)
!endif

!endif

clean::
	-del /q *.obj *.bak *.ilk *.exp *.pdb *.tds *.idb

install::
