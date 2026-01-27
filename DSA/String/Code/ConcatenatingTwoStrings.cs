using System;
using System.Text;

// Concatenating Two Strings in C#
// Join two strings together

class ConcatenatingTwoStrings {
    static void Main() {
        string str1 = "Hello";
        string str2 = "World";
        
        // Method 1: Using + operator
        Console.WriteLine("Method 1: Using + operator");
        string result1 = str1 + " " + str2;
        Console.WriteLine("Result: " + result1);
        
        // Method 2: Using String.Concat()
        Console.WriteLine("\nMethod 2: Using String.Concat()");
        string result2 = String.Concat(str1, " ", str2);
        Console.WriteLine("Result: " + result2);
        
        // Method 3: Using String.Format()
        Console.WriteLine("\nMethod 3: Using String.Format()");
        string result3 = String.Format("{0} {1}", str1, str2);
        Console.WriteLine("Result: " + result3);
        
        // Method 4: Using interpolation (C# 6+)
        Console.WriteLine("\nMethod 4: Using string interpolation");
        string result4 = $"{str1} {str2}";
        Console.WriteLine("Result: " + result4);
        
        // Method 5: Using StringBuilder
        Console.WriteLine("\nMethod 5: Using StringBuilder");
        StringBuilder sb = new StringBuilder();
        sb.Append(str1);
        sb.Append(" ");
        sb.Append(str2);
        string result5 = sb.ToString();
        Console.WriteLine("Result: " + result5);
        
        // Method 6: Using String.Join()
        Console.WriteLine("\nMethod 6: Using String.Join()");
        string result6 = String.Join(" ", str1, str2);
        Console.WriteLine("Result: " + result6);
        
        // Method 7: Multiple strings
        Console.WriteLine("\nMethod 7: Multiple strings");
        string str3 = "from";
        string str4 = "CSharp";
        string result7 = $"{str1} {str2} {str3} {str4}";
        Console.WriteLine("Result: " + result7);
        
        // Method 8: Using Join with array
        Console.WriteLine("\nMethod 8: Using Join with array");
        string[] words = { str1, str2, str3, str4 };
        string result8 = String.Join(" ", words);
        Console.WriteLine("Result: " + result8);
    }
}
