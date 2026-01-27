using System;

// Searching in Arrays in C#
// Linear Search and Binary Search implementations

class SearchingInArrays {
    
    // Linear Search
    static int LinearSearch(int[] arr, int target) {
        for (int i = 0; i < arr.Length; i++) {
            if (arr[i] == target)
                return i;
        }
        return -1;
    }
    
    // Binary Search
    static int BinarySearch(int[] arr, int target) {
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
    
    static void Main() {
        int[] arr = {10, 20, 30, 40, 50, 60, 70};
        int target = 40;
        
        // Linear Search
        Console.Write("Linear Search for " + target + ": ");
        int pos = LinearSearch(arr, target);
        if (pos != -1)
            Console.WriteLine("Found at index " + pos);
        else
            Console.WriteLine("Not found");
        
        // Linear Search for non-existing element
        target = 25;
        Console.Write("Linear Search for " + target + ": ");
        pos = LinearSearch(arr, target);
        if (pos != -1)
            Console.WriteLine("Found at index " + pos);
        else
            Console.WriteLine("Not found");
        
        // Binary Search
        target = 50;
        Console.Write("Binary Search for " + target + ": ");
        pos = BinarySearch(arr, target);
        if (pos != -1)
            Console.WriteLine("Found at index " + pos);
        else
            Console.WriteLine("Not found");
        
        // Using C#'s built-in method
        target = 30;
        Console.Write("Using Array.BinarySearch for " + target + ": ");
        pos = Array.BinarySearch(arr, target);
        if (pos >= 0)
            Console.WriteLine("Found at index " + pos);
        else
            Console.WriteLine("Not found");
    }
}
