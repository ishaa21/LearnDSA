#include <iostream>
#include <string>
#include <vector>
using namespace std;

// Hash Table in C++
struct Entry {
    string key;
    int value;
    bool used;
};

class HashTable {
private:
    vector<Entry> entries;
    int tableSize;
    
    int hashFunction(const string& key) {
        int hash = 0;
        for (char c : key) {
            hash += c;
        }
        return hash % tableSize;
    }
    
public:
    HashTable(int size = 100) : tableSize(size) {
        entries.resize(size);
        for (int i = 0; i < size; i++) {
            entries[i].used = false;
        }
    }
    
    void insert(const string& key, int value) {
        int index = hashFunction(key);
        int originalIndex = index;
        
        while (entries[index].used) {
            if (entries[index].key == key) {
                entries[index].value = value;
                cout << "Updated: " << key << " -> " << value << " (index " << index << ")\n";
                return;
            }
            index = (index + 1) % tableSize;
            if (index == originalIndex) {
                cout << "Hash Table is full\n";
                return;
            }
        }
        
        entries[index].key = key;
        entries[index].value = value;
        entries[index].used = true;
        cout << "Inserted: " << key << " -> " << value << " (index " << index << ")\n";
    }
    
    int search(const string& key) {
        int index = hashFunction(key);
        int originalIndex = index;
        
        while (entries[index].used) {
            if (entries[index].key == key) {
                cout << "Found: " << key << " -> " << entries[index].value << " (index " << index << ")\n";
                return entries[index].value;
            }
            index = (index + 1) % tableSize;
            if (index == originalIndex) break;
        }
        
        cout << "Not found: " << key << "\n";
        return -1;
    }
    
    void remove(const string& key) {
        int index = hashFunction(key);
        int originalIndex = index;
        
        while (entries[index].used) {
            if (entries[index].key == key) {
                entries[index].used = false;
                cout << "Deleted: " << key << " (was at index " << index << ")\n";
                return;
            }
            index = (index + 1) % tableSize;
            if (index == originalIndex) break;
        }
        
        cout << "Key not found: " << key << "\n";
    }
    
    void display() {
        cout << "\nHash Table Contents:\n";
        for (int i = 0; i < tableSize; i++) {
            if (entries[i].used) {
                cout << "Index " << i << ": " << entries[i].key << " -> " << entries[i].value << "\n";
            }
        }
    }
};

int main() {
    HashTable ht;
    
    cout << "=== Hash Table ===\n\n";
    
    cout << "Inserting elements:\n";
    ht.insert("apple", 5);
    ht.insert("banana", 3);
    ht.insert("orange", 7);
    ht.insert("grape", 4);
    
    ht.display();
    
    cout << "\nSearching elements:\n";
    ht.search("banana");
    ht.search("mango");
    
    cout << "\nDeleting elements:\n";
    ht.remove("banana");
    
    ht.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Insert: O(1) average, O(n) worst case\n";
    cout << "Search: O(1) average, O(n) worst case\n";
    cout << "Delete: O(1) average, O(n) worst case\n";
    cout << "Collision Handling: Linear Probing\n";
    
    return 0;
}
