using System;

// Introduction to Arrays in C#
// Arrays are fixed-size collections of elements of the same type

class IntroductionToArrays {
    static void Main() {
        // Array declaration and initialization
        int[] arr = {10, 20, 30, 40, 50};
        
        // Accessing elements
        Console.WriteLine("First element: " + arr[0]);
        Console.WriteLine("Last element: " + arr[arr.Length - 1]);
        
        // Iterating through array
        Console.Write("All elements: ");
        for (int i = 0; i < arr.Length; i++) {
            Console.Write(arr[i] + " ");
        }
        Console.WriteLine();
        
        // Array length
        Console.WriteLine("Array length: " + arr.Length);
    }
}
