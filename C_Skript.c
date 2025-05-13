#include <stdio.h>

#define N 5
#define M 3

void process(int n, int m, int matrix[M][N], int* resptr) {
    for (int i = 0; i < m; ++i) {
        int rowSum = 0;
        for (int j = 0; j < n; ++j) {
            rowSum += matrix[i][j];
        }
        if (rowSum > *resptr) *resptr = rowSum;
    }
}

int main(int argc, char** argv) {
    int matrix[M][N];
    int result = 0;  
    int* resptr = &result;  

    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, M, matrix, resptr);
    printf("%d", result);
    return 0;
}