cmake_minimum_required(VERSION 3.13)

project(glfw-project)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR})

find_package(GLFW)
find_package(OpenGL)

file(GLOB SOURCE_FILES ${CMAKE_SOURCE_DIR}/*.cpp)
file(GLOB HEADER_FILES ${CMAKE_SOURCE_DIR}/*.h)
file(GLOB HPP_FILES ${CMAKE_SOURCE_DIR}/*.hpp)

add_executable(${CMAKE_PROJECT_NAME} ${SOURCE_FILES} ${HEADER_FILES} ${HPP_FILES})

target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE ${GLFW_INCLUDE_DIR})
target_link_libraries(${CMAKE_PROJECT_NAME} GLFW::GLFW OpenGL::GL)