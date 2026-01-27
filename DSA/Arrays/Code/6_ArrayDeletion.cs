using System;
using System.Collections.Generic;

// Array Deletion in C#
// Remove an element from a specific position

class ArrayDeletion {
    
    static void DeleteElement(int[] arr, int n, int position) {
        // Shift elements to the left
        for (int i = position; i < n - 1; i++) {
            arr[i] = arr[i + 1];
        }
    }
    
    static void DisplayArray(int[] arr, int n) {
        for (int i = 0; i < n; i++) {
            Console.Write(arr[i] + " ");
        }
        Console.WriteLine();
    }
    
    static void Main() {
        // Method 1: Using array
        int[] arr = {10, 20, 30, 40, 50};
        int n = 5;
        
        Console.Write("Original array: ");
        DisplayArray(arr, n);
        
        // Delete from beginning
        DeleteElement(arr, n, 0);
        n--;
        Console.Write("After deleting first element: ");
        DisplayArray(arr, n);
        
        // Method 2: Using List<T>
        List<int> list = new List<int>();
        list.Add(10);
        list.Add(20);
        list.Add(30);
        list.Add(40);
        list.Add(50);
        
        Console.WriteLine("Original List: " + string.Join(" ", list));
        
        // Delete at position
        list.RemoveAt(0);
        Console.WriteLine("After removing element at position 0: " + string.Join(" ", list));
        
        // Delete by value
        list.Remove(30);
        Console.WriteLine("After removing value 30: " + string.Join(" ", list));
        
        // Delete from end
        list.RemoveAt(list.Count - 1);
        Console.WriteLine("After removing last element: " + string.Join(" ", list));
    }
}
