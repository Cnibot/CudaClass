#include <iostream>

#define N 10000

float *a_cpu, *b_cpu, *c_cpu;
float *a_gpu, *b_gpu, *c_gpu;

__global__ void add(float *a_gpu, float *b_gpu, float *c_gpu, int n){
    for(int i = 0; i < n; i++){
        c_gpu[i] = a_gpu[i] + b_gpu[i];
    }
}

int main() {

    a_cpu = (float*)malloc(sizeof(float)*N);
    b_cpu = (float*)malloc(sizeof(float)*N);
    c_cpu = (float*)malloc(sizeof(float)*N);

    cudaMalloc((float**)&a_gpu, sizeof(float) * N);
    cudaMalloc((float**)&b_gpu, sizeof(float) * N);
    cudaMalloc((float**)&c_gpu, sizeof(float) * N);

    for (int i = 1; i <= N; i++){
        a_cpu[i] = -i;
        b_cpu[i] = i*2;
        c_cpu[i] = a_cpu[i] + b_cpu[i];
    }

    cudaMemcpy(a_gpu, a_cpu, sizeof(float) * N, cudaMemcpyHostToDevice);
    cudaMemcpy(b_gpu, b_cpu, sizeof(float) * N, cudaMemcpyHostToDevice);
    cudaMemcpy(c_gpu, c_cpu, sizeof(float) * N, cudaMemcpyHostToDevice);

    add<<<1,10>>>(a_gpu, b_gpu, c_gpu, N);

    cudaMemcpy(c_cpu, c_gpu, sizeof(float) * N, cudaMemcpyDeviceToHost);

    for (int i = 1; i <= N; i++){
        printf("%.0f\n", c_cpu[i]);
    }

    cudaFree(a_gpu);
    cudaFree(b_gpu);
    cudaFree(c_gpu);
    free(a_cpu);
    free(b_cpu);
    free(c_cpu);

    getchar();
    return 0;
}