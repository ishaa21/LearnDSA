#include <stdio.h>

// Tabulation for Fibonacci
int fib(int n) {
    int dp[100];
    dp[0] = 0;
    dp[1] = 1;
    for (int i = 2; i <= n; i++) {
        dp[i] = dp[i-1] + dp[i-2];
    }
    return dp[n];
}

int main() {
    printf("=== Tabulation Example (C) ===\n\n");
    int n = 10;
    printf("Fibonacci(%d) = %d\n", n, fib(n));
    printf("\nTime Complexity: O(n)\nSpace Complexity: O(n)\n");
    return 0;
}
