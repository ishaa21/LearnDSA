using System;
using System.Linq;

// Counting Sort in C#
// Non-comparison sort - counts occurrences of each element

class CountingSort {
    
    static void CountingSortMethod(int[] arr) {
        if (arr.Length == 0) return;
        
        int maxVal = arr.Max();
        int minVal = arr.Min();
        int range = maxVal - minVal + 1;
        
        int[] count = new int[range];
        
        foreach (int num in arr)
            count[num - minVal]++;
        
        for (int i = 1; i < range; i++)
            count[i] += count[i - 1];
        
        int[] output = new int[arr.Length];
        for (int i = arr.Length - 1; i >= 0; i--) {
            output[count[arr[i] - minVal] - 1] = arr[i];
            count[arr[i] - minVal]--;
        }
        
        for (int i = 0; i < arr.Length; i++)
            arr[i] = output[i];
    }
    
    static void CountingSortRange(int[] arr, int maxVal) {
        int[] count = new int[maxVal + 1];
        
        foreach (int num in arr)
            count[num]++;
        
        int index = 0;
        for (int i = 0; i <= maxVal; i++) {
            for (int j = 0; j < count[i]; j++) {
                arr[index++] = i;
            }
        }
    }
    
    static void DisplayArray(int[] arr) {
        Console.WriteLine(string.Join(" ", arr));
    }
    
    static void Main() {
        // Test 1: Basic counting sort
        int[] arr = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("Original Array: ");
        DisplayArray(arr);
        
        CountingSortMethod(arr);
        Console.WriteLine("Sorted Array (Counting Sort): ");
        DisplayArray(arr);
        
        // Test 2: Small range
        int[] arr2 = {4, 2, 3, 4, 1, 2, 4};
        Console.WriteLine("\nSmall range array: ");
        DisplayArray(arr2);
        CountingSortRange(arr2, 4);
        Console.WriteLine("After Counting Sort: ");
        DisplayArray(arr2);
        
        // Test 3: Duplicates
        int[] arr3 = {5, 2, 8, 2, 9, 1, 5, 5};
        Console.WriteLine("\nArray with duplicates: ");
        DisplayArray(arr3);
        CountingSortMethod(arr3);
        Console.WriteLine("After Counting Sort: ");
        DisplayArray(arr3);
        
        // Test 4: Already sorted
        int[] arr4 = {1, 2, 3, 4, 5};
        Console.WriteLine("\nAlready sorted: ");
        DisplayArray(arr4);
        CountingSortMethod(arr4);
        Console.WriteLine("After Counting Sort: ");
        DisplayArray(arr4);
        
        // Test 5: Reverse sorted
        int[] arr5 = {5, 4, 3, 2, 1};
        Console.WriteLine("\nReverse sorted: ");
        DisplayArray(arr5);
        CountingSortMethod(arr5);
        Console.WriteLine("After Counting Sort: ");
        DisplayArray(arr5);
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time Complexity: O(n + k) where k is range of input");
        Console.WriteLine("Space Complexity: O(k)");
        Console.WriteLine("Best Case: O(n + k)");
        Console.WriteLine("Worst Case: O(n + k)");
        Console.WriteLine("Average Case: O(n + k)");
        Console.WriteLine("Stable: Yes");
        Console.WriteLine("Note: Non-comparison, efficient for small ranges");
    }
}
