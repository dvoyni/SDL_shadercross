# Simple shaderc config for local installation

get_filename_component(SHADERC_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(SHADERC_ROOT_DIR "${SHADERC_CMAKE_DIR}/../../.." ABSOLUTE)

set(SHADERC_INCLUDE_DIRS "${SHADERC_ROOT_DIR}/include")
set(SHADERC_LIBRARY_DIRS "${SHADERC_ROOT_DIR}/lib")

if(NOT TARGET shaderc)
    add_library(shaderc SHARED IMPORTED)
    set_target_properties(shaderc PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${SHADERC_INCLUDE_DIRS}"
        IMPORTED_LOCATION "${SHADERC_ROOT_DIR}/bin/shaderc_shared.dll"
        IMPORTED_IMPLIB "${SHADERC_ROOT_DIR}/lib/shaderc_shared.lib"
    )
endif()

set(shaderc_FOUND TRUE)
