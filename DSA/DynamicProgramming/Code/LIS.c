#include <stdio.h>

// Longest Increasing Subsequence (LIS) (DP)
int max(int a, int b) { return a > b ? a : b; }

int lis(int arr[], int n, int result[]) {
    int dp[n];        // dp[i] = length of LIS ending at i
    int parent[n];    // parent[i] = previous index in LIS

    for (int i = 0; i < n; i++) {
        dp[i] = 1;
        parent[i] = -1;
    }

    int res = 1, lastIndex = 0;

    // Build dp and parent arrays
    for (int i = 1; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (arr[i] > arr[j] && dp[i] < dp[j] + 1) {
                dp[i] = dp[j] + 1;
                parent[i] = j;
            }
        }
        if (dp[i] > res) {
            res = dp[i];
            lastIndex = i;
        }
    }

    // Reconstruct LIS
    int k = res - 1;
    while (lastIndex != -1) {
        result[k--] = arr[lastIndex];
        lastIndex = parent[lastIndex];
    }

    return res;
}

int main() {
    printf("=== LIS (C) ===\n\n");
    int arr[] = {10, 22, 9, 33, 21, 50, 41, 60};
    int n = 8;
    int result[n]; // to store LIS

    int length = lis(arr, n, result);

    printf("Length of LIS: %d\n", length);
    printf("LIS: ");
    for (int i = 0; i < length; i++) {
        printf("%d ", result[i]);
    }
    printf("\n");

    printf("\nTime Complexity: O(n^2)\nSpace Complexity: O(n)\n");
    return 0;
}