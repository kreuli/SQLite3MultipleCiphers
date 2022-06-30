project(SQLite3MultipleCiphers)
cmake_minimum_required(VERSION 3.18)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Uses built-in ciphers per default, set HAVE_CIPHER_CUSTOM to ON to use your own ciphers instead:
# Example: cmake .. -DHAVE_CIPHER_CUSTOM=ON
set(HAVE_CIPHER_CUSTOM OFF CACHE BOOL "Bring your own cipher.")
if (HAVE_CIPHER_CUSTOM)
    add_compile_options(-DHAVE_CIPHER_CUSTOM=1)
endif()

# This is where all the source files are.
include_directories(src)

# Source file for the library version
set(LIB_SOURCES src/sqlite3mc.c)

# Source file for the command line application
set(SHELL_SOURCES src/shell.c)

# Include files needed when linking the shared library
set(REDIST_HEADERS
    src/sqlite3.h
    src/sqlite3ext.h
    src/sqlite3mc.h
    src/sqlite3mc_version.h
    src/sqlite3mc_vfs.h)

# SQLite parameters
add_compile_options(-DSQLITE_ENABLE_DEBUG=1)
add_compile_options(-DSQLITE_THREADSAFE=1)
add_compile_options(-DSQLITE_DQS=0)
add_compile_options(-DSQLITE_MAX_ATTACHED=10)
add_compile_options(-DSQLITE_ENABLE_EXPLAIN_COMMENTS=1)
add_compile_options(-DSQLITE_SOUNDEX=1)
add_compile_options(-DSQLITE_ENABLE_COLUMN_METADATA=1)
add_compile_options(-DSQLITE_SECURE_DELETE=1)
add_compile_options(-DSQLITE_ENABLE_DESERIALIZE=1)
add_compile_options(-DSQLITE_ENABLE_FTS3=1)
add_compile_options(-DSQLITE_ENABLE_FTS3_PARENTHESIS=1)
add_compile_options(-DSQLITE_ENABLE_FTS4=1)
add_compile_options(-DSQLITE_ENABLE_FTS5=1)
add_compile_options(-DSQLITE_ENABLE_RTREE=1)
add_compile_options(-DSQLITE_ENABLE_GEOPOLY=1)
add_compile_options(-DSQLITE_CORE=1)
add_compile_options(-DSQLITE_ENABLE_EXTFUNC=1)
add_compile_options(-DSQLITE_ENABLE_MATH_FUNCTIONS=1)
add_compile_options(-DSQLITE_ENABLE_CSV=1)
add_compile_options(-DSQLITE_ENABLE_VSV=1)
add_compile_options(-DSQLITE_ENABLE_CARRAY=1)
add_compile_options(-DSQLITE_ENABLE_UUID=1)
add_compile_options(-DSQLITE_TEMP_STORE=2)
add_compile_options(-DSQLITE_USE_URI=1)
add_compile_options(-DSQLITE_USER_AUTHENTICATION=1)
add_compile_options(-DSQLITE_ENABLE_DBPAGE_VTAB=1)
add_compile_options(-DSQLITE_ENABLE_DBSTAT_VTAB=1)
add_compile_options(-DSQLITE_ENABLE_STMTVTAB=1)
add_compile_options(-DSQLITE_ENABLE_UNKNOWN_SQL_FUNCTION=1)

# Build for Windows (Visual Studio)
if(MSVC)
    # fail on error
    add_compile_options(/WX)

    # allow strcpy etc.
    add_compile_options(-D_WINDOWS -DWIN32 -DUNICODE -D_UNICODE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE)

    # On Windows, use statically linked C/C++ runtime.
    add_compile_options(/MT$<$<CONFIG:Debug>:d>)

    # Windows specific version info for the command line tool
    list(APPEND SHELL_SOURCES src/sqlite3mc_shell.rc)

# Build for macOS (Xcode)
elseif(APPLE)
    # On macOS, we want to have universal binaries (ARM + Intel)
    set(CMAKE_OSX_ARCHITECTURES arm64 x86_64)
    add_compile_options(-msse4.2 -maes -Wno-pointer-sign)

# Build for Linux (GCC)
elseif(UNIX)
    add_compile_options(-msse4.2 -maes)
endif()

# Create a static library
add_library(sqlite3mc STATIC ${LIB_SOURCES})

# Create a command line application, if we use one of the builtin ciphers
if(NOT HAVE_CIPHER_CUSTOM)
    add_executable(sqlite3mc_shell ${SHELL_SOURCES})
    target_link_libraries(sqlite3mc_shell sqlite3mc)
endif()

# Install target is a redist folder with the shared library, 
# the needed include files and the command line tool (if created)
set (CMAKE_INSTALL_PREFIX redist/${CMAKE_BUILD_TYPE})
install(FILES ${REDIST_HEADERS} DESTINATION include)
install(TARGETS sqlite3mc LIBRARY DESTINATION lib)
if (NOT HAVE_CIPHER_CUSTOM)
    install(TARGETS sqlite3mc_shell RUNTIME DESTINATION bin)
endif()
