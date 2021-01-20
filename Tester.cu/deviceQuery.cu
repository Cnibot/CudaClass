#include <iostream>

int main() {
    int devices;

    cudaGetDeviceCount(&devices);
    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, 0);

    printf("  Device name: %s\n", prop.name);
    printf("  Memory Clock Rate (KHz): %d\n", prop.memoryClockRate);
    printf("  Memory Bus Width (bits): %d\n", prop.memoryBusWidth);
    printf("  Peak Memory Bandwidth (GB/s): %f\n\n", 2.0*prop.memoryClockRate*(prop.memoryBusWidth/8)/1.0e6);

    getchar();
}
