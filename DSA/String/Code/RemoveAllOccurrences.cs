using System;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

// Remove All Occurrences of a Character in C#
// Remove all instances of a specific character

class RemoveAllOccurrences {
    static string RemoveAllChar(string str, char target) {
        StringBuilder result = new StringBuilder();
        foreach (char c in str) {
            if (c != target) {
                result.Append(c);
            }
        }
        return result.ToString();
    }
    
    static void Main() {
        string str = "Hello World";
        
        Console.WriteLine("Original string: " + str);
        
        // Method 1: Using Replace()
        Console.WriteLine("\nUsing Replace():");
        string result1 = str.Replace("l", "");
        Console.WriteLine("After removing all 'l': " + result1);
        
        string result2 = str.Replace("o", "");
        Console.WriteLine("After removing all 'o': " + result2);
        
        string result3 = str.Replace(" ", "");
        Console.WriteLine("After removing all spaces: " + result3);
        
        // Method 2: Using Regex
        Console.WriteLine("\nUsing Regex:");
        string result4 = Regex.Replace(str, "l", "");
        Console.WriteLine("After removing all 'l': " + result4);
        
        // Method 3: Using custom function
        Console.WriteLine("\nUsing custom function:");
        string result5 = RemoveAllChar(str, 'l');
        Console.WriteLine("After removing all 'l': " + result5);
        
        // Method 4: Using StringBuilder
        Console.WriteLine("\nUsing StringBuilder:");
        StringBuilder sb = new StringBuilder(str);
        for (int i = sb.Length - 1; i >= 0; i--) {
            if (sb[i] == 'l') {
                sb.Remove(i, 1);
            }
        }
        Console.WriteLine("After removing all 'l': " + sb.ToString());
        
        // Method 5: Using LINQ
        Console.WriteLine("\nUsing LINQ:");
        string result6 = new string(str.Where(c => c != 'l').ToArray());
        Console.WriteLine("After removing all 'l': " + result6);
        
        // Method 6: Manual approach
        Console.WriteLine("\nManual approach:");
        string original = "Programming Language";
        char target = 'a';
        string result7 = RemoveAllChar(original, target);
        Console.WriteLine("Original: " + original);
        Console.WriteLine("After removing all '" + target + "': " + result7);
    }
}
