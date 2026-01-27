using System;
using System.Linq;
using System.Text;

// Remove a Character from a String in C#
// Remove character at specific position or by value

class RemoveACharacter {
    static void Main() {
        string str = "Hello World";
        
        Console.WriteLine("Original string: " + str);
        
        // Method 1: Using Remove()
        Console.WriteLine("\nUsing Remove():");
        int pos = 0;
        string result1 = str.Remove(pos, 1);
        Console.WriteLine("After removing character at position 0: " + result1);
        
        // Method 2: Remove at position 5
        pos = 5;
        string result2 = str.Remove(pos, 1);
        Console.WriteLine("After removing character at position 5: " + result2);
        
        // Method 3: Remove last character
        string result3 = str.Remove(str.Length - 1);
        Console.WriteLine("After removing last character: " + result3);
        
        // Method 4: Remove all occurrences
        Console.WriteLine("\nRemoving all 'l':");
        string result4 = str.Replace("l", "");
        Console.WriteLine("Using Replace(): " + result4);
        
        // Method 5: Using StringBuilder
        Console.WriteLine("\nUsing StringBuilder:");
        StringBuilder sb = new StringBuilder(str);
        sb.Remove(0, 1);
        Console.WriteLine("After removing character at position 0: " + sb.ToString());
        
        // Method 6: Remove using StringBuilder loop
        StringBuilder sb2 = new StringBuilder(str);
        for (int i = sb2.Length - 1; i >= 0; i--) {
            if (sb2[i] == 'l') {
                sb2.Remove(i, 1);
            }
        }
        Console.WriteLine("After removing all 'l': " + sb2.ToString());
        
        // Method 7: Using LINQ
        Console.WriteLine("\nUsing LINQ:");
        string result5 = new string(str.Where(c => c != 'l').ToArray());
        Console.WriteLine("Using Where(): " + result5);
        
        // Method 8: Using Substring
        pos = 6;
        string result6 = str.Substring(0, pos) + str.Substring(pos + 1);
        Console.WriteLine("Using Substring: " + result6);
    }
}
