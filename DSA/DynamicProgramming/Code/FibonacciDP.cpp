#include <iostream>
using namespace std;

// Fibonacci using DP (Tabulation)
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
    cout << "=== Fibonacci using DP (C++) ===\n\n";
    int n = 10;
    cout << "Fibonacci(" << n << ") = " << fib(n) << endl;
    cout << "\nTime Complexity: O(n)\nSpace Complexity: O(n)\n";
    return 0;
}
