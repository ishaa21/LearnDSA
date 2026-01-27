using System;
using System.Collections.Generic;

// Array Insertion in C#
// Insert an element at a specific position

class ArrayInsertion {
    
    // Function to insert element in array
    static void InsertElement(int[] arr, int n, int position, int value) {
        // Shift elements to the right
        for (int i = n - 1; i >= position; i--) {
            arr[i + 1] = arr[i];
        }
        // Insert new element
        arr[position] = value;
    }
    
    static void DisplayArray(int[] arr, int n) {
        for (int i = 0; i < n; i++) {
            Console.Write(arr[i] + " ");
        }
        Console.WriteLine();
    }
    
    static void Main() {
        // Method 1: Using array (fixed size)
        int[] arr = new int[10];
        int n = 5;
        arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 40; arr[4] = 50;
        
        Console.Write("Original array: ");
        DisplayArray(arr, n);
        
        // Insert at beginning
        InsertElement(arr, n, 0, 5);
        n++;
        Console.Write("After inserting 5 at beginning: ");
        DisplayArray(arr, n);
        
        // Method 2: Using List<T> (dynamic size)
        List<int> list = new List<int>();
        list.Add(10);
        list.Add(20);
        list.Add(30);
        list.Add(40);
        list.Add(50);
        
        Console.WriteLine("Original List: " + string.Join(" ", list));
        
        // Insert at position
        list.Insert(2, 25);
        Console.WriteLine("After inserting 25 at position 2: " + string.Join(" ", list));
        
        // Insert at beginning
        list.Insert(0, 5);
        Console.WriteLine("After inserting 5 at beginning: " + string.Join(" ", list));
    }
}
