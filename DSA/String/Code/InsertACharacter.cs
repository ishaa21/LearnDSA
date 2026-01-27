using System;
using System.Text;

// Insert a Character in a String in C#
// Insert character at specific position

class InsertACharacter {
    static string InsertChar(string str, int position, char ch) {
        return str.Insert(position, ch.ToString());
    }
    
    static void Main() {
        string str = "Hello World";
        
        Console.WriteLine("Original string: " + str);
        
        // Method 1: Using Insert()
        Console.WriteLine("\nUsing Insert():");
        string result1 = str.Insert(0, "H");
        Console.WriteLine("After inserting 'H' at position 0: " + result1);
        
        // Method 2: Insert at position 5
        string result2 = str.Insert(5, "!");
        Console.WriteLine("After inserting '!' at position 5: " + result2);
        
        // Method 3: Insert at end
        string result3 = str.Insert(str.Length, "!");
        Console.WriteLine("After inserting '!' at end: " + result3);
        
        // Method 4: Using Substring
        Console.WriteLine("\nUsing Substring:");
        string result4 = str.Substring(0, 5) + "*" + str.Substring(5);
        Console.WriteLine("After inserting '*' at position 5: " + result4);
        
        // Method 5: Using StringBuilder
        Console.WriteLine("\nUsing StringBuilder:");
        StringBuilder sb = new StringBuilder(str);
        sb.Insert(0, '*');
        Console.WriteLine("After inserting '*' at position 0: " + sb.ToString());
        
        // Method 6: Multiple insertions
        StringBuilder sb2 = new StringBuilder(str);
        sb2.Insert(0, '*');
        sb2.Insert(sb2.Length, '*');
        Console.WriteLine("After inserting '*' at both ends: " + sb2.ToString());
        
        // Method 7: Using function
        Console.WriteLine("\nUsing function:");
        string result5 = InsertChar(str, 6, '@');
        Console.WriteLine("After inserting '@' at position 6: " + result5);
    }
}
