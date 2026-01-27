#include <stdio.h>

// Combinations using Backtracking
void combineUtil(int arr[], int n, int r, int idx, int data[], int i) {
    if (idx == r) {
        printf("[");
        for (int j = 0; j < r; j++) printf("%d%s", data[j], j+1==r?"":", ");
        printf("]\n");
        return;
    }
    if (i >= n) return;
    data[idx] = arr[i];
    combineUtil(arr, n, r, idx+1, data, i+1);
    combineUtil(arr, n, r, idx, data, i+1);
}

int main() {
    printf("=== Combinations (C) ===\n\n");
    int arr[] = {1, 2, 3, 4};
    int n = 4, r = 2;
    int data[10];
    combineUtil(arr, n, r, 0, data, 0);
    printf("\nTime Complexity: O(C(n, r) * r)\nSpace Complexity: O(r)\n");
    return 0;
}
