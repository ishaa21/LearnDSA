using System;
using System.Linq;

// Radix Sort in C#
// Sorts by processing individual digits

class RadixSort {
    
    static void CountingSortForRadix(int[] arr, int exp) {
        int n = arr.Length;
        int[] output = new int[n];
        int[] count = new int[10];
        
        for (int i = 0; i < n; i++)
            count[(arr[i] / exp) % 10]++;
        
        for (int i = 1; i < 10; i++)
            count[i] += count[i - 1];
        
        for (int i = n - 1; i >= 0; i--) {
            int index = (arr[i] / exp) % 10;
            output[count[index] - 1] = arr[i];
            count[index]--;
        }
        
        for (int i = 0; i < n; i++)
            arr[i] = output[i];
    }
    
    static void RadixSortMethod(int[] arr) {
        if (arr.Length == 0) return;
        
        int maxVal = arr.Max();
        
        for (int exp = 1; maxVal / exp > 0; exp *= 10)
            CountingSortForRadix(arr, exp);
    }
    
    static void DisplayArray(int[] arr) {
        Console.WriteLine(string.Join(" ", arr));
    }
    
    static void Main() {
        // Test 1: Basic radix sort
        int[] arr = {170, 45, 75, 90, 2, 802, 24, 2, 66};
        Console.WriteLine("Original Array: ");
        DisplayArray(arr);
        
        RadixSortMethod(arr);
        Console.WriteLine("Sorted Array (Radix Sort): ");
        DisplayArray(arr);
        
        // Test 2: Single digit
        int[] arr2 = {5, 2, 8, 3, 9, 1, 4};
        Console.WriteLine("\nSingle digit array: ");
        DisplayArray(arr2);
        RadixSortMethod(arr2);
        Console.WriteLine("After Radix Sort: ");
        DisplayArray(arr2);
        
        // Test 3: Duplicates
        int[] arr3 = {50, 25, 85, 25, 90, 10, 50, 50};
        Console.WriteLine("\nArray with duplicates: ");
        DisplayArray(arr3);
        RadixSortMethod(arr3);
        Console.WriteLine("After Radix Sort: ");
        DisplayArray(arr3);
        
        // Test 4: Already sorted
        int[] arr4 = {10, 20, 30, 40, 50};
        Console.WriteLine("\nAlready sorted: ");
        DisplayArray(arr4);
        RadixSortMethod(arr4);
        Console.WriteLine("After Radix Sort: ");
        DisplayArray(arr4);
        
        // Test 5: Reverse sorted
        int[] arr5 = {500, 400, 300, 200, 100};
        Console.WriteLine("\nReverse sorted: ");
        DisplayArray(arr5);
        RadixSortMethod(arr5);
        Console.WriteLine("After Radix Sort: ");
        DisplayArray(arr5);
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time Complexity: O(d * (n + k)) where d is number of digits");
        Console.WriteLine("Space Complexity: O(n + k)");
        Console.WriteLine("Best Case: O(d * n)");
        Console.WriteLine("Worst Case: O(d * (n + k))");
        Console.WriteLine("Average Case: O(d * (n + k))");
        Console.WriteLine("Stable: Yes");
        Console.WriteLine("Note: Works best for positive integers, efficient for large datasets");
    }
}
