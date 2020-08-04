# Alternative GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug_win32
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

# Configurations
# #############################################

RESCOMP = windres
INCLUDES +=
FORCE_INCLUDE +=
ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
LIBS +=
LDDEPS +=
LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
include config.gcc

define PREBUILDCMDS
endef
define PRELINKCMDS
endef
define POSTBUILDCMDS
endef

ifeq ($(config),debug_win32)
TARGETDIR = ../bin/gcc/dll/debug
TARGET = $(TARGETDIR)/sqlite3mc.dll
OBJDIR = obj/gcc/Win32/Debug/sqlite3mc_dll
DEFINES += -D_WINDOWS -DWIN32 -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -DDEBUG -D_DEBUG -DSQLITE_API=__declspec\(dllexport\) -D_USRDLL -DCODEC_TYPE=$(CODEC_TYPE) -DSQLITE_ENABLE_DEBUG=$(SQLITE_ENABLE_DEBUG) -DSQLITE_THREADSAFE=1 -DSQLITE_DQS=0 -DSQLITE_MAX_ATTACHED=10 -DSQLITE_SOUNDEX=1 -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_SECURE_DELETE=1 -DSQLITE_ENABLE_DESERIALIZE=1 -DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_FTS3_PARENTHESIS=1 -DSQLITE_ENABLE_FTS4=1 -DSQLITE_ENABLE_FTS5=1 -DSQLITE_ENABLE_JSON1=1 -DSQLITE_ENABLE_RTREE=1 -DSQLITE_ENABLE_GEOPOLY=1 -DSQLITE_CORE=1 -DSQLITE_ENABLE_EXTFUNC=1 -DSQLITE_ENABLE_CSV=1 -DSQLITE_ENABLE_SHA3=1 -DSQLITE_ENABLE_CARRAY=1 -DSQLITE_ENABLE_FILEIO=1 -DSQLITE_ENABLE_SERIES=1 -DSQLITE_ENABLE_UUID=1 -DSQLITE_ENABLE_REGEXP=1 -DSQLITE_TEMP_STORE=2 -DSQLITE_USE_URI=1 -DSQLITE_USER_AUTHENTICATION=1
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -g
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -g
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 -shared -Wl,--out-implib="../bin/gcc/dll/debug/sqlite3mc.lib"

else ifeq ($(config),debug_win64)
TARGETDIR = ../bin/gcc/dll/debug
TARGET = $(TARGETDIR)/sqlite3mc_x64.dll
OBJDIR = obj/gcc/Win64/Debug/sqlite3mc_dll
DEFINES += -D_WINDOWS -DWIN32 -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -DDEBUG -D_DEBUG -DSQLITE_API=__declspec\(dllexport\) -D_USRDLL -DCODEC_TYPE=$(CODEC_TYPE) -DSQLITE_ENABLE_DEBUG=$(SQLITE_ENABLE_DEBUG) -DSQLITE_THREADSAFE=1 -DSQLITE_DQS=0 -DSQLITE_MAX_ATTACHED=10 -DSQLITE_SOUNDEX=1 -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_SECURE_DELETE=1 -DSQLITE_ENABLE_DESERIALIZE=1 -DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_FTS3_PARENTHESIS=1 -DSQLITE_ENABLE_FTS4=1 -DSQLITE_ENABLE_FTS5=1 -DSQLITE_ENABLE_JSON1=1 -DSQLITE_ENABLE_RTREE=1 -DSQLITE_ENABLE_GEOPOLY=1 -DSQLITE_CORE=1 -DSQLITE_ENABLE_EXTFUNC=1 -DSQLITE_ENABLE_CSV=1 -DSQLITE_ENABLE_SHA3=1 -DSQLITE_ENABLE_CARRAY=1 -DSQLITE_ENABLE_FILEIO=1 -DSQLITE_ENABLE_SERIES=1 -DSQLITE_ENABLE_UUID=1 -DSQLITE_ENABLE_REGEXP=1 -DSQLITE_TEMP_STORE=2 -DSQLITE_USE_URI=1 -DSQLITE_USER_AUTHENTICATION=1
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -g
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -g
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -shared -Wl,--out-implib="../bin/gcc/dll/debug/sqlite3mc_x64.lib"

