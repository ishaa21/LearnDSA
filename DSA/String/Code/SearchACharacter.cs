using System;
using System.Linq;

// Search a Character in a String in C#
// Find position and count of a character

class SearchACharacter {
    static void Main() {
        string str = "Hello World";
        char target = 'l';
        
        // Method 1: Using IndexOf() - finds first occurrence
        Console.WriteLine("Using IndexOf():");
        int pos = str.IndexOf(target);
        if (pos != -1) {
            Console.WriteLine("Character '" + target + "' found at index: " + pos);
        } else {
            Console.WriteLine("Character '" + target + "' not found");
        }
        
        // Method 2: Using LastIndexOf() - finds last occurrence
        Console.WriteLine("\nUsing LastIndexOf():");
        int lastPos = str.LastIndexOf(target);
        if (lastPos != -1) {
            Console.WriteLine("Last occurrence of '" + target + "' at index: " + lastPos);
        }
        
        // Method 3: Manual search with loop
        Console.WriteLine("\nManual search - all occurrences:");
        int count = 0;
        for (int i = 0; i < str.Length; i++) {
            if (str[i] == target) {
                Console.WriteLine("Found at index: " + i);
                count++;
            }
        }
        Console.WriteLine("Total occurrences: " + count);
        
        // Method 4: Finding all occurrences using loop
        Console.WriteLine("\nSearching from position 5:");
        int index = str.IndexOf(target, 5);
        while (index != -1) {
            Console.WriteLine("Found at index: " + index);
            index = str.IndexOf(target, index + 1);
        }
        
        // Method 5: Using LINQ Count
        Console.WriteLine("\nUsing LINQ Count():");
        int total = str.Count(c => c == target);
        Console.WriteLine("Total count of '" + target + "': " + total);
        
        // Method 6: Case-insensitive search
        Console.WriteLine("\nCase-insensitive search for 'W':");
        string lowerStr = str.ToLower();
        char lowerTarget = char.ToLower('W');
        int caseCount = lowerStr.Count(c => c == lowerTarget);
        Console.WriteLine("Case-insensitive count: " + caseCount);
        
        // Method 7: Finding all indices using LINQ
        Console.WriteLine("\nAll indices using LINQ:");
        var indices = str.Select((c, i) => new { Char = c, Index = i })
                          .Where(x => x.Char == target)
                          .Select(x => x.Index);
        Console.WriteLine("Indices: " + string.Join(", ", indices));
    }
}
