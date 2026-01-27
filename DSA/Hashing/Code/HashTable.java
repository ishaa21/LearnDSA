// Hash Table in Java

class Entry {
    String key;
    int value;
    boolean used;
}

public class HashTable {
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
    
    private int hashFunction(String key) {
        int hash = 0;
        for (char c : key.toCharArray()) {
            hash += c;
        }
        return hash % tableSize;
    }
    
    void insert(String key, int value) {
        int index = hashFunction(key);
        int originalIndex = index;
        
        while (entries[index].used) {
            if (entries[index].key.equals(key)) {
                entries[index].value = value;
                System.out.println("Updated: " + key + " -> " + value + " (index " + index + ")");
                return;
            }
            index = (index + 1) % tableSize;
            if (index == originalIndex) {
                System.out.println("Hash Table is full");
                return;
            }
        }
        
        entries[index].key = key;
        entries[index].value = value;
        entries[index].used = true;
        System.out.println("Inserted: " + key + " -> " + value + " (index " + index + ")");
    }
    
    int search(String key) {
        int index = hashFunction(key);
        int originalIndex = index;
        
        while (entries[index].used) {
            if (entries[index].key.equals(key)) {
                System.out.println("Found: " + key + " -> " + entries[index].value + " (index " + index + ")");
                return entries[index].value;
            }
            index = (index + 1) % tableSize;
            if (index == originalIndex) break;
        }
        
        System.out.println("Not found: " + key);
        return -1;
    }
    
    void remove(String key) {
        int index = hashFunction(key);
        int originalIndex = index;
        
        while (entries[index].used) {
            if (entries[index].key.equals(key)) {
                entries[index].used = false;
                System.out.println("Deleted: " + key + " (was at index " + index + ")");
                return;
            }
            index = (index + 1) % tableSize;
            if (index == originalIndex) break;
        }
        
        System.out.println("Key not found: " + key);
    }
    
    void display() {
        System.out.println("\nHash Table Contents:");
        for (int i = 0; i < tableSize; i++) {
            if (entries[i].used) {
                System.out.println("Index " + i + ": " + entries[i].key + " -> " + entries[i].value);
            }
        }
    }
    
    public static void main(String[] args) {
        HashTable ht = new HashTable(100);
        
        System.out.println("=== Hash Table ===\n");
        
        System.out.println("Inserting elements:");
        ht.insert("apple", 5);
        ht.insert("banana", 3);
        ht.insert("orange", 7);
        ht.insert("grape", 4);
        
        ht.display();
        
        System.out.println("\nSearching elements:");
        ht.search("banana");
        ht.search("mango");
        
        System.out.println("\nDeleting elements:");
        ht.remove("banana");
        
        ht.display();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Insert: O(1) average, O(n) worst case");
        System.out.println("Search: O(1) average, O(n) worst case");
        System.out.println("Delete: O(1) average, O(n) worst case");
        System.out.println("Collision Handling: Linear Probing");
    }
}
