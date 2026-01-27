// Subsets using Backtracking in C#

using System;
using System.Collections.Generic;

class Subsets {
    static void PrintSubset(int[] arr, int idx, List<int> subset) {
        if (idx == arr.Length) {
            Console.Write("[");
            for (int i = 0; i < subset.Count; i++)
                Console.Write(subset[i] + (i+1==subset.Count?"":", "));
            Console.WriteLine("]");
            return;
        }
        // Include arr[idx]
        subset.Add(arr[idx]);
        PrintSubset(arr, idx+1, subset);
        subset.RemoveAt(subset.Count-1);
        // Exclude arr[idx]
        PrintSubset(arr, idx+1, subset);
    }
    static void Main() {
        Console.WriteLine("=== Subsets (C#) ===\n");
        int[] arr = {1, 2, 3};
        PrintSubset(arr, 0, new List<int>());
        Console.WriteLine("\nTime Complexity: O(2^n * n)");
        Console.WriteLine("Space Complexity: O(n)");
    }
}
