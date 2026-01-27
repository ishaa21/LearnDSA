using System;
using System.Linq;

// Quick Sort in C#
// Divide and conquer algorithm using pivot element partitioning

class QuickSort {
    
    static int Partition(int[] arr, int low, int high) {
        int pivot = arr[high];
        int i = low - 1;
        
        for (int j = low; j < high; j++) {
            if (arr[j] < pivot) {
                i++;
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
        
        int temp2 = arr[i + 1];
        arr[i + 1] = arr[high];
        arr[high] = temp2;
        
        return i + 1;
    }
    
    static int PartitionRandom(int[] arr, int low, int high) {
        Random random = new Random();
        int randomIdx = low + random.Next(high - low + 1);
        
        int temp = arr[randomIdx];
        arr[randomIdx] = arr[high];
        arr[high] = temp;
        
        return Partition(arr, low, high);
    }
    
    static void QuickSortMethod(int[] arr, int low, int high) {
        if (low < high) {
            int pi = Partition(arr, low, high);
            
            QuickSortMethod(arr, low, pi - 1);
            QuickSortMethod(arr, pi + 1, high);
        }
    }
    
    static void QuickSortRandom(int[] arr, int low, int high) {
        if (low < high) {
            int pi = PartitionRandom(arr, low, high);
            
            QuickSortRandom(arr, low, pi - 1);
            QuickSortRandom(arr, pi + 1, high);
        }
    }
    
    static void DisplayArray(int[] arr) {
        Console.WriteLine(string.Join(" ", arr));
    }
    
    static void Main() {
        // Test 1: Basic quick sort
        int[] arr = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("Original Array: ");
        DisplayArray(arr);
        
        QuickSortMethod(arr, 0, arr.Length - 1);
        Console.WriteLine("Sorted Array (Quick Sort - Last as pivot): ");
        DisplayArray(arr);
        
        // Test 2: With random pivot
        int[] arr2 = {64, 34, 25, 12, 22, 11, 90};
        Console.WriteLine("\nSorting with random pivot:\n");
        QuickSortRandom(arr2, 0, arr2.Length - 1);
        DisplayArray(arr2);
        
        // Test 3: Already sorted
        int[] arr3 = {1, 2, 3, 4, 5};
        Console.WriteLine("\nAlready sorted: ");
        DisplayArray(arr3);
        QuickSortMethod(arr3, 0, arr3.Length - 1);
        Console.WriteLine("After Quick Sort: ");
        DisplayArray(arr3);
        
        // Test 4: Reverse sorted
        int[] arr4 = {5, 4, 3, 2, 1};
        Console.WriteLine("\nReverse sorted: ");
        DisplayArray(arr4);
        QuickSortMethod(arr4, 0, arr4.Length - 1);
        Console.WriteLine("After Quick Sort: ");
        DisplayArray(arr4);
        
        // Test 5: Duplicates
        int[] arr5 = {5, 2, 8, 2, 9, 1, 5, 5};
        Console.WriteLine("\nArray with duplicates: ");
        DisplayArray(arr5);
        QuickSortMethod(arr5, 0, arr5.Length - 1);
        Console.WriteLine("After Quick Sort: ");
        DisplayArray(arr5);
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time Complexity: O(n log n) - Average, O(n^2) - Worst");
        Console.WriteLine("Space Complexity: O(log n) - Due to recursion stack");
        Console.WriteLine("Best Case: O(n log n)");
        Console.WriteLine("Worst Case: O(n^2) - Already sorted or reverse sorted");
        Console.WriteLine("Average Case: O(n log n)");
        Console.WriteLine("Stable: No (not stable)");
        Console.WriteLine("Note: In-place sorting, efficient on large datasets");
    }
}
