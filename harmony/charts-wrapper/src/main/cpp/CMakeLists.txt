cmake_minimum_required(VERSION 3.13)
set(CMAKE_VERBOSE_MAKEFILE on)

set(rnoh_charts_wrapper_generated_dir "${CMAKE_CURRENT_SOURCE_DIR}/generated")
file(GLOB_RECURSE rnoh_charts_wrapper_generated_SRC "${rnoh_charts_wrapper_generated_dir}/**/*.cpp")
file(GLOB rnoh_charts_wrapper_SRC CONFIGURE_DEPENDS *.cpp)
add_library(rnoh_charts_wrapper SHARED ${rnoh_charts_wrapper_SRC} ${rnoh_charts_wrapper_generated_SRC})
target_include_directories(rnoh_charts_wrapper PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} ${rnoh_charts_wrapper_generated_dir})
target_link_libraries(rnoh_charts_wrapper PUBLIC rnoh)
