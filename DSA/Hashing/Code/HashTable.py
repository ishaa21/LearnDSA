# Hash Table in Python

class Entry:
    def __init__(self):
        self.key = None
        self.value = None
        self.used = False

class HashTable:
    def __init__(self, size=100):
        self.entries = [Entry() for _ in range(size)]
        self.size = size
    
    def hash_function(self, key):
        hash_val = 0
        for c in key:
            hash_val += ord(c)
        return hash_val % self.size
    
    def insert(self, key, value):
        index = self.hash_function(key)
        original_index = index
        
        while self.entries[index].used:
            if self.entries[index].key == key:
                self.entries[index].value = value
                print(f"Updated: {key} -> {value} (index {index})")
                return
            index = (index + 1) % self.size
            if index == original_index:
                print("Hash Table is full")
                return
        
        self.entries[index].key = key
        self.entries[index].value = value
        self.entries[index].used = True
        print(f"Inserted: {key} -> {value} (index {index})")
    
    def search(self, key):
        index = self.hash_function(key)
        original_index = index
        
        while self.entries[index].used:
            if self.entries[index].key == key:
                print(f"Found: {key} -> {self.entries[index].value} (index {index})")
                return self.entries[index].value
            index = (index + 1) % self.size
            if index == original_index:
                break
        
        print(f"Not found: {key}")
        return -1
    
    def delete(self, key):
        index = self.hash_function(key)
        original_index = index
        
        while self.entries[index].used:
            if self.entries[index].key == key:
                self.entries[index].used = False
                print(f"Deleted: {key} (was at index {index})")
                return
            index = (index + 1) % self.size
            if index == original_index:
                break
        
        print(f"Key not found: {key}")
    
    def display(self):
        print("\nHash Table Contents:")
        for i in range(self.size):
            if self.entries[i].used:
                print(f"Index {i}: {self.entries[i].key} -> {self.entries[i].value}")

# Test
ht = HashTable()

print("=== Hash Table ===\n")

print("Inserting elements:")
ht.insert("apple", 5)
ht.insert("banana", 3)
ht.insert("orange", 7)
ht.insert("grape", 4)

ht.display()

print("\nSearching elements:")
ht.search("banana")
ht.search("mango")

print("\nDeleting elements:")
ht.delete("banana")

ht.display()

print("\nComplexity Analysis:")
print("Insert: O(1) average, O(n) worst case")
print("Search: O(1) average, O(n) worst case")
print("Delete: O(1) average, O(n) worst case")
print("Collision Handling: Linear Probing")
