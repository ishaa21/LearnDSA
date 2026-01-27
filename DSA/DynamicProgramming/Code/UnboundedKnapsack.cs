// Unbounded Knapsack (DP) in C#

using System;

class UnboundedKnapsack {
    static int UnboundedKnapsackSolver(int W, int[] wt, int[] val, int n) {
        int[] dp = new int[W+1];
        for (int w = 0; w <= W; w++) {
            for (int i = 0; i < n; i++) {
                if (wt[i] <= w)
                    dp[w] = Math.Max(dp[w], dp[w-wt[i]] + val[i]);
            }
        }
        return dp[W];
    }
    static void Main() {
        Console.WriteLine("=== Unbounded Knapsack (C#) ===\n");
        int[] val = {10, 40, 50, 70};
        int[] wt = {1, 3, 4, 5};
        int W = 8;
        int n = 4;
        Console.WriteLine($"Max value: {UnboundedKnapsackSolver(W, wt, val, n)}");
        Console.WriteLine("\nTime Complexity: O(nW)");
        Console.WriteLine("Space Complexity: O(W)");
    }
}
