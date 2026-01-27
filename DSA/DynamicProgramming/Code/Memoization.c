#include <stdio.h>
#include <string.h>

// Memoization for Fibonacci
int fib(int n, int dp[]) {
    if (n <= 1) return n;
    if (dp[n] != -1) return dp[n];
    dp[n] = fib(n-1, dp) + fib(n-2, dp);
    return dp[n];
}

int main() {
    printf("=== Memoization Example (C) ===\n\n");
    int n = 10;
    int dp[100];
    memset(dp, -1, sizeof(dp));
    printf("Fibonacci(%d) = %d\n", n, fib(n, dp));
    printf("\nTime Complexity: O(n)\nSpace Complexity: O(n)\n");
    return 0;
}
