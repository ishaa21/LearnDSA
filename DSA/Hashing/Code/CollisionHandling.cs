// Collision Handling in C#

using System;
using System.Collections.Generic;

class CollisionHandling {
    private const int TABLE_SIZE = 7;
    
    class Entry {
        public string Key { get; set; }
        public int Value { get; set; }
        public bool Used { get; set; }
        
        public Entry() {
            Used = false;
        }
    }
    
    // ========== Linear Probing ==========
    class LinearProbingTable {
        private Entry[] entries = new Entry[TABLE_SIZE];
        
        public LinearProbingTable() {
            for (int i = 0; i < TABLE_SIZE; i++) {
                entries[i] = new Entry();
            }
        }
        
        int HashFunction(string key) {
            int hash = 0;
            foreach (char c in key) {
                hash += c;
            }
            return hash % TABLE_SIZE;
        }
        
        public void Insert(string key, int value) {
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
    }
    
    // ========== Quadratic Probing ==========
    class QuadraticProbingTable {
        private Entry[] entries = new Entry[TABLE_SIZE];
        
        public QuadraticProbingTable() {
            for (int i = 0; i < TABLE_SIZE; i++) {
                entries[i] = new Entry();
            }
        }
        
        int HashFunction(string key) {
            int hash = 0;
            foreach (char c in key) {
                hash += c;
            }
            return hash % TABLE_SIZE;
        }
        
        public void Insert(string key, int value) {
            int index = HashFunction(key);
            int i = 0;
            
            while (entries[index].Used) {
                if (entries[index].Key == key) {
                    entries[index].Value = value;
                    return;
                }
                i++;
                index = (HashFunction(key) + i*i) % TABLE_SIZE;
            }
            
            entries[index].Key = key;
            entries[index].Value = value;
            entries[index].Used = true;
        }
    }
    
    // ========== Double Hashing ==========
    class DoubleHashingTable {
        private Entry[] entries = new Entry[TABLE_SIZE];
        
        public DoubleHashingTable() {
            for (int i = 0; i < TABLE_SIZE; i++) {
                entries[i] = new Entry();
            }
        }
        
        int Hash1(string key) {
            int hash = 0;
            foreach (char c in key) {
                hash += c;
            }
            return hash % TABLE_SIZE;
        }
        
        int Hash2(string key) {
            int hash = 0;
            for (int i = 0; i < key.Length; i++) {
                hash += key[i] * (i + 1);
            }
            return (hash % (TABLE_SIZE - 1)) + 1;
        }
        
        public void Insert(string key, int value) {
            int h1 = Hash1(key);
            int h2 = Hash2(key);
            int index = h1;
            
            while (entries[index].Used) {
                if (entries[index].Key == key) {
                    entries[index].Value = value;
                    return;
                }
                index = (index + h2) % TABLE_SIZE;
            }
            
            entries[index].Key = key;
            entries[index].Value = value;
            entries[index].Used = true;
        }
    }
    
    static void Main() {
        Console.WriteLine("=== Collision Handling Strategies ===\n");
        Console.WriteLine("TABLE_SIZE: " + TABLE_SIZE + "\n");
        
        // Linear Probing
        Console.WriteLine("1. LINEAR PROBING (index = (h(key) + i) % TABLE_SIZE)");
        LinearProbingTable linearTable = new LinearProbingTable();
        linearTable.Insert("john", 25);
        linearTable.Insert("jane", 30);
        linearTable.Insert("jack", 28);
        Console.WriteLine("   Inserted: john(25), jane(30), jack(28)");
        Console.WriteLine("   Complexity: O(1) avg, O(n) worst\n");
        
        // Quadratic Probing
        Console.WriteLine("2. QUADRATIC PROBING (index = (h(key) + i²) % TABLE_SIZE)");
        QuadraticProbingTable quadraticTable = new QuadraticProbingTable();
        quadraticTable.Insert("john", 25);
        quadraticTable.Insert("jane", 30);
        quadraticTable.Insert("jack", 28);
        Console.WriteLine("   Inserted: john(25), jane(30), jack(28)");
        Console.WriteLine("   Probing sequence: h(key), h(key)+1, h(key)+4, h(key)+9...");
        Console.WriteLine("   Reduces primary clustering compared to linear probing");
        Console.WriteLine("   Complexity: O(1) avg, O(n) worst\n");
        
        // Double Hashing
        Console.WriteLine("3. DOUBLE HASHING (index = (h₁(key) + i*h₂(key)) % TABLE_SIZE)");
        DoubleHashingTable doubleTable = new DoubleHashingTable();
        doubleTable.Insert("john", 25);
        doubleTable.Insert("jane", 30);
        doubleTable.Insert("jack", 28);
        Console.WriteLine("   Inserted: john(25), jane(30), jack(28)");
        Console.WriteLine("   Uses two hash functions");
        Console.WriteLine("   Eliminates both primary and secondary clustering");
        Console.WriteLine("   Complexity: O(1) avg, O(n) worst\n");
        
        Console.WriteLine("COMPARISON:");
        Console.WriteLine("Linear Probing:     Simple, cache-friendly, but clustering issues");
        Console.WriteLine("Quadratic Probing:  Reduces primary clustering");
        Console.WriteLine("Double Hashing:     Best distribution, no clustering, higher computation");
    }
}
