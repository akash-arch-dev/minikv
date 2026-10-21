find_package(GTest CONFIG REQUIRED)

add_executable(miniKv_tests
    utility_test.cpp
)

target_link_libraries(miniKv_tests PRIVATE
    miniKv_lib
    GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(miniKv_tests)