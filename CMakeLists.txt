project(SQLite3MultipleCiphers)
cmake_minimum_required(VERSION 3.21)

# Uses built-in ciphers per default, set HAVE_CIPHER_CUSTOM to ON to use your own ciphers instead:
# Example: cmake .. -DCMAKE_BUILD_TYPE=Release -DHAVE_CIPHER_CUSTOM=ON -DCMAKE_OSX_DEPLOYMENT_TARGET=11.0
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

# Build for Windows
if(WIN32)
    # Windows specific version info for the command line tool
    list(APPEND SHELL_SOURCES src/sqlite3mc_shell.rc)

# Build for macOS
elseif(APPLE)
    # On macOS, we want to have universal binaries (ARM + Intel)
    set(CMAKE_OSX_ARCHITECTURES arm64 x86_64)
    add_compile_options(-maes)
    add_compile_options(-Wno-pointer-sign)

# Build for Linux
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
