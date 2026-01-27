#include <iostream>
#include <vector>
#include <string>
using namespace std;

#define TABLE_SIZE 7

typedef struct {
    string key;
    int value;
    bool used;
} Entry;

// ========== Linear Probing ==========
class LinearProbingTable {
public:
    vector<Entry> entries;
    
    LinearProbingTable() : entries(TABLE_SIZE) {
        for (int i = 0; i < TABLE_SIZE; i++) {
            entries[i].used = false;
        }
    }
    
    int hashFunction(const string& str) {
        int hash = 0;
        for (char c : str) {
            hash += c;
        }
        return hash % TABLE_SIZE;
    }
    
    void insert(const string& key, int value) {
        int index = hashFunction(key);
        
        while (entries[index].used) {
            if (entries[index].key == key) {
                entries[index].value = value;
                return;
            }
            index = (index + 1) % TABLE_SIZE;
        }
        
        entries[index].key = key;
        entries[index].value = value;
        entries[index].used = true;
    }
};

// ========== Quadratic Probing ==========
class QuadraticProbingTable {
public:
    vector<Entry> entries;
    
    QuadraticProbingTable() : entries(TABLE_SIZE) {
        for (int i = 0; i < TABLE_SIZE; i++) {
            entries[i].used = false;
        }
    }
    
    int hashFunction(const string& str) {
        int hash = 0;
        for (char c : str) {
            hash += c;
        }
        return hash % TABLE_SIZE;
    }
    
    void insert(const string& key, int value) {
        int index = hashFunction(key);
        int i = 0;
        
        while (entries[index].used) {
            if (entries[index].key == key) {
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
};

// ========== Double Hashing ==========
class DoubleHashingTable {
public:
    vector<Entry> entries;
    
    DoubleHashingTable() : entries(TABLE_SIZE) {
        for (int i = 0; i < TABLE_SIZE; i++) {
            entries[i].used = false;
        }
    }
    
    int hash1(const string& str) {
        int hash = 0;
        for (char c : str) {
            hash += c;
        }
        return hash % TABLE_SIZE;
    }
    
    int hash2(const string& str) {
        int hash = 0;
        for (int i = 0; i < str.length(); i++) {
            hash += str[i] * (i + 1);
        }
        return (hash % (TABLE_SIZE - 1)) + 1;
    }
    
    void insert(const string& key, int value) {
        int h1 = hash1(key);
        int h2 = hash2(key);
        int index = h1;
        
        while (entries[index].used) {
            if (entries[index].key == key) {
                entries[index].value = value;
                return;
            }
            index = (index + h2) % TABLE_SIZE;
        }
        
        entries[index].key = key;
        entries[index].value = value;
        entries[index].used = true;
    }
};

int main() {
    cout << "=== Collision Handling Strategies ===\n\n";
    cout << "TABLE_SIZE: " << TABLE_SIZE << "\n\n";
    
    // Linear Probing
    cout << "1. LINEAR PROBING (index = (h(key) + i) % TABLE_SIZE)\n";
    LinearProbingTable linearTable;
    linearTable.insert("john", 25);
    linearTable.insert("jane", 30);
    linearTable.insert("jack", 28);
    cout << "   Inserted: john(25), jane(30), jack(28)\n";
    cout << "   Complexity: O(1) avg, O(n) worst\n\n";
    
    // Quadratic Probing
    cout << "2. QUADRATIC PROBING (index = (h(key) + i²) % TABLE_SIZE)\n";
    QuadraticProbingTable quadraticTable;
    quadraticTable.insert("john", 25);
    quadraticTable.insert("jane", 30);
    quadraticTable.insert("jack", 28);
    cout << "   Inserted: john(25), jane(30), jack(28)\n";
    cout << "   Probing sequence: h(key), h(key)+1, h(key)+4, h(key)+9...\n";
    cout << "   Reduces primary clustering compared to linear probing\n";
    cout << "   Complexity: O(1) avg, O(n) worst\n\n";
    
    // Double Hashing
    cout << "3. DOUBLE HASHING (index = (h₁(key) + i*h₂(key)) % TABLE_SIZE)\n";
    DoubleHashingTable doubleTable;
    doubleTable.insert("john", 25);
    doubleTable.insert("jane", 30);
    doubleTable.insert("jack", 28);
    cout << "   Inserted: john(25), jane(30), jack(28)\n";
    cout << "   Uses two hash functions\n";
    cout << "   Eliminates both primary and secondary clustering\n";
    cout << "   Complexity: O(1) avg, O(n) worst\n\n";
    
    cout << "COMPARISON:\n";
    cout << "Linear Probing:     Simple, cache-friendly, but clustering issues\n";
    cout << "Quadratic Probing:  Reduces primary clustering\n";
    cout << "Double Hashing:     Best distribution, no clustering, higher computation\n";
    
    return 0;
}
