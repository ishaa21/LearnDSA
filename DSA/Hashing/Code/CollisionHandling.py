# Collision Handling in Python

TABLE_SIZE = 7

class Entry:
    def __init__(self):
        self.key = None
        self.value = None
        self.used = False

# ========== Linear Probing ==========
class LinearProbingTable:
    def __init__(self):
        self.entries = [Entry() for _ in range(TABLE_SIZE)]
    
    def hash_function(self, key):
        hash_val = 0
        for c in key:
            hash_val += ord(c)
        return hash_val % TABLE_SIZE
    
    def insert(self, key, value):
        index = self.hash_function(key)
        
        while self.entries[index].used:
            if self.entries[index].key == key:
                self.entries[index].value = value
                return
            index = (index + 1) % TABLE_SIZE
        
        self.entries[index].key = key
        self.entries[index].value = value
        self.entries[index].used = True

# ========== Quadratic Probing ==========
class QuadraticProbingTable:
    def __init__(self):
        self.entries = [Entry() for _ in range(TABLE_SIZE)]
    
    def hash_function(self, key):
        hash_val = 0
        for c in key:
            hash_val += ord(c)
        return hash_val % TABLE_SIZE
    
    def insert(self, key, value):
        index = self.hash_function(key)
        i = 0
        
        while self.entries[index].used:
            if self.entries[index].key == key:
                self.entries[index].value = value
                return
            i += 1
            index = (self.hash_function(key) + i*i) % TABLE_SIZE
        
        self.entries[index].key = key
        self.entries[index].value = value
        self.entries[index].used = True

# ========== Double Hashing ==========
class DoubleHashingTable:
    def __init__(self):
        self.entries = [Entry() for _ in range(TABLE_SIZE)]
    
    def hash1(self, key):
        hash_val = 0
        for c in key:
            hash_val += ord(c)
        return hash_val % TABLE_SIZE
    
    def hash2(self, key):
        hash_val = 0
        for i, c in enumerate(key):
            hash_val += ord(c) * (i + 1)
        return (hash_val % (TABLE_SIZE - 1)) + 1
    
    def insert(self, key, value):
        h1 = self.hash1(key)
        h2 = self.hash2(key)
        index = h1
        
        while self.entries[index].used:
            if self.entries[index].key == key:
                self.entries[index].value = value
                return
            index = (index + h2) % TABLE_SIZE
        
        self.entries[index].key = key
        self.entries[index].value = value
        self.entries[index].used = True

# Test
print("=== Collision Handling Strategies ===\n")
print(f"TABLE_SIZE: {TABLE_SIZE}\n")

# Linear Probing
print("1. LINEAR PROBING (index = (h(key) + i) % TABLE_SIZE)")
linear_table = LinearProbingTable()
linear_table.insert("john", 25)
linear_table.insert("jane", 30)
linear_table.insert("jack", 28)
print("   Inserted: john(25), jane(30), jack(28)")
print("   Complexity: O(1) avg, O(n) worst\n")

# Quadratic Probing
print("2. QUADRATIC PROBING (index = (h(key) + i²) % TABLE_SIZE)")
quadratic_table = QuadraticProbingTable()
quadratic_table.insert("john", 25)
quadratic_table.insert("jane", 30)
quadratic_table.insert("jack", 28)
print("   Inserted: john(25), jane(30), jack(28)")
print("   Probing sequence: h(key), h(key)+1, h(key)+4, h(key)+9...")
print("   Reduces primary clustering compared to linear probing")
print("   Complexity: O(1) avg, O(n) worst\n")

# Double Hashing
print("3. DOUBLE HASHING (index = (h₁(key) + i*h₂(key)) % TABLE_SIZE)")
double_table = DoubleHashingTable()
double_table.insert("john", 25)
double_table.insert("jane", 30)
double_table.insert("jack", 28)
print("   Inserted: john(25), jane(30), jack(28)")
print("   Uses two hash functions")
print("   Eliminates both primary and secondary clustering")
print("   Complexity: O(1) avg, O(n) worst\n")

print("COMPARISON:")
print("Linear Probing:     Simple, cache-friendly, but clustering issues")
print("Quadratic Probing:  Reduces primary clustering")
print("Double Hashing:     Best distribution, no clustering, higher computation")
