using System;

// Check for Same (String Comparison) in C#
// Different methods to compare two strings

class CheckForSame {
    static void Main() {
        string str1 = "Hello";
        string str2 = "Hello";
        string str3 = "hello";
        string str4 = "World";
        
        // Method 1: Using == operator
        Console.WriteLine("Using == operator:");
        Console.WriteLine("str1 == str2: " + (str1 == str2));  // true
        Console.WriteLine("str1 == str3: " + (str1 == str3));  // false
        Console.WriteLine("str1 == str4: " + (str1 == str4));  // false
        
        // Method 2: Using Equals() method
        Console.WriteLine("\nUsing Equals() method:");
        Console.WriteLine("str1.Equals(str2): " + str1.Equals(str2));  // true
        Console.WriteLine("str1.Equals(str3): " + str1.Equals(str3));  // false
        
        // Method 3: Case-insensitive comparison
        Console.WriteLine("\nCase-insensitive comparison:");
        Console.WriteLine("str1.Equals(str3, StringComparison.OrdinalIgnoreCase): " + 
            str1.Equals(str3, StringComparison.OrdinalIgnoreCase));  // true
        
        // Method 4: Using String.Compare() method
        Console.WriteLine("\nUsing String.Compare():");
        Console.WriteLine("String.Compare(str1, str2): " + String.Compare(str1, str2));  // 0 = equal
        Console.WriteLine("String.Compare(str1, str3): " + String.Compare(str1, str3));  // > 0
        
        // Method 5: Case-insensitive with String.Compare()
        Console.WriteLine("\nCase-insensitive String.Compare():");
        Console.WriteLine("String.Compare(str1, str3, true): " + 
            String.Compare(str1, str3, true));  // 0
        
        // Method 6: Comparing substrings
        Console.WriteLine("\nComparing substrings:");
        string str5 = "Helloworld";
        string str6 = "Hellouni";
        Console.WriteLine("First 5 chars equal: " + 
            str5.Substring(0, 5).Equals(str6.Substring(0, 5)));
        
        // Method 7: Using CompareTo()
        Console.WriteLine("\nUsing CompareTo():");
        Console.WriteLine("str1.CompareTo(str2): " + str1.CompareTo(str2));
        Console.WriteLine("str1.CompareTo(str3): " + str1.CompareTo(str3));
    }
}
