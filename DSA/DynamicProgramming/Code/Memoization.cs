// Memoization Example in C#

using System;

class Memoization {
    static int Fib(int n, int[] dp) {
        if (n <= 1) return n;
        if (dp[n] != -1) return dp[n];
        return dp[n] = Fib(n-1, dp) + Fib(n-2, dp);
    }
    static void Main() {
        Console.WriteLine("=== Memoization Example (C#) ===\n");
        int n = 10;
        int[] dp = new int[100];
        for (int i = 0; i < 100; i++) dp[i] = -1;
        Console.WriteLine($"Fibonacci({n}) = {Fib(n, dp)}");
        Console.WriteLine("\nTime Complexity: O(n)");
        Console.WriteLine("Space Complexity: O(n)");
    }
}