else ifeq ($(config),release_win32)
TARGETDIR = ../bin/gcc/dll/release
TARGET = $(TARGETDIR)/sqlite3mc.dll
OBJDIR = obj/gcc/Win32/Release/sqlite3mc_dll
DEFINES += -D_WINDOWS -DWIN32 -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -DNDEBUG -DSQLITE_API=__declspec\(dllexport\) -D_USRDLL -DCODEC_TYPE=$(CODEC_TYPE) -DSQLITE_ENABLE_DEBUG=$(SQLITE_ENABLE_DEBUG) -DSQLITE_THREADSAFE=1 -DSQLITE_DQS=0 -DSQLITE_MAX_ATTACHED=10 -DSQLITE_SOUNDEX=1 -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_SECURE_DELETE=1 -DSQLITE_ENABLE_DESERIALIZE=1 -DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_FTS3_PARENTHESIS=1 -DSQLITE_ENABLE_FTS4=1 -DSQLITE_ENABLE_FTS5=1 -DSQLITE_ENABLE_JSON1=1 -DSQLITE_ENABLE_RTREE=1 -DSQLITE_ENABLE_GEOPOLY=1 -DSQLITE_CORE=1 -DSQLITE_ENABLE_EXTFUNC=1 -DSQLITE_ENABLE_CSV=1 -DSQLITE_ENABLE_SHA3=1 -DSQLITE_ENABLE_CARRAY=1 -DSQLITE_ENABLE_FILEIO=1 -DSQLITE_ENABLE_SERIES=1 -DSQLITE_ENABLE_UUID=1 -DSQLITE_ENABLE_REGEXP=1 -DSQLITE_TEMP_STORE=2 -DSQLITE_USE_URI=1 -DSQLITE_USER_AUTHENTICATION=1
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -O2
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -O2
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 -shared -Wl,--out-implib="../bin/gcc/dll/release/sqlite3mc.lib" -s

else ifeq ($(config),release_win64)
TARGETDIR = ../bin/gcc/dll/release
TARGET = $(TARGETDIR)/sqlite3mc_x64.dll
OBJDIR = obj/gcc/Win64/Release/sqlite3mc_dll
DEFINES += -D_WINDOWS -DWIN32 -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -DNDEBUG -DSQLITE_API=__declspec\(dllexport\) -D_USRDLL -DCODEC_TYPE=$(CODEC_TYPE) -DSQLITE_ENABLE_DEBUG=$(SQLITE_ENABLE_DEBUG) -DSQLITE_THREADSAFE=1 -DSQLITE_DQS=0 -DSQLITE_MAX_ATTACHED=10 -DSQLITE_SOUNDEX=1 -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_SECURE_DELETE=1 -DSQLITE_ENABLE_DESERIALIZE=1 -DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_FTS3_PARENTHESIS=1 -DSQLITE_ENABLE_FTS4=1 -DSQLITE_ENABLE_FTS5=1 -DSQLITE_ENABLE_JSON1=1 -DSQLITE_ENABLE_RTREE=1 -DSQLITE_ENABLE_GEOPOLY=1 -DSQLITE_CORE=1 -DSQLITE_ENABLE_EXTFUNC=1 -DSQLITE_ENABLE_CSV=1 -DSQLITE_ENABLE_SHA3=1 -DSQLITE_ENABLE_CARRAY=1 -DSQLITE_ENABLE_FILEIO=1 -DSQLITE_ENABLE_SERIES=1 -DSQLITE_ENABLE_UUID=1 -DSQLITE_ENABLE_REGEXP=1 -DSQLITE_TEMP_STORE=2 -DSQLITE_USE_URI=1 -DSQLITE_USER_AUTHENTICATION=1
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -O2
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -O2
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -shared -Wl,--out-implib="../bin/gcc/dll/release/sqlite3mc_x64.lib" -s

endif

# Per File Configurations
# #############################################


# File sets
# #############################################

CUSTOM :=
GENERATED :=
OBJECTS :=

CUSTOM += $(OBJDIR)/sqlite3mc.res
GENERATED += $(OBJDIR)/sqlite3mc.o
GENERATED += $(OBJDIR)/sqlite3mc.res
OBJECTS += $(OBJDIR)/sqlite3mc.o

# Rules
# #############################################

all: $(TARGET)
	@:

$(TARGET): $(CUSTOM) $(GENERATED) $(OBJECTS) $(LDDEPS) | $(TARGETDIR)
	$(PRELINKCMDS)
	@echo Linking sqlite3mc_dll
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning sqlite3mc_dll
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(GENERATED)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(GENERATED)) rmdir /s /q $(subst /,\\,$(GENERATED))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild: | $(OBJDIR)
	$(PREBUILDCMDS)

$(CUSTOM): | prebuild
ifneq (,$(PCH))
$(OBJECTS): $(GCH) | $(PCH_PLACEHOLDER)
$(GCH): $(PCH) | prebuild
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
$(PCH_PLACEHOLDER): $(GCH) | $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) touch "$@"
else
	$(SILENT) echo $null >> "$@"
endif
else
$(OBJECTS): | prebuild
endif


# File Rules
# #############################################

$(OBJDIR)/sqlite3mc.o: ../src/sqlite3mc.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/sqlite3mc.res: ../src/sqlite3mc.rc
	@echo $(notdir $<)
	$(SILENT) $(RESCOMP) $< -O coff -o "$@" $(ALL_RESFLAGS)

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(PCH_PLACEHOLDER).d
endif