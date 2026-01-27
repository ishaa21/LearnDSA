#include <stdio.h>

// Subsets using Backtracking
void printSubset(int arr[], int n, int idx, int subset[], int subsetSize) {
    if (idx == n) {
        printf("[");
        for (int i = 0; i < subsetSize; i++) printf("%d%s", subset[i], i+1==subsetSize?"":", ");
        printf("]\n");
        return;
    }
    // Include arr[idx]
    subset[subsetSize] = arr[idx];
    printSubset(arr, n, idx+1, subset, subsetSize+1);
    // Exclude arr[idx]
    printSubset(arr, n, idx+1, subset, subsetSize);
}

int main() {
    printf("=== Subsets (C) ===\n\n");
    int arr[] = {1, 2, 3};
    int n = 3;
    int subset[10];
    printSubset(arr, n, 0, subset, 0);
    printf("\nTime Complexity: O(2^n * n)\nSpace Complexity: O(n)\n");
    return 0;
}
