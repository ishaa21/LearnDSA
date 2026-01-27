// 0/1 Knapsack (DP) in C#

using System;

class Knapsack01 {
    static int Knapsack(int W, int[] wt, int[] val, int n) {
        int[,] dp = new int[n+1, W+1];
        for (int i = 0; i <= n; i++) {
            for (int w = 0; w <= W; w++) {
                if (i == 0 || w == 0)
                    dp[i, w] = 0;
                else if (wt[i-1] <= w)
                    dp[i, w] = Math.Max(val[i-1] + dp[i-1, w-wt[i-1]], dp[i-1, w]);
                else
                    dp[i, w] = dp[i-1, w];
            }
        }
        return dp[n, W];
    }
    static void Main() {
        Console.WriteLine("=== 0/1 Knapsack (C#) ===\n");
        int[] val = {60, 100, 120};
        int[] wt = {10, 20, 30};
        int W = 50;
        int n = 3;
        Console.WriteLine($"Max value: {Knapsack(W, wt, val, n)}");
        Console.WriteLine("\nTime Complexity: O(nW)");
        Console.WriteLine("Space Complexity: O(nW)");
    }
}
