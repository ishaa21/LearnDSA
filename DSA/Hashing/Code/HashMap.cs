// HashMap in C#

using System;
using System.Collections.Generic;

class HashMap {
    private const int TABLE_SIZE = 100;
    
    class MapEntry {
        public string Key { get; set; }
        public int Value { get; set; }
        public bool Used { get; set; }
        
        public MapEntry() {
            Used = false;
        }
    }
    
    private MapEntry[] entries = new MapEntry[TABLE_SIZE];
    
    public HashMap() {
        for (int i = 0; i < TABLE_SIZE; i++) {
            entries[i] = new MapEntry();
        }
    }
    
    private int HashFunction(string key) {
        int hash = 0;
        foreach (char c in key) {
            hash += c;
        }
        return hash % TABLE_SIZE;
    }
    
    public void Put(string key, int value) {
        int index = HashFunction(key);
        
        while (entries[index].Used) {
            if (entries[index].Key == key) {
                entries[index].Value = value;
                return;
            }
            index = (index + 1) % TABLE_SIZE;
        }
        
        entries[index].Key = key;
        entries[index].Value = value;
        entries[index].Used = true;
    }
    
    public int Get(string key) {
        int index = HashFunction(key);
        
        while (entries[index].Used) {
            if (entries[index].Key == key) {
                return entries[index].Value;
            }
            index = (index + 1) % TABLE_SIZE;
        }
        return -1;
    }
    
    public bool ContainsKey(string key) {
        int index = HashFunction(key);
        
        while (entries[index].Used) {
            if (entries[index].Key == key) {
                return true;
            }
            index = (index + 1) % TABLE_SIZE;
        }
        return false;
    }
    
    public void Remove(string key) {
        int index = HashFunction(key);
        
        while (entries[index].Used) {
            if (entries[index].Key == key) {
                entries[index].Used = false;
                return;
            }
            index = (index + 1) % TABLE_SIZE;
        }
    }
    
    static void Main() {
        HashMap map = new HashMap();
        
        Console.WriteLine("=== HashMap (C#) ===\n");
        
        // Put operations
        Console.WriteLine("Inserting key-value pairs...");
        map.Put("apple", 5);
        map.Put("banana", 3);
        map.Put("orange", 7);
        map.Put("grape", 4);
        Console.WriteLine("Inserted: apple->5, banana->3, orange->7, grape->4\n");
        
        // Get operations
        Console.WriteLine("Retrieving values...");
        Console.WriteLine("Get('apple') = " + map.Get("apple"));
        Console.WriteLine("Get('banana') = " + map.Get("banana"));
        Console.WriteLine("Get('grape') = " + map.Get("grape"));
        Console.WriteLine("Get('mango') = " + map.Get("mango") + " (not found)\n");
        
        // Contains key
        Console.WriteLine("Checking keys...");
        Console.WriteLine("ContainsKey('apple') = " + map.ContainsKey("apple"));
        Console.WriteLine("ContainsKey('mango') = " + map.ContainsKey("mango") + "\n");
        
        // Update value
        Console.WriteLine("Updating value...");
        map.Put("apple", 10);
        Console.WriteLine("Updated apple->10");
        Console.WriteLine("Get('apple') = " + map.Get("apple") + "\n");
        
        // Remove operation
        Console.WriteLine("Removing 'banana'...");
        map.Remove("banana");
        Console.WriteLine("Get('banana') = " + map.Get("banana") + " (removed)\n");
        
        Console.WriteLine("=== HashMap Operations Complexity ===");
        Console.WriteLine("Put(key, value):    O(1) average, O(n) worst");
        Console.WriteLine("Get(key):           O(1) average, O(n) worst");
        Console.WriteLine("ContainsKey(key):   O(1) average, O(n) worst");
        Console.WriteLine("Remove(key):        O(1) average, O(n) worst");
        Console.WriteLine("Space Complexity:   O(n) where n = number of entries");
    }
}
