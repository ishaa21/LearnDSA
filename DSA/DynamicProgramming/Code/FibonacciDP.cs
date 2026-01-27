// Fibonacci using DP (Tabulation) in C#

using System;

class FibonacciDP {
    static int Fib(int n) {
        int[] dp = new int[100];
        dp[0] = 0;
        dp[1] = 1;
        for (int i = 2; i <= n; i++) {
            dp[i] = dp[i-1] + dp[i-2];
        }
        return dp[n];
    }
    static void Main() {
        Console.WriteLine("=== Fibonacci using DP (C#) ===\n");
        int n = 10;
        Console.WriteLine($"Fibonacci({n}) = {Fib(n)}");
        Console.WriteLine("\nTime Complexity: O(n)");
        Console.WriteLine("Space Complexity: O(n)");
    }
}
