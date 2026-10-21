cmake_minimum_required(VERSION 3.20)

project(miniKv
    VERSION 1.0
    LANGUAGES CXX
)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# 1. Create the utility library
add_library(miniKv_utility STATIC 
    src/utility.cpp
)       

# 2. Make include headers accessible to the library and anything that links to it
target_include_directories(miniKv_utility PUBLIC 
    "${CMAKE_CURRENT_SOURCE_DIR}/include"
)

# 3. Create the executable
add_executable(miniKv main.cpp)

# 4. Link the executable to the utility library
target_link_libraries(miniKv PRIVATE 
    miniKv_utility
)



option(MINIKV_BUILD_TESTS "Build miniKv tests" OFF)

if(MINIKV_BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()

