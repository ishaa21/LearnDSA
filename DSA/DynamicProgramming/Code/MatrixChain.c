#include <stdio.h>
#include <limits.h>

// Matrix Chain Multiplication (DP)
int min(int a, int b) { return a < b ? a : b; }

int matrixChainOrder(int p[], int n) {
    int m[n][n];
    for (int i = 1; i < n; i++) m[i][i] = 0;
    for (int L = 2; L < n; L++) {
        for (int i = 1; i < n-L+1; i++) {
            int j = i+L-1;
            m[i][j] = INT_MAX;
            for (int k = i; k < j; k++) {
                int q = m[i][k] + m[k+1][j] + p[i-1]*p[k]*p[j];
                if (q < m[i][j]) m[i][j] = q;
            }
        }
    }
    return m[1][n-1];
}

int main() {
    printf("=== Matrix Chain Multiplication (C) ===\n\n");
    int arr[] = {1, 2, 3, 4};
    int n = 4;
    printf("Minimum multiplications: %d\n", matrixChainOrder(arr, n));
    printf("\nTime Complexity: O(n^3)\nSpace Complexity: O(n^2)\n");
    return 0;
}
