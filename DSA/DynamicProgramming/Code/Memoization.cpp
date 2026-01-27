#include <iostream>
#include <vector>
#include <cstring>
using namespace std;

// Memoization for Fibonacci
int fib(int n, vector<int>& dp) {
    if (n <= 1) return n;
    if (dp[n] != -1) return dp[n];
    return dp[n] = fib(n-1, dp) + fib(n-2, dp);
}

int main() {
    cout << "=== Memoization Example (C++) ===\n\n";
    int n = 10;
    vector<int> dp(100, -1);
    cout << "Fibonacci(" << n << ") = " << fib(n, dp) << endl;
    cout << "\nTime Complexity: O(n)\nSpace Complexity: O(n)\n";
    return 0;
}
