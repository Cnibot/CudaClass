#include <iostream>

#define N 10000
float *a, *b, *c;
__global__ void add(){

}

int main() {

    add<<<1,1>>>();
    a = (float*)malloc(sizeof(float)*N);
    b = (float*)malloc(sizeof(float)*N);
    c = (float*)malloc(sizeof(float)*N);
    for (int i = 1; i <= N; i++){
        a[i] = i;
        b[i] = i*2;
        c[i] = a[i] + b[i];
    }

    for (int i = 1; i <= N; i++){
        printf("%.2f\n", c[i]);
    }

    getchar();
    return 0;
}
