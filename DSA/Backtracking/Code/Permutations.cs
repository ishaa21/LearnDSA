// Permutations using Backtracking in C#

using System;

class Permutations {
    static void Permute(int[] arr, int l, int r) {
        if (l == r) {
            Console.Write("[");
            for (int i = 0; i <= r; i++)
                Console.Write(arr[i] + (i==r?"":", "));
            Console.WriteLine("]");
            return;
        }
        for (int i = l; i <= r; i++) {
            int t = arr[l]; arr[l] = arr[i]; arr[i] = t;
            Permute(arr, l+1, r);
            t = arr[l]; arr[l] = arr[i]; arr[i] = t;
        }
    }
    static void Main() {
        Console.WriteLine("=== Permutations (C#) ===\n");
        int[] arr = {1, 2, 3};
        Permute(arr, 0, arr.Length-1);
        Console.WriteLine("\nTime Complexity: O(n! * n)");
        Console.WriteLine("Space Complexity: O(n)");
    }
}
