using System;

// Array Traversal in C#
// Accessing and processing each element of an array

class ArrayTraversal {
    static void Main() {
        int[] arr = {10, 20, 30, 40, 50};
        
        // Method 1: Forward traversal using for loop
        Console.WriteLine("Forward traversal:");
        for (int i = 0; i < arr.Length; i++) {
            Console.WriteLine("arr[" + i + "] = " + arr[i]);
        }
        
        // Method 2: Backward traversal
        Console.WriteLine("\nBackward traversal:");
        for (int i = arr.Length - 1; i >= 0; i--) {
            Console.WriteLine("arr[" + i + "] = " + arr[i]);
        }
        
        // Method 3: foreach loop
        Console.WriteLine("\nforeach loop:");
        foreach (int val in arr) {
            Console.WriteLine("Value: " + val);
        }
        
        // Method 4: While loop
        Console.WriteLine("\nWhile loop traversal:");
        int j = 0;
        while (j < arr.Length) {
            Console.WriteLine("Value: " + arr[j]);
            j++;
        }
        
        // Method 5: Calculate sum
        int sum = 0;
        foreach (int val in arr) {
            sum += val;
        }
        Console.WriteLine("\nSum of all elements: " + sum);
        
        // Method 6: Find maximum
        int max = arr[0];
        foreach (int val in arr) {
            if (val > max) max = val;
        }
        Console.WriteLine("Maximum element: " + max);
    }
}
