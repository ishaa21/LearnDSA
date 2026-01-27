using System;

// 2D Arrays in C#
// Two dimensional arrays are matrix-like structures

class TwoDArrays {
    static void Main() {
        // Declaration and initialization
        int[,] arr = {
            {1, 2, 3},
            {4, 5, 6},
            {7, 8, 9}
        };
        
        // Accessing elements
        Console.WriteLine("Element at [0,0]: " + arr[0, 0]);
        Console.WriteLine("Element at [1,2]: " + arr[1, 2]);
        Console.WriteLine("Element at [2,1]: " + arr[2, 1]);
        
        // Iterating through 2D array and printing
        Console.WriteLine("2D Array:");
        for (int i = 0; i < arr.GetLength(0); i++) {
            for (int j = 0; j < arr.GetLength(1); j++) {
                Console.Write(arr[i, j] + " ");
            }
            Console.WriteLine();
        }
        
        // Modifying element
        arr[1, 1] = 10;
        Console.WriteLine("After modification, arr[1,1] = " + arr[1, 1]);
        
        // Calculating sum of all elements
        int sum = 0;
        for (int i = 0; i < arr.GetLength(0); i++) {
            for (int j = 0; j < arr.GetLength(1); j++) {
                sum += arr[i, j];
            }
        }
        Console.WriteLine("Sum of all elements: " + sum);
    }
}
