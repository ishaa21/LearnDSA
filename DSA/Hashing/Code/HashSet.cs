// HashSet in C#

using System;
using System.Collections.Generic;

class HashSet {
    private const int TABLE_SIZE = 100;
    
    class SetEntry {
        public string Element { get; set; }
        public bool Used { get; set; }
        
        public SetEntry() {
            Used = false;
        }
    }
    
    private SetEntry[] entries = new SetEntry[TABLE_SIZE];
    private int sz = 0;
    
    public HashSet() {
        for (int i = 0; i < TABLE_SIZE; i++) {
            entries[i] = new SetEntry();
        }
    }
    
    private int HashFunction(string element) {
        int hash = 0;
        foreach (char c in element) {
            hash += c;
        }
        return hash % TABLE_SIZE;
    }
    
    public void Add(string element) {
        int index = HashFunction(element);
        
        while (entries[index].Used) {
            if (entries[index].Element == element) {
                return; // Element already exists
            }
            index = (index + 1) % TABLE_SIZE;
        }
        
        entries[index].Element = element;
        entries[index].Used = true;
        sz++;
    }
    
    public bool Contains(string element) {
        int index = HashFunction(element);
        
        while (entries[index].Used) {
            if (entries[index].Element == element) {
                return true;
            }
            index = (index + 1) % TABLE_SIZE;
        }
        return false;
    }
    
    public void Remove(string element) {
        int index = HashFunction(element);
        
        while (entries[index].Used) {
            if (entries[index].Element == element) {
                entries[index].Used = false;
                sz--;
                return;
            }
            index = (index + 1) % TABLE_SIZE;
        }
    }
    
    public int Size() {
        return sz;
    }
    
    public void PrintSet() {
        Console.Write("Set contents: { ");
        for (int i = 0; i < TABLE_SIZE; i++) {
            if (entries[i].Used) {
                Console.Write(entries[i].Element + " ");
            }
        }
        Console.WriteLine("}");
    }
    
    public HashSet Intersection(HashSet other) {
        HashSet result = new HashSet();
        for (int i = 0; i < TABLE_SIZE; i++) {
            if (this.entries[i].Used) {
                if (other.Contains(this.entries[i].Element)) {
                    result.Add(this.entries[i].Element);
                }
            }
        }
        return result;
    }
    
    public HashSet UnionSet(HashSet other) {
        HashSet result = new HashSet();
        for (int i = 0; i < TABLE_SIZE; i++) {
            if (this.entries[i].Used) {
                result.Add(this.entries[i].Element);
            }
        }
        for (int i = 0; i < TABLE_SIZE; i++) {
            if (other.entries[i].Used) {
                result.Add(other.entries[i].Element);
            }
        }
        return result;
    }
    
    static void Main() {
        Console.WriteLine("=== HashSet (C#) ===\n");
        
        HashSet set1 = new HashSet();
        HashSet set2 = new HashSet();
        
        // Add elements to set1
        Console.WriteLine("Adding elements to Set1...");
        set1.Add("apple");
        set1.Add("banana");
        set1.Add("orange");
        set1.Add("grape");
        Console.WriteLine("Set1 size: " + set1.Size());
        set1.PrintSet();
        Console.WriteLine();
        
        // Add elements to set2
        Console.WriteLine("Adding elements to Set2...");
        set2.Add("banana");
        set2.Add("grape");
        set2.Add("mango");
        set2.Add("pear");
        Console.WriteLine("Set2 size: " + set2.Size());
        set2.PrintSet();
        Console.WriteLine();
        
        // Contains operation
        Console.WriteLine("Checking elements...");
        Console.WriteLine("Set1 contains 'apple': " + set1.Contains("apple"));
        Console.WriteLine("Set1 contains 'mango': " + set1.Contains("mango") + "\n");
        
        // Union
        Console.WriteLine("Union of Set1 and Set2:");
        HashSet unionResult = set1.UnionSet(set2);
        Console.WriteLine("Union size: " + unionResult.Size());
        unionResult.PrintSet();
        Console.WriteLine();
        
        // Intersection
        Console.WriteLine("Intersection of Set1 and Set2:");
        HashSet intersectResult = set1.Intersection(set2);
        Console.WriteLine("Intersection size: " + intersectResult.Size());
        intersectResult.PrintSet();
        Console.WriteLine();
        
        // Remove operation
        Console.WriteLine("Removing 'banana' from Set1...");
        set1.Remove("banana");
        Console.WriteLine("Set1 size: " + set1.Size());
        Console.WriteLine("Set1 contains 'banana': " + set1.Contains("banana") + "\n");
        
        Console.WriteLine("=== HashSet Operations Complexity ===");
        Console.WriteLine("Add(element):       O(1) average, O(n) worst");
        Console.WriteLine("Contains(element):  O(1) average, O(n) worst");
        Console.WriteLine("Remove(element):    O(1) average, O(n) worst");
        Console.WriteLine("UnionSet():         O(m + n) where m, n = set sizes");
        Console.WriteLine("Intersection():     O(m + n) where m, n = set sizes");
        Console.WriteLine("Space Complexity:   O(n) where n = number of elements");
    }
}
