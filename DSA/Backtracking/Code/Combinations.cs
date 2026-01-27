// Combinations using Backtracking in C#

using System;
using System.Collections.Generic;

class Combinations {
    static void Combine(int[] arr, int r, int idx, List<int> data, int i) {
        if (idx == r) {
            Console.Write("[");
            for (int j = 0; j < r; j++)
                Console.Write(data[j] + (j+1==r?"":", "));
            Console.WriteLine("]");
            return;
        }
        if (i >= arr.Length) return;
        data.Add(arr[i]);
        Combine(arr, r, idx+1, data, i+1);
        data.RemoveAt(data.Count-1);
        Combine(arr, r, idx, data, i+1);
    }
    static void Main() {
        Console.WriteLine("=== Combinations (C#) ===\n");
        int[] arr = {1, 2, 3, 4};
        int r = 2;
        Combine(arr, r, 0, new List<int>(), 0);
        Console.WriteLine("\nTime Complexity: O(C(n, r) * r)");
        Console.WriteLine("Space Complexity: O(r)");
    }
}
