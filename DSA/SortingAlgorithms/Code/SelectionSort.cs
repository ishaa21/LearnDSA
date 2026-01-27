using System;
using System.Linq;

// Selection Sort in C#
// Find minimum element and place at beginning, repeat for remaining array

class SelectionSort {
    
    static void SelectionSortMethod(int[] arr) {
        int n = arr.Length;
        for (int i = 0; i < n - 1; i++) {
            int minIdx = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIdx])
                    minIdx = j;
            }
            int temp = arr[i];
            arr[i] = arr[minIdx];
            arr[minIdx] = temp;
        }
    }
    
    static void SelectionSortWithStats(int[] arr) {
        int n = arr.Length;
        int comparisons = 0, swaps = 0;
        
        for (int i = 0; i < n - 1; i++) {
            int minIdx = i;
            for (int j = i + 1; j < n; j++) {
                comparisons++;
                if (arr[j] < arr[minIdx])
                    minIdx = j;
            }
            if (minIdx != i) {
                int temp = arr[i];
                arr[i] = arr[minIdx];
                arr[minIdx] = temp;
                swaps++;
            }
        }
        
        Console.WriteLine($"Comparisons: {comparisons}, Swaps: {swaps}");
    }
    
    static void SelectionSortDescending(int[] arr) {
        int n = arr.Length;
        for (int i = 0; i < n - 1; i++) {
            int maxIdx = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] > arr[maxIdx])  // Changed for descending
                    maxIdx = j;
            }
            int temp = arr[i];
            arr[i] = arr[maxIdx];
            arr[maxIdx] = temp;
        }
    }
    
    static void DisplayArray(int[] arr) {
        Console.WriteLine(string.Join(" ", arr));
    }
    
    static void Main() {
        // Test 1: Basic selection sort
        int[] arr = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("Original Array: ");
        DisplayArray(arr);
        
        SelectionSortMethod(arr);
        Console.WriteLine("Sorted Array: ");
        DisplayArray(arr);
        
        // Test 2: With statistics
        int[] arr2 = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("\nSelection Sort with statistics:");
        SelectionSortWithStats(arr2);
        DisplayArray(arr2);
        
        // Test 3: Already sorted
        int[] arr3 = {1, 2, 3, 4, 5};
        Console.WriteLine("\nAlready sorted: ");
        DisplayArray(arr3);
        SelectionSortMethod(arr3);
        Console.WriteLine("After Selection Sort: ");
        DisplayArray(arr3);
        
        // Test 4: Reverse sorted
        int[] arr4 = {5, 4, 3, 2, 1};
        Console.WriteLine("\nReverse sorted: ");
        DisplayArray(arr4);
        SelectionSortMethod(arr4);
        Console.WriteLine("After Selection Sort: ");
        DisplayArray(arr4);
        
        // Test 5: Descending order
        int[] arr5 = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("\nDescending order:");
        SelectionSortDescending(arr5);
        DisplayArray(arr5);
        
        // Test 6: Duplicates
        int[] arr6 = {5, 2, 8, 2, 9, 1, 5, 5};
        Console.WriteLine("\nArray with duplicates: ");
        DisplayArray(arr6);
        SelectionSortMethod(arr6);
        Console.WriteLine("After Selection Sort: ");
        DisplayArray(arr6);
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time Complexity: O(n^2) - Quadratic");
        Console.WriteLine("Space Complexity: O(1) - In-place");
        Console.WriteLine("Best Case: O(n^2)");
        Console.WriteLine("Worst Case: O(n^2)");
        Console.WriteLine("Average Case: O(n^2)");
        Console.WriteLine("Stable: No (not stable)");
        Console.WriteLine("Number of swaps: At most n-1");
    }
}
