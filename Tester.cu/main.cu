#include <iostream>

__global__ void add(){

}

int main() {

    add<<<1,1>>>();
    int a[100];
    int b[100];
    int c[100];
    for (int i = 1; i <= 100; i++){
        a[i] = i;
        b[i] = i*2;
        c[i] = a[i] + b[i];
    }

    for (int i = 1; i <= 100; i++){
        printf("%d\n", c[i]);
    }

    getchar();
    return 0;
}
