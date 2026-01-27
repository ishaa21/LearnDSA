using System;

// Array Update in C#
// Modify/Update elements at specific positions

class ArrayUpdate {
    
    static void UpdateElement(int[] arr, int position, int newValue) {
        arr[position] = newValue;
    }
    
    static void DisplayArray(int[] arr) {
        foreach (int val in arr) {
            Console.Write(val + " ");
        }
        Console.WriteLine();
    }
    
    static void Main() {
        int[] arr = {10, 20, 30, 40, 50};
        
        Console.Write("Original array: ");
        DisplayArray(arr);
        
        // Method 1: Direct update
        arr[0] = 15;
        Console.Write("After updating index 0 to 15: ");
        DisplayArray(arr);
        
        // Method 2: Using function
        UpdateElement(arr, 2, 35);
        Console.Write("After updating index 2 to 35: ");
        DisplayArray(arr);
        
        // Method 3: Conditional update
        arr = new int[]{10, 20, 30, 40, 50};
        for (int i = 0; i < arr.Length; i++) {
            if (arr[i] > 20) {
                arr[i] *= 2;
            }
        }
        Console.Write("After doubling elements > 20: ");
        DisplayArray(arr);
        
        // Method 4: Update all elements
        arr = new int[]{10, 20, 30, 40, 50};
        int addValue = 5;
        for (int i = 0; i < arr.Length; i++) {
            arr[i] += addValue;
        }
        Console.Write("After adding 5 to all elements: ");
        DisplayArray(arr);
        
        // Method 5: Update using LINQ
        arr = new int[]{10, 20, 30, 40, 50};
        Array.ForEach(arr, (v) => arr[Array.IndexOf(arr, v)] = v * 2);
        Console.Write("After doubling all elements: ");
        DisplayArray(arr);
    }
}
