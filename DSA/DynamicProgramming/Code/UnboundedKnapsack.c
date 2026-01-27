#include <stdio.h>
#include <string.h>

// Unbounded Knapsack (DP)
int max(int a, int b) { return a > b ? a : b; }

int unboundedKnapsack(int W, int wt[], int val[], int n) {
    int dp[W+1];
    memset(dp, 0, sizeof(dp));
    for (int w = 0; w <= W; w++) {
        for (int i = 0; i < n; i++) {
            if (wt[i] <= w)
                dp[w] = max(dp[w], dp[w-wt[i]] + val[i]);
        }
    }
    return dp[W];
}

int main() {
    printf("=== Unbounded Knapsack (C) ===\n\n");
    int val[] = {10, 40, 50, 70};
    int wt[] = {1, 3, 4, 5};
    int W = 8;
    int n = 4;
    printf("Max value: %d\n", unboundedKnapsack(W, wt, val, n));
    printf("\nTime Complexity: O(nW)\nSpace Complexity: O(W)\n");
    return 0;
}
