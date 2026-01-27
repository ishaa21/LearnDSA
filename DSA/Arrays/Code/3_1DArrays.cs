using System;
using System.Linq;

// 1D Arrays in C#
// Single dimensional arrays store elements linearly

class OneDArrays {
    static void Main() {
        // Declaration and initialization
        int[] arr = {10, 20, 30, 40, 50};
        
        // Accessing elements
        Console.WriteLine("Element at index 0: " + arr[0]);
        Console.WriteLine("Element at index 2: " + arr[2]);
        
        // Modifying elements
        arr[1] = 25;
        Console.WriteLine("Modified element at index 1: " + arr[1]);
        
        // Iterating and printing all elements
        Console.Write("All elements: ");
        for (int i = 0; i < arr.Length; i++) {
            Console.Write(arr[i] + " ");
        }
        Console.WriteLine();
        
        // Finding sum using LINQ
        int sum = arr.Sum();
        Console.WriteLine("Sum of all elements: " + sum);
        
        // Finding average
        double average = arr.Average();
        Console.WriteLine("Average: " + average);
    }
}
