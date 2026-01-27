// Hash Table in C#

using System;
using System.Collections.Generic;

class Entry {
    public string key;
    public int value;
    public bool used;
}

class HashTable {
    private Entry[] entries;
    private int tableSize;
    
    public HashTable(int size) {
        tableSize = size;
        entries = new Entry[size];
        for (int i = 0; i < size; i++) {
            entries[i] = new Entry();
            entries[i].used = false;
        }
    }
    
    private int HashFunction(string key) {
        int hash = 0;
        foreach (char c in key) {
            hash += c;
        }
        return hash % tableSize;
    }
    
    void Insert(string key, int value) {
        int index = HashFunction(key);
        int originalIndex = index;
        
        while (entries[index].used) {
            if (entries[index].key == key) {
                entries[index].value = value;
                Console.WriteLine("Updated: " + key + " -> " + value + " (index " + index + ")");
                return;
            }
            index = (index + 1) % tableSize;
            if (index == originalIndex) {
                Console.WriteLine("Hash Table is full");
                return;
            }
        }
        
        entries[index].key = key;
        entries[index].value = value;
        entries[index].used = true;
        Console.WriteLine("Inserted: " + key + " -> " + value + " (index " + index + ")");
    }
    
    int Search(string key) {
        int index = HashFunction(key);
        int originalIndex = index;
        
        while (entries[index].used) {
            if (entries[index].key == key) {
                Console.WriteLine("Found: " + key + " -> " + entries[index].value + " (index " + index + ")");
                return entries[index].value;
            }
            index = (index + 1) % tableSize;
            if (index == originalIndex) break;
        }
        
        Console.WriteLine("Not found: " + key);
        return -1;
    }
    
    void Remove(string key) {
        int index = HashFunction(key);
        int originalIndex = index;
        
        while (entries[index].used) {
            if (entries[index].key == key) {
                entries[index].used = false;
                Console.WriteLine("Deleted: " + key + " (was at index " + index + ")");
                return;
            }
            index = (index + 1) % tableSize;
            if (index == originalIndex) break;
        }
        
        Console.WriteLine("Key not found: " + key);
    }
    
    void Display() {
        Console.WriteLine("\nHash Table Contents:");
        for (int i = 0; i < tableSize; i++) {
            if (entries[i].used) {
                Console.WriteLine("Index " + i + ": " + entries[i].key + " -> " + entries[i].value);
            }
        }
    }
    
    static void Main() {
        HashTable ht = new HashTable(100);
        
        Console.WriteLine("=== Hash Table ===\n");
        
        Console.WriteLine("Inserting elements:");
        ht.Insert("apple", 5);
        ht.Insert("banana", 3);
        ht.Insert("orange", 7);
        ht.Insert("grape", 4);
        
        ht.Display();
        
        Console.WriteLine("\nSearching elements:");
        ht.Search("banana");
        ht.Search("mango");
        
        Console.WriteLine("\nDeleting elements:");
        ht.Remove("banana");
        
        ht.Display();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Insert: O(1) average, O(n) worst case");
        Console.WriteLine("Search: O(1) average, O(n) worst case");
        Console.WriteLine("Delete: O(1) average, O(n) worst case");
        Console.WriteLine("Collision Handling: Linear Probing");
    }
}
