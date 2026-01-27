#include <stdio.h>

// Permutations using Backtracking
void swap(int* a, int* b) { int t = *a; *a = *b; *b = t; }
void permute(int arr[], int l, int r) {
    if (l == r) {
        printf("[");
        for (int i = 0; i <= r; i++) printf("%d%s", arr[i], i==r?"":", ");
        printf("]\n");
        return;
    }
    for (int i = l; i <= r; i++) {
        swap(&arr[l], &arr[i]);
        permute(arr, l+1, r);
        swap(&arr[l], &arr[i]);
    }
}

int main() {
    printf("=== Permutations (C) ===\n\n");
    int arr[] = {1, 2, 3};
    int n = 3;
    permute(arr, 0, n-1);
    printf("\nTime Complexity: O(n! * n)\nSpace Complexity: O(n)\n");
    return 0;
}
