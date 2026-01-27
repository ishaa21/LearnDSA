using System;
using System.Collections.Generic;

// Generate All Substrings in C#
// Print all possible substrings of a given string

class GenerateAllSubstrings {
    
    // Method 1: Print substrings directly
    static void GenerateSubstrings(string str) {
        int len = str.Length;
        int count = 0;
        
        Console.WriteLine("All substrings:");
        
        // Outer loop for starting position
        for (int i = 0; i < len; i++) {
            // Inner loop for ending position
            for (int j = i + 1; j <= len; j++) {
                // Extract and print substring
                Console.WriteLine(str.Substring(i, j - i));
                count++;
            }
        }
        Console.WriteLine("Total substrings: " + count);
    }
    
    // Method 2: Return substrings as list
    static List<string> GenerateSubstringsList(string str) {
        List<string> substrings = new List<string>();
        int len = str.Length;
        
        for (int i = 0; i < len; i++) {
            for (int j = i + 1; j <= len; j++) {
                substrings.Add(str.Substring(i, j - i));
            }
        }
        return substrings;
    }
    
    static void Main() {
        // Test 1
        string str1 = "ABC";
        Console.WriteLine("String: " + str1);
        Console.WriteLine("Length: " + str1.Length);
        Console.WriteLine();
        
        GenerateSubstrings(str1);
        
        // Test 2
        Console.WriteLine("\n\nString: HELLO");
        string str2 = "HELLO";
        
        List<string> substrings = GenerateSubstringsList(str2);
        Console.WriteLine("All substrings:");
        foreach (string sub in substrings) {
            Console.WriteLine(sub);
        }
        Console.WriteLine("Total substrings: " + substrings.Count);
        
        // Test 3: Substrings of specific length
        Console.WriteLine("\n\nSubstrings of length 2:");
        string str3 = "HELLO";
        Console.WriteLine("String: " + str3);
        for (int i = 0; i < str3.Length - 1; i++) {
            Console.WriteLine(str3.Substring(i, 2));
        }
        
        // Test 4: Using LINQ
        Console.WriteLine("\n\nUsing LINQ to get substrings:");
        string str4 = "ABC";
        var subList = new List<string>();
        for (int i = 0; i < str4.Length; i++) {
            for (int j = i + 1; j <= str4.Length; j++) {
                subList.Add(str4.Substring(i, j - i));
            }
        }
        Console.WriteLine("String: " + str4);
        foreach (string sub in subList) {
            Console.WriteLine(sub);
        }
    }
}
