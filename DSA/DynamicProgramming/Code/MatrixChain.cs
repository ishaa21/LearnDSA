// Matrix Chain Multiplication (DP) in C#

using System;

class MatrixChain {
    static int MatrixChainOrder(int[] p, int n) {
        int[,] m = new int[n, n];
        for (int i = 1; i < n; i++) m[i, i] = 0;
        for (int L = 2; L < n; L++) {
            for (int i = 1; i < n-L+1; i++) {
                int j = i+L-1;
                m[i, j] = int.MaxValue;
                for (int k = i; k < j; k++) {
                    int q = m[i, k] + m[k+1, j] + p[i-1]*p[k]*p[j];
                    if (q < m[i, j]) m[i, j] = q;
                }
            }
        }
        return m[1, n-1];
    }
    static void Main() {
        Console.WriteLine("=== Matrix Chain Multiplication (C#) ===\n");
        int[] arr = {1, 2, 3, 4};
        int n = 4;
        Console.WriteLine($"Minimum multiplications: {MatrixChainOrder(arr, n)}");
        Console.WriteLine("\nTime Complexity: O(n^3)");
        Console.WriteLine("Space Complexity: O(n^2)");
    }
}
