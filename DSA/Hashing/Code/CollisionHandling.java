// Collision Handling in Java

public class CollisionHandling {
    private static final int TABLE_SIZE = 7;
    
    static class Entry {
        String key;
        int value;
        boolean used;
        Entry() {
            used = false;
        }
    }
    
    // ========== Linear Probing ==========
    static class LinearProbingTable {
        Entry[] entries = new Entry[TABLE_SIZE];
        
        LinearProbingTable() {
            for (int i = 0; i < TABLE_SIZE; i++) {
                entries[i] = new Entry();
            }
        }
        
        int hashFunction(String key) {
            int hash = 0;
            for (char c : key.toCharArray()) {
                hash += c;
            }
            return hash % TABLE_SIZE;
        }
        
        void insert(String key, int value) {
            int index = hashFunction(key);
            
            while (entries[index].used) {
                if (entries[index].key.equals(key)) {
                    entries[index].value = value;
                    return;
                }
                index = (index + 1) % TABLE_SIZE;
            }
            
            entries[index].key = key;
            entries[index].value = value;
            entries[index].used = true;
        }
    }
    
    // ========== Quadratic Probing ==========
    static class QuadraticProbingTable {
        Entry[] entries = new Entry[TABLE_SIZE];
        
        QuadraticProbingTable() {
            for (int i = 0; i < TABLE_SIZE; i++) {
                entries[i] = new Entry();
            }
        }
        
        int hashFunction(String key) {
            int hash = 0;
            for (char c : key.toCharArray()) {
                hash += c;
            }
            return hash % TABLE_SIZE;
        }
        
        void insert(String key, int value) {
            int index = hashFunction(key);
            int i = 0;
            
            while (entries[index].used) {
                if (entries[index].key.equals(key)) {
                    entries[index].value = value;
                    return;
                }
                i++;
                index = (hashFunction(key) + i*i) % TABLE_SIZE;
            }
            
            entries[index].key = key;
            entries[index].value = value;
            entries[index].used = true;
        }
    }
    
    // ========== Double Hashing ==========
    static class DoubleHashingTable {
        Entry[] entries = new Entry[TABLE_SIZE];
        
        DoubleHashingTable() {
            for (int i = 0; i < TABLE_SIZE; i++) {
                entries[i] = new Entry();
            }
        }
        
        int hash1(String key) {
            int hash = 0;
            for (char c : key.toCharArray()) {
                hash += c;
            }
            return hash % TABLE_SIZE;
        }
        
        int hash2(String key) {
            int hash = 0;
            for (int i = 0; i < key.length(); i++) {
                hash += key.charAt(i) * (i + 1);
            }
            return (hash % (TABLE_SIZE - 1)) + 1;
        }
        
        void insert(String key, int value) {
            int h1 = hash1(key);
            int h2 = hash2(key);
            int index = h1;
            
            while (entries[index].used) {
                if (entries[index].key.equals(key)) {
                    entries[index].value = value;
                    return;
                }
                index = (index + h2) % TABLE_SIZE;
            }
            
            entries[index].key = key;
            entries[index].value = value;
            entries[index].used = true;
        }
    }
    
    public static void main(String[] args) {
        System.out.println("=== Collision Handling Strategies ===\n");
        System.out.println("TABLE_SIZE: " + TABLE_SIZE + "\n");
        
        // Linear Probing
        System.out.println("1. LINEAR PROBING (index = (h(key) + i) % TABLE_SIZE)");
        LinearProbingTable linearTable = new LinearProbingTable();
        linearTable.insert("john", 25);
        linearTable.insert("jane", 30);
        linearTable.insert("jack", 28);
        System.out.println("   Inserted: john(25), jane(30), jack(28)");
        System.out.println("   Complexity: O(1) avg, O(n) worst\n");
        
        // Quadratic Probing
        System.out.println("2. QUADRATIC PROBING (index = (h(key) + i²) % TABLE_SIZE)");
        QuadraticProbingTable quadraticTable = new QuadraticProbingTable();
        quadraticTable.insert("john", 25);
        quadraticTable.insert("jane", 30);
        quadraticTable.insert("jack", 28);
        System.out.println("   Inserted: john(25), jane(30), jack(28)");
        System.out.println("   Probing sequence: h(key), h(key)+1, h(key)+4, h(key)+9...");
        System.out.println("   Reduces primary clustering compared to linear probing");
        System.out.println("   Complexity: O(1) avg, O(n) worst\n");
        
        // Double Hashing
        System.out.println("3. DOUBLE HASHING (index = (h₁(key) + i*h₂(key)) % TABLE_SIZE)");
        DoubleHashingTable doubleTable = new DoubleHashingTable();
        doubleTable.insert("john", 25);
        doubleTable.insert("jane", 30);
        doubleTable.insert("jack", 28);
        System.out.println("   Inserted: john(25), jane(30), jack(28)");
        System.out.println("   Uses two hash functions");
        System.out.println("   Eliminates both primary and secondary clustering");
        System.out.println("   Complexity: O(1) avg, O(n) worst\n");
        
        System.out.println("COMPARISON:");
        System.out.println("Linear Probing:     Simple, cache-friendly, but clustering issues");
        System.out.println("Quadratic Probing:  Reduces primary clustering");
        System.out.println("Double Hashing:     Best distribution, no clustering, higher computation");
    }
}
