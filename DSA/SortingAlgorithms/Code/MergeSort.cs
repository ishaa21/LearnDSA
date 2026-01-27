using System;
using System.Linq;

// Merge Sort in C#
// Divide and conquer algorithm - divide array in half, sort, and merge

class MergeSort {
    
    static void Merge(int[] arr, int left, int mid, int right) {
        int n1 = mid - left + 1;
        int n2 = right - mid;
        
        int[] leftArr = new int[n1];
        int[] rightArr = new int[n2];
        
        for (int i = 0; i < n1; i++)
            leftArr[i] = arr[left + i];
        for (int i = 0; i < n2; i++)
            rightArr[i] = arr[mid + 1 + i];
        
        int p = 0, q = 0, k = left;
        
        while (p < n1 && q < n2) {
            if (leftArr[p] <= rightArr[q]) {
                arr[k++] = leftArr[p++];
            } else {
                arr[k++] = rightArr[q++];
            }
        }
        
        while (p < n1)
            arr[k++] = leftArr[p++];
        
        while (q < n2)
            arr[k++] = rightArr[q++];
    }
    
    static void MergeSortMethod(int[] arr, int left, int right) {
        if (left < right) {
            int mid = left + (right - left) / 2;
            
            MergeSortMethod(arr, left, mid);
            MergeSortMethod(arr, mid + 1, right);
            Merge(arr, left, mid, right);
        }
    }
    
    static void DisplayArray(int[] arr) {
        Console.WriteLine(string.Join(" ", arr));
    }
    
    static void Main() {
        // Test 1: Basic merge sort
        int[] arr = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("Original Array: ");
        DisplayArray(arr);
        
        MergeSortMethod(arr, 0, arr.Length - 1);
        Console.WriteLine("Sorted Array (Merge Sort): ");
        DisplayArray(arr);
        
        // Test 2: Already sorted
        int[] arr2 = {1, 2, 3, 4, 5};
        Console.WriteLine("\nAlready sorted: ");
        DisplayArray(arr2);
        MergeSortMethod(arr2, 0, arr2.Length - 1);
        Console.WriteLine("After Merge Sort: ");
        DisplayArray(arr2);
        
        // Test 3: Reverse sorted
        int[] arr3 = {5, 4, 3, 2, 1};
        Console.WriteLine("\nReverse sorted: ");
        DisplayArray(arr3);
        MergeSortMethod(arr3, 0, arr3.Length - 1);
        Console.WriteLine("After Merge Sort: ");
        DisplayArray(arr3);
        
        // Test 4: Duplicates
        int[] arr4 = {5, 2, 8, 2, 9, 1, 5, 5};
        Console.WriteLine("\nArray with duplicates: ");
        DisplayArray(arr4);
        MergeSortMethod(arr4, 0, arr4.Length - 1);
        Console.WriteLine("After Merge Sort: ");
        DisplayArray(arr4);
        
        // Test 5: Single element
        int[] arr5 = {42};
        Console.WriteLine("\nSingle element: ");
        DisplayArray(arr5);
        MergeSortMethod(arr5, 0, arr5.Length - 1);
        Console.WriteLine("After Merge Sort: ");
        DisplayArray(arr5);
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time Complexity: O(n log n) - Linearithmic");
        Console.WriteLine("Space Complexity: O(n) - Requires temporary arrays");
        Console.WriteLine("Best Case: O(n log n)");
        Console.WriteLine("Worst Case: O(n log n)");
        Console.WriteLine("Average Case: O(n log n)");
        Console.WriteLine("Stable: Yes");
        Console.WriteLine("Note: Divide and conquer approach, consistent performance");
    }
}
