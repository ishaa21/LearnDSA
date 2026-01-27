using System;

// Array Declaration & Initialization in C#
// Different ways to declare and initialize arrays

class ArrayDeclarationInitialization {
    static void Main() {
        // Method 1: Array with initialization
        int[] arr1 = {1, 2, 3, 4, 5};
        
        // Method 2: Array declaration with size
        int[] arr2 = new int[5];
        
        // Method 3: Initialize after declaration
        int[] arr3 = new int[3];
        arr3[0] = 10;
        arr3[1] = 20;
        arr3[2] = 30;
        
        // Method 4: String array
        string[] arr4 = {"C#", "Java", "Python", "C++"};
        
        // Method 5: Implicitly typed array
        var arr5 = new[] {5, 10, 15, 20, 25};
        
        // Method 6: 2D array
        int[,] arr6 = new int[3, 3];
        
        // Method 7: 2D array with initialization
        int[,] arr7 = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
        
        Console.Write("arr1: ");
        foreach (int val in arr1) Console.Write(val + " ");
        Console.WriteLine();
        
        Console.Write("arr3 (manual init): ");
        foreach (int val in arr3) Console.Write(val + " ");
        Console.WriteLine();
        
        Console.Write("arr4 (String array): ");
        foreach (string val in arr4) Console.Write(val + " ");
        Console.WriteLine();
        
        Console.Write("arr5 (implicitly typed): ");
        foreach (int val in arr5) Console.Write(val + " ");
        Console.WriteLine();
    }
}
