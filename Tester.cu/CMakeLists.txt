cmake_minimum_required(VERSION 3.17)
project(Tester_cu CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(Tester_cu main.cu cmake-build-debug/othermain.cu cmake-build-debug/othermain.cuh cmake-build-debug/deviceQuery.cu)

set_target_properties(
        Tester_cu
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)