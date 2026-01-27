using System;
using System.Linq;

// Binary Search in C#
// Search for an element in a sorted array by dividing search space in half

class BinarySearch {
    
    static int BinarySearchMethod(int[] arr, int target) {
        int left = 0, right = arr.Length - 1;
        
        while (left <= right) {
            int mid = left + (right - left) / 2;
            
            if (arr[mid] == target)
                return mid;
            else if (arr[mid] < target)
                left = mid + 1;
            else
                right = mid - 1;
        }
        return -1;
    }
    
    static int BinarySearchRecursive(int[] arr, int left, int right, int target) {
        if (left > right)
            return -1;
        
        int mid = left + (right - left) / 2;
        
        if (arr[mid] == target)
            return mid;
        else if (arr[mid] < target)
            return BinarySearchRecursive(arr, mid + 1, right, target);
        else
            return BinarySearchRecursive(arr, left, mid - 1, target);
    }
    
    static int BinarySearchFirstOccurrence(int[] arr, int target) {
        int left = 0, right = arr.Length - 1;
        int result = -1;
        
        while (left <= right) {
            int mid = left + (right - left) / 2;
            
            if (arr[mid] == target) {
                result = mid;
                right = mid - 1;
            } else if (arr[mid] < target)
                left = mid + 1;
            else
                right = mid - 1;
        }
        return result;
    }
    
    static int BinarySearchLastOccurrence(int[] arr, int target) {
        int left = 0, right = arr.Length - 1;
        int result = -1;
        
        while (left <= right) {
            int mid = left + (right - left) / 2;
            
            if (arr[mid] == target) {
                result = mid;
                left = mid + 1;
            } else if (arr[mid] < target)
                left = mid + 1;
            else
                right = mid - 1;
        }
        return result;
    }
    
    static void DisplayArray(int[] arr) {
        Console.Write("Sorted Array: ");
        foreach (int num in arr)
            Console.Write(num + " ");
        Console.WriteLine();
    }
    
    static void Main() {
        // IMPORTANT: Array must be sorted for binary search
        int[] arr = {11, 12, 22, 25, 34, 64, 90};
        
        DisplayArray(arr);
        
        // Test 1: Search for element in middle
        int target = 25;
        Console.WriteLine("\nSearching for " + target + " (Iterative): ");
        int result = BinarySearchMethod(arr, target);
        if (result != -1)
            Console.WriteLine("Found at index " + result);
        else
            Console.WriteLine("Not found");
        
        // Test 2: Search using recursive approach
        Console.WriteLine("Searching for " + target + " (Recursive): ");
        result = BinarySearchRecursive(arr, 0, arr.Length - 1, target);
        if (result != -1)
            Console.WriteLine("Found at index " + result);
        else
            Console.WriteLine("Not found");
        
        // Test 3: Search for first element
        target = 11;
        Console.WriteLine("Searching for " + target + ": ");
        result = BinarySearchMethod(arr, target);
        if (result != -1)
            Console.WriteLine("Found at index " + result);
        else
            Console.WriteLine("Not found");
        
        // Test 4: Search for last element
        target = 90;
        Console.WriteLine("Searching for " + target + ": ");
        result = BinarySearchMethod(arr, target);
        if (result != -1)
            Console.WriteLine("Found at index " + result);
        else
            Console.WriteLine("Not found");
        
        // Test 5: Search for non-existing element
        target = 50;
        Console.WriteLine("Searching for " + target + ": ");
        result = BinarySearchMethod(arr, target);
        if (result != -1)
            Console.WriteLine("Found at index " + result);
        else
            Console.WriteLine("Not found");
        
        // Test 6: Using Array.BinarySearch()
        Console.WriteLine("\nUsing Array.BinarySearch():");
        target = 34;
        int index = Array.BinarySearch(arr, target);
        Console.WriteLine("Array.BinarySearch for " + target + ": " 
                         + (index >= 0 ? "Index " + index : "Not found"));
        
        // Test 7: First and last occurrences
        int[] arr2 = {11, 12, 12, 12, 22, 25, 34};
        Console.WriteLine("\nArray with duplicates: " + string.Join(" ", arr2));
        target = 12;
        Console.WriteLine("First occurrence of " + target + ": " 
                         + BinarySearchFirstOccurrence(arr2, target));
        Console.WriteLine("Last occurrence of " + target + ": " 
                         + BinarySearchLastOccurrence(arr2, target));
        
        // Test 8: Using LINQ
        Console.WriteLine("\nUsing LINQ:");
        target = 25;
        bool found = arr.Contains(target);
        Console.WriteLine("Contains " + target + ": " + found);
        var index2 = Array.FindIndex(arr, x => x == target);
        Console.WriteLine("FindIndex for " + target + ": " + (index2 >= 0 ? "Index " + index2 : "Not found"));
        
        // Complexity Analysis
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time Complexity: O(log n) - Logarithmic");
        Console.WriteLine("Space Complexity: O(1) - Iterative, O(log n) - Recursive");
        Console.WriteLine("Best Case: O(1)");
        Console.WriteLine("Worst Case: O(log n)");
        Console.WriteLine("\nNote: Requires sorted array!");
    }
}
