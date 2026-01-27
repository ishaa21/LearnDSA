using System;
using System.Linq;
using System.Text;

// Reverse a String in C#
// Different methods to reverse a string

class ReverseAString {
    // Method 1: Using StringBuilder
    static string ReverseStringBuilder(string str) {
        StringBuilder sb = new StringBuilder(str);
        sb.Length = str.Length;
        char[] chars = str.ToCharArray();
        System.Array.Reverse(chars);
        return new string(chars);
    }
    
    // Method 2: Using loop
    static string ReverseLoop(string str) {
        string result = "";
        for (int i = str.Length - 1; i >= 0; i--) {
            result += str[i];
        }
        return result;
    }
    
    // Method 3: Using char array and Array.Reverse()
    static string ReverseCharArray(string str) {
        char[] chars = str.ToCharArray();
        System.Array.Reverse(chars);
        return new string(chars);
    }
    
    // Method 4: Using recursion
    static string ReverseRecursion(string str) {
        if (str.Length == 0)
            return str;
        else
            return ReverseRecursion(str.Substring(1)) + str[0];
    }
    
    static void Main() {
        string str = "Hello World";
        
        // Method 1: Using Array.Reverse (recommended)
        Console.WriteLine("Method 1: Using Array.Reverse");
        Console.WriteLine("Original: " + str);
        Console.WriteLine("Reversed: " + ReverseCharArray(str));
        
        // Method 2: Using loop
        Console.WriteLine("\nMethod 2: Using loop");
        string str2 = "Programming";
        Console.WriteLine("Original: " + str2);
        Console.WriteLine("Reversed: " + ReverseLoop(str2));
        
        // Method 3: Using LINQ Reverse
        Console.WriteLine("\nMethod 3: Using LINQ");
        string str3 = "CSharp";
        string reversed = new string(str3.Reverse().ToArray());
        Console.WriteLine("Original: " + str3);
        Console.WriteLine("Reversed: " + reversed);
        
        // Method 4: Using recursion
        Console.WriteLine("\nMethod 4: Using recursion");
        string str4 = "Recursion";
        Console.WriteLine("Original: " + str4);
        Console.WriteLine("Reversed: " + ReverseRecursion(str4));
        
        // Method 5: Using ToCharArray and loop
        Console.WriteLine("\nMethod 5: Using ToCharArray");
        string str5 = "Array";
        char[] chars = str5.ToCharArray();
        for (int i = chars.Length - 1; i >= 0; i--) {
            Console.Write(chars[i]);
        }
        Console.WriteLine();
    }
}
