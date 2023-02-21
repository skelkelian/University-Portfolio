cmake_minimum_required(VERSION 3.21)
project(Homework_2___Student_Files)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)
include_directories(RegressionTests)

add_executable(Homework_2___Student_Files
        RegressionTests/CheckResults.hpp
        RegressionTests/GroceryItemTests.cpp
        RegressionTests/GroceryListTests.cpp
        GroceryItem.cpp
        GroceryItem.hpp
        GroceryList.cpp
        GroceryList.hpp
        main.cpp)
