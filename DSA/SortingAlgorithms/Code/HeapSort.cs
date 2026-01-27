using System;
using System.Linq;

// Heap Sort in C#
// Uses max heap to sort array in ascending order

class HeapSort {
    
    static void Heapify(int[] arr, int n, int i) {
        int largest = i;
        int left = 2 * i + 1;
        int right = 2 * i + 2;
        
        if (left < n && arr[left] > arr[largest])
            largest = left;
        
        if (right < n && arr[right] > arr[largest])
            largest = right;
        
        if (largest != i) {
            int temp = arr[i];
            arr[i] = arr[largest];
            arr[largest] = temp;
            Heapify(arr, n, largest);
        }
    }
    
    static void HeapSortMethod(int[] arr) {
        int n = arr.Length;
        
        // Build max heap
        for (int i = n / 2 - 1; i >= 0; i--)
            Heapify(arr, n, i);
        
        // Extract elements from heap
        for (int i = n - 1; i > 0; i--) {
            int temp = arr[0];
            arr[0] = arr[i];
            arr[i] = temp;
            Heapify(arr, i, 0);
        }
    }
    
    static void DisplayArray(int[] arr) {
        Console.WriteLine(string.Join(" ", arr));
    }
    
    static void Main() {
        // Test 1: Basic heap sort
        int[] arr = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("Original Array: ");
        DisplayArray(arr);
        
        HeapSortMethod(arr);
        Console.WriteLine("Sorted Array (Heap Sort): ");
        DisplayArray(arr);
        
        // Test 2: Already sorted
        int[] arr2 = {1, 2, 3, 4, 5};
        Console.WriteLine("\nAlready sorted: ");
        DisplayArray(arr2);
        HeapSortMethod(arr2);
        Console.WriteLine("After Heap Sort: ");
        DisplayArray(arr2);
        
        // Test 3: Reverse sorted
        int[] arr3 = {5, 4, 3, 2, 1};
        Console.WriteLine("\nReverse sorted: ");
        DisplayArray(arr3);
        HeapSortMethod(arr3);
        Console.WriteLine("After Heap Sort: ");
        DisplayArray(arr3);
        
        // Test 4: Duplicates
        int[] arr4 = {5, 2, 8, 2, 9, 1, 5, 5};
        Console.WriteLine("\nArray with duplicates: ");
        DisplayArray(arr4);
        HeapSortMethod(arr4);
        Console.WriteLine("After Heap Sort: ");
        DisplayArray(arr4);
        
        // Test 5: Single element
        int[] arr5 = {42};
        Console.WriteLine("\nSingle element: ");
        DisplayArray(arr5);
        HeapSortMethod(arr5);
        Console.WriteLine("After Heap Sort: ");
        DisplayArray(arr5);
        
        // Test 6: Two elements
        int[] arr6 = {50, 30};
        Console.WriteLine("\nTwo elements: ");
        DisplayArray(arr6);
        HeapSortMethod(arr6);
        Console.WriteLine("After Heap Sort: ");
        DisplayArray(arr6);
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time Complexity: O(n log n) - Linearithmic");
        Console.WriteLine("Space Complexity: O(1) - In-place");
        Console.WriteLine("Best Case: O(n log n)");
        Console.WriteLine("Worst Case: O(n log n)");
        Console.WriteLine("Average Case: O(n log n)");
        Console.WriteLine("Stable: No (not stable)");
        Console.WriteLine("Note: In-place, guaranteed O(n log n), good for large datasets");
    }
}
