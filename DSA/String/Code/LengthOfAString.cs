using System;

// Length of a String in C#
// Different methods to find the length of a string

class LengthOfAString {
    static void Main() {
        string str = "Hello World";
        
        // Method 1: Using Length property
        int len1 = str.Length;
        Console.WriteLine("Using Length property: " + len1);
        
        // Method 2: Manual counting with loop
        int len2 = 0;
        foreach (char c in str) {
            len2++;
        }
        Console.WriteLine("Using foreach loop: " + len2);
        
        // Method 3: Using LINQ Count
        int len3 = str.Count();
        Console.WriteLine("Using LINQ Count: " + len3);
        
        // Method 4: Using ToCharArray length
        int len4 = str.ToCharArray().Length;
        Console.WriteLine("Using ToCharArray length: " + len4);
        
        // Method 5: Empty string length
        Console.WriteLine("Empty string length: " + "".Length);
        
        // Method 6: Single character length
        Console.WriteLine("Single character length: " + "A".Length);
        
        // Method 7: String with spaces
        string spacedStr = "Hello   World";
        Console.WriteLine("String with spaces length: " + spacedStr.Length);
        
        // Method 8: Comparing string lengths
        string str1 = "CSharp";
        string str2 = "Programming";
        Console.WriteLine("Length of '" + str1 + "': " + str1.Length);
        Console.WriteLine("Length of '" + str2 + "': " + str2.Length);
    }
}
