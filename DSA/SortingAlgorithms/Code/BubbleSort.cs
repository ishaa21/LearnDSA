using System;
using System.Linq;

// Bubble Sort in C#
// Repeatedly swap adjacent elements if they are in wrong order

class BubbleSort {
    
    static void BubbleSortMethod(int[] arr) {
        int n = arr.Length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
    
    static void BubbleSortOptimized(int[] arr) {
        int n = arr.Length;
        for (int i = 0; i < n - 1; i++) {
            bool swapped = false;
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    swapped = true;
                }
            }
            if (!swapped) break;
        }
    }
    
    static void BubbleSortDescending(int[] arr) {
        int n = arr.Length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] < arr[j + 1]) {  // Changed for descending
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
    
    static void DisplayArray(int[] arr) {
        Console.WriteLine(string.Join(" ", arr));
    }
    
    static void Main() {
        // Test 1: Basic bubble sort
        int[] arr = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("Original Array: ");
        DisplayArray(arr);
        
        BubbleSortMethod(arr);
        Console.WriteLine("Sorted (Bubble Sort): ");
        DisplayArray(arr);
        
        // Test 2: Optimized version
        int[] arr2 = {64, 34, 25, 12, 22, 11, 90};
        BubbleSortOptimized(arr2);
        Console.WriteLine("\nSorted (Optimized): ");
        DisplayArray(arr2);
        
        // Test 3: Already sorted
        int[] arr3 = {1, 2, 3, 4, 5};
        Console.WriteLine("\nAlready sorted: ");
        DisplayArray(arr3);
        BubbleSortOptimized(arr3);
        Console.WriteLine("After Bubble Sort: ");
        DisplayArray(arr3);
        
        // Test 4: Reverse sorted
        int[] arr4 = {5, 4, 3, 2, 1};
        Console.WriteLine("\nReverse sorted: ");
        DisplayArray(arr4);
        BubbleSortMethod(arr4);
        Console.WriteLine("After Bubble Sort: ");
        DisplayArray(arr4);
        
        // Test 5: Descending order
        int[] arr5 = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("\nDescending order sorting:");
        BubbleSortDescending(arr5);
        DisplayArray(arr5);
        
        // Test 6: Duplicates
        int[] arr6 = {5, 2, 8, 2, 9, 1, 5, 5};
        Console.WriteLine("\nArray with duplicates: ");
        DisplayArray(arr6);
        BubbleSortOptimized(arr6);
        Console.WriteLine("After Bubble Sort: ");
        DisplayArray(arr6);
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time Complexity: O(n^2) - Quadratic");
        Console.WriteLine("Space Complexity: O(1) - In-place");
        Console.WriteLine("Best Case: O(n) - Already sorted (optimized)");
        Console.WriteLine("Worst Case: O(n^2) - Reverse sorted");
        Console.WriteLine("Stable: Yes");
    }
}
