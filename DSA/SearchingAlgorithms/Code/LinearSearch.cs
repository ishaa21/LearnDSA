using System;
using System.Collections.Generic;
using System.Linq;

// Linear Search in C#
// Search for an element by checking each element sequentially

class LinearSearch {
    
    static int LinearSearchMethod(int[] arr, int target) {
        for (int i = 0; i < arr.Length; i++) {
            if (arr[i] == target)
                return i;  // Return index if found
        }
        return -1;  // Return -1 if not found
    }
    
    static int[] LinearSearchAll(int[] arr, int target) {
        List<int> indices = new List<int>();
        for (int i = 0; i < arr.Length; i++) {
            if (arr[i] == target)
                indices.Add(i);
        }
        return indices.ToArray();
    }
    
    static void DisplayArray(int[] arr) {
        Console.Write("Array: ");
        foreach (int num in arr)
            Console.Write(num + " ");
        Console.WriteLine();
    }
    
    static void Main() {
        int[] arr = {64, 34, 25, 12, 22, 11, 90};
        
        DisplayArray(arr);
        
        // Test 1: Search for existing element
        int target = 22;
        Console.WriteLine("\nSearching for " + target + ": ");
        int result = LinearSearchMethod(arr, target);
        if (result != -1)
            Console.WriteLine("Found at index " + result);
        else
            Console.WriteLine("Not found");
        
        // Test 2: Search for first element
        target = 64;
        Console.WriteLine("Searching for " + target + ": ");
        result = LinearSearchMethod(arr, target);
        if (result != -1)
            Console.WriteLine("Found at index " + result);
        else
            Console.WriteLine("Not found");
        
        // Test 3: Search for last element
        target = 90;
        Console.WriteLine("Searching for " + target + ": ");
        result = LinearSearchMethod(arr, target);
        if (result != -1)
            Console.WriteLine("Found at index " + result);
        else
            Console.WriteLine("Not found");
        
        // Test 4: Search for non-existing element
        target = 100;
        Console.WriteLine("Searching for " + target + ": ");
        result = LinearSearchMethod(arr, target);
        if (result != -1)
            Console.WriteLine("Found at index " + result);
        else
            Console.WriteLine("Not found");
        
        // Test 5: Find all occurrences
        int[] arr2 = {10, 20, 30, 20, 40, 20};
        DisplayArray(arr2);
        target = 20;
        int[] indices = LinearSearchAll(arr2, target);
        Console.Write("All occurrences of " + target + ": ");
        foreach (int idx in indices)
            Console.Write(idx + " ");
        Console.WriteLine();
        
        // Test 6: Using LINQ
        Console.WriteLine("\nUsing LINQ:");
        Console.WriteLine("Contains 22: " + arr.Contains(22));
        var indices2 = arr.Select((num, idx) => new { num, idx })
                         .Where(x => x.num == 22)
                         .Select(x => x.idx)
                         .ToList();
        Console.WriteLine("Indices using LINQ: " + string.Join(" ", indices2));
        
        // Complexity Analysis
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time Complexity: O(n) - Linear");
        Console.WriteLine("Space Complexity: O(1) - Constant");
    }
}
