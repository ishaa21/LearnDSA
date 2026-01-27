#include <iostream>
#include <vector>
#include <string>
using namespace std;

#define TABLE_SIZE 100

// HashMap: Key-Value pair storage with hash-based retrieval
typedef struct {
    string key;
    int value;
    bool used;
} MapEntry;

class HashMap {
private:
    vector<MapEntry> entries;
    
    int hashFunction(const string& str) {
        int hash = 0;
        for (char c : str) {
            hash += c;
        }
        return hash % TABLE_SIZE;
    }
    
public:
    HashMap() : entries(TABLE_SIZE) {
        for (int i = 0; i < TABLE_SIZE; i++) {
            entries[i].used = false;
        }
    }
    
    void put(const string& key, int value) {
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
    
    int get(const string& key) {
        int index = hashFunction(key);
        
        while (entries[index].used) {
            if (entries[index].key == key) {
                return entries[index].value;
            }
            index = (index + 1) % TABLE_SIZE;
        }
        return -1;
    }
    
    bool containsKey(const string& key) {
        int index = hashFunction(key);
        
        while (entries[index].used) {
            if (entries[index].key == key) {
                return true;
            }
            index = (index + 1) % TABLE_SIZE;
        }
        return false;
    }
    
    void remove(const string& key) {
        int index = hashFunction(key);
        
        while (entries[index].used) {
            if (entries[index].key == key) {
                entries[index].used = false;
                return;
            }
            index = (index + 1) % TABLE_SIZE;
        }
    }
};

int main() {
    HashMap map;
    
    cout << "=== HashMap (C++) ===\n\n";
    
    // Put operations
    cout << "Inserting key-value pairs...\n";
    map.put("apple", 5);
    map.put("banana", 3);
    map.put("orange", 7);
    map.put("grape", 4);
    cout << "Inserted: apple->5, banana->3, orange->7, grape->4\n\n";
    
    // Get operations
    cout << "Retrieving values...\n";
    cout << "get('apple') = " << map.get("apple") << "\n";
    cout << "get('banana') = " << map.get("banana") << "\n";
    cout << "get('grape') = " << map.get("grape") << "\n";
    cout << "get('mango') = " << map.get("mango") << " (not found)\n\n";
    
    // Contains key
    cout << "Checking keys...\n";
    cout << "containsKey('apple') = " << (map.containsKey("apple") ? 1 : 0) << "\n";
    cout << "containsKey('mango') = " << (map.containsKey("mango") ? 1 : 0) << "\n\n";
    
    // Update value
    cout << "Updating value...\n";
    map.put("apple", 10);
    cout << "Updated apple->10\n";
    cout << "get('apple') = " << map.get("apple") << "\n\n";
    
    // Remove operation
    cout << "Removing 'banana'...\n";
    map.remove("banana");
    cout << "get('banana') = " << map.get("banana") << " (removed)\n\n";
    
    cout << "=== HashMap Operations Complexity ===\n";
    cout << "put(key, value):    O(1) average, O(n) worst\n";
    cout << "get(key):           O(1) average, O(n) worst\n";
    cout << "containsKey(key):   O(1) average, O(n) worst\n";
    cout << "remove(key):        O(1) average, O(n) worst\n";
    cout << "Space Complexity:   O(n) where n = number of entries\n";
    
    return 0;
}
