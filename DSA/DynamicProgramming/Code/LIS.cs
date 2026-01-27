// LIS (DP) in C#

using System;

class LIS {
    static (int, int[]) Lis(int[] arr) {
        int n = arr.Length;
        int[] dp = new int[n];       // dp[i] = length of LIS ending at i
        int[] parent = new int[n];   // parent[i] = previous index in LIS
        for (int i = 0; i < n; i++) {
            dp[i] = 1;
            parent[i] = -1;
        }

        int res = 1, lastIndex = 0;

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
        int[] lis = new int[res];
        int k = res - 1;
        while (lastIndex != -1) {
            lis[k--] = arr[lastIndex];
            lastIndex = parent[lastIndex];
        }

        return (res, lis);
    }

    static void Main() {
        Console.WriteLine("=== LIS (C#) ===\n");
        int[] arr = {10, 22, 9, 33, 21, 50, 41, 60};

        var (length, subsequence) = Lis(arr);

        Console.WriteLine($"Length of LIS: {length}");
        Console.WriteLine("LIS: " + string.Join(" ", subsequence));

        Console.WriteLine("\nTime Complexity: O(n^2)");
        Console.WriteLine("Space Complexity: O(n)");
    }
}