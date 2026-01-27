#include <iostream>
#include <vector>
#include <string>
using namespace std;

#define TABLE_SIZE 100

// HashSet: Set implementation using hash table for O(1) lookups
typedef struct {
    string element;
    bool used;
} SetEntry;

class HashSet {
private:
    vector<SetEntry> entries;
    int sz;
    
    int hashFunction(const string& str) {
        int hash = 0;
        for (char c : str) {
            hash += c;
        }
        return hash % TABLE_SIZE;
    }
    
public:
    HashSet() : entries(TABLE_SIZE), sz(0) {
        for (int i = 0; i < TABLE_SIZE; i++) {
            entries[i].used = false;
        }
    }
    
    void add(const string& element) {
        int index = hashFunction(element);
        
        while (entries[index].used) {
            if (entries[index].element == element) {
                return; // Element already exists
            }
            index = (index + 1) % TABLE_SIZE;
        }
        
        entries[index].element = element;
        entries[index].used = true;
        sz++;
    }
    
    bool contains(const string& element) {
        int index = hashFunction(element);
        
        while (entries[index].used) {
            if (entries[index].element == element) {
                return true;
            }
            index = (index + 1) % TABLE_SIZE;
        }
        return false;
    }
    
    void remove(const string& element) {
        int index = hashFunction(element);
        
        while (entries[index].used) {
            if (entries[index].element == element) {
                entries[index].used = false;
                sz--;
                return;
            }
            index = (index + 1) % TABLE_SIZE;
        }
    }
    
    int size() const {
        return sz;
    }
    
    void print() const {
        cout << "Set contents: { ";
        for (int i = 0; i < TABLE_SIZE; i++) {
            if (entries[i].used) {
                cout << entries[i].element << " ";
            }
        }
        cout << "}\n";
    }
    
    friend HashSet intersection(const HashSet& set1, const HashSet& set2);
    friend HashSet unionSet(const HashSet& set1, const HashSet& set2);
};

HashSet intersection(const HashSet& set1, const HashSet& set2) {
    HashSet result;
    for (int i = 0; i < TABLE_SIZE; i++) {
        if (set1.entries[i].used) {
            if (set2.contains(set1.entries[i].element)) {
                result.add(set1.entries[i].element);
            }
        }
    }
    return result;
}

HashSet unionSet(const HashSet& set1, const HashSet& set2) {
    HashSet result;
    for (int i = 0; i < TABLE_SIZE; i++) {
        if (set1.entries[i].used) {
            result.add(set1.entries[i].element);
        }
    }
    for (int i = 0; i < TABLE_SIZE; i++) {
        if (set2.entries[i].used) {
            result.add(set2.entries[i].element);
        }
    }
    return result;
}

int main() {
    cout << "=== HashSet (C++) ===\n\n";
    
    HashSet set1, set2;
    
    // Add elements to set1
    cout << "Adding elements to Set1...\n";
    set1.add("apple");
    set1.add("banana");
    set1.add("orange");
    set1.add("grape");
    cout << "Set1 size: " << set1.size() << "\n";
    set1.print();
    cout << "\n";
    
    // Add elements to set2
    cout << "Adding elements to Set2...\n";
    set2.add("banana");
    set2.add("grape");
    set2.add("mango");
    set2.add("pear");
    cout << "Set2 size: " << set2.size() << "\n";
    set2.print();
    cout << "\n";
    
    // Contains operation
    cout << "Checking elements...\n";
    cout << "Set1 contains 'apple': " << (set1.contains("apple") ? 1 : 0) << "\n";
    cout << "Set1 contains 'mango': " << (set1.contains("mango") ? 1 : 0) << "\n\n";
    
    // Union
    cout << "Union of Set1 and Set2:\n";
    HashSet unionResult = unionSet(set1, set2);
    cout << "Union size: " << unionResult.size() << "\n";
    unionResult.print();
    cout << "\n";
    
    // Intersection
    cout << "Intersection of Set1 and Set2:\n";
    HashSet intersectResult = intersection(set1, set2);
    cout << "Intersection size: " << intersectResult.size() << "\n";
    intersectResult.print();
    cout << "\n";
    
    // Remove operation
    cout << "Removing 'banana' from Set1...\n";
    set1.remove("banana");
    cout << "Set1 size: " << set1.size() << "\n";
    cout << "Set1 contains 'banana': " << (set1.contains("banana") ? 1 : 0) << "\n\n";
    
    cout << "=== HashSet Operations Complexity ===\n";
    cout << "add(element):       O(1) average, O(n) worst\n";
    cout << "contains(element):  O(1) average, O(n) worst\n";
    cout << "remove(element):    O(1) average, O(n) worst\n";
    cout << "union():            O(m + n) where m, n = set sizes\n";
    cout << "intersection():     O(m + n) where m, n = set sizes\n";
    cout << "Space Complexity:   O(n) where n = number of elements\n";
    
    return 0;
}
