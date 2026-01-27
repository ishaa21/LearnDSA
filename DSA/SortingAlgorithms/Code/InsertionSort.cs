using System;
using System.Linq;

// Insertion Sort in C#
// Build sorted array one item at a time by inserting elements at correct position

class InsertionSort {
    
    static void InsertionSortMethod(int[] arr) {
        int n = arr.Length;
        for (int i = 1; i < n; i++) {
            int key = arr[i];
            int j = i - 1;
            
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
    }
    
    static void InsertionSortWithStats(int[] arr) {
        int n = arr.Length;
        int comparisons = 0, shifts = 0;
        
        for (int i = 1; i < n; i++) {
            int key = arr[i];
            int j = i - 1;
            
            while (j >= 0 && arr[j] > key) {
                comparisons++;
                arr[j + 1] = arr[j];
                shifts++;
                j--;
            }
            comparisons++;
            arr[j + 1] = key;
        }
        
        Console.WriteLine($"Comparisons: {comparisons}, Shifts: {shifts}");
    }
    
    static void InsertionSortDescending(int[] arr) {
        int n = arr.Length;
        for (int i = 1; i < n; i++) {
            int key = arr[i];
            int j = i - 1;
            
            while (j >= 0 && arr[j] < key) {  // Changed for descending
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
    }
    
    static void DisplayArray(int[] arr) {
        Console.WriteLine(string.Join(" ", arr));
    }
    
    static void Main() {
        // Test 1: Basic insertion sort
        int[] arr = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("Original Array: ");
        DisplayArray(arr);
        
        InsertionSortMethod(arr);
        Console.WriteLine("Sorted Array: ");
        DisplayArray(arr);
        
        // Test 2: With statistics
        int[] arr2 = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("\nInsertion Sort with statistics:");
        InsertionSortWithStats(arr2);
        DisplayArray(arr2);
        
        // Test 3: Already sorted
        int[] arr3 = {1, 2, 3, 4, 5};
        Console.WriteLine("\nAlready sorted: ");
        DisplayArray(arr3);
        InsertionSortMethod(arr3);
        Console.WriteLine("After Insertion Sort: ");
        DisplayArray(arr3);
        
        // Test 4: Reverse sorted
        int[] arr4 = {5, 4, 3, 2, 1};
        Console.WriteLine("\nReverse sorted: ");
        DisplayArray(arr4);
        InsertionSortMethod(arr4);
        Console.WriteLine("After Insertion Sort: ");
        DisplayArray(arr4);
        
        // Test 5: Descending order
        int[] arr5 = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("\nDescending order:");
        InsertionSortDescending(arr5);
        DisplayArray(arr5);
        
        // Test 6: Duplicates
        int[] arr6 = {5, 2, 8, 2, 9, 1, 5, 5};
        Console.WriteLine("\nArray with duplicates: ");
        DisplayArray(arr6);
        InsertionSortMethod(arr6);
        Console.WriteLine("After Insertion Sort: ");
        DisplayArray(arr6);
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time Complexity: O(n^2) - Quadratic");
        Console.WriteLine("Space Complexity: O(1) - In-place");
        Console.WriteLine("Best Case: O(n) - Already sorted");
        Console.WriteLine("Worst Case: O(n^2) - Reverse sorted");
        Console.WriteLine("Average Case: O(n^2)");
        Console.WriteLine("Stable: Yes");
        Console.WriteLine("Adaptive: Yes - performs well on nearly sorted data");
    }
}
