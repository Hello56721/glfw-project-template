find_path(
    GLFW_INCLUDE_DIR
    NAMES GLFW/glfw3.h GLFW/glfw3native.h
    PATHS ${CMAKE_SOURCE_DIR}/glfw/include
)

if (APPLE)
    find_library(
        GLFW_LIBRARY
        NAMES libglfw.3.dylib
        PATHS ${CMAKE_SOURCE_DIR}/glfw/src
    )
elseif(WIN32)
    if (MSVC)
        find_library(
            GLFW_LIBRARY
            NAMES glfw3.lib glfw3dll.lib
            PATHS ${CMAKE_SOURCE_DIR}/glfw/src/Debug
                  ${CMAKE_SOURCE_DIR}/glfw/src/Release
        )
    else()
        find_library(
            GLFW_LIBRARY
            NAMES libglfw3.a libglfw3dll.a
            PATHS ${CMAKE_SOURCE_DIR}/glfw/src
        )
    endif()
elseif(UNIX AND NOT APPLE)
    find_library(
        GLFW_LIBRARY
        NAMES libglfw3.a libglfw.so.3
        PATHS ${CMAKE_SOURCE_DIR}/glfw/src
    )
endif()

if (WIN32)
    if (MSVC)
        if (GLFW_LIBRARY MATCHES ".*dll.lib$")
            add_library(GLFW::GLFW SHARED IMPORTED)
        else()
            add_library(GLFW::GLFW STATIC IMPORTED)
        endif()
    else()
        if (GLFW_LIBRARY MATCHES ".*dll.a$")
            add_library(GLFW::GLFW SHARED IMPORTED)
        else()
            add_library(GLFW::GLFW STATIC IMPORTED)
        endif()
    endif()
else()
    if (APPLE)
        if (GLFW_LIBRARY MATCHES ".*.dylib$")
            add_library(GLFW::GLFW SHARED IMPORTED)
        else()
            add_library(GLFW::GLFW STATIC IMPORTED)
        endif()
    else()
        if (GLFW_LIBRARY MATCHES ".*.so$")
            add_library(GLFW::GLFW SHARED IMPORTED)
        else()
            add_library(GLFW::GLFW STATIC IMPORTED)
        endif()
    endif()
endif()

set_property(TARGET GLFW::GLFW PROPERTY IMPORTED_LOCATION ${GLFW_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GLFW DEFAULT_MSG GLFW_LIBRARY GLFW_INCLUDE_DIR)