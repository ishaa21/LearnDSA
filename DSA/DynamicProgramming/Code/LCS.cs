// LCS (DP) in C#

using System;

class LCS {
    static (int, string) Lcs(string X, string Y) {
        int m = X.Length;
        int n = Y.Length;
        int[,] dp = new int[m+1, n+1];

        // Build DP table
        for (int i = 0; i <= m; i++) {
            for (int j = 0; j <= n; j++) {
                if (i == 0 || j == 0)
                    dp[i, j] = 0;
                else if (X[i-1] == Y[j-1])
                    dp[i, j] = 1 + dp[i-1, j-1];
                else
                    dp[i, j] = Math.Max(dp[i-1, j], dp[i, j-1]);
            }
        }

        // Reconstruct LCS string
        int length = dp[m, n];
        int ii = m, jj = n;
        char[] lcsChars = new char[length];
        int index = length - 1;

        while (ii > 0 && jj > 0) {
            if (X[ii-1] == Y[jj-1]) {
                lcsChars[index] = X[ii-1];
                ii--;
                jj--;
                index--;
            }
            else if (dp[ii-1, jj] > dp[ii, jj-1])
                ii--;
            else
                jj--;
        }

        string lcsStr = new string(lcsChars);
        return (dp[m, n], lcsStr);
    }

    static void Main() {
        Console.WriteLine("=== LCS (C#) ===\n");
        string X = "AGGTAB";
        string Y = "GXTXAYB";

        var (length, subsequence) = Lcs(X, Y);

        Console.WriteLine($"Length of LCS: {length}");
        Console.WriteLine($"LCS: {subsequence}");

        Console.WriteLine("\nTime Complexity: O(mn)");
        Console.WriteLine("Space Complexity: O(mn)");
    }
}