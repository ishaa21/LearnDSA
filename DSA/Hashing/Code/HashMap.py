# HashMap in Python

TABLE_SIZE = 100

class MapEntry:
    def __init__(self):
        self.key = None
        self.value = None
        self.used = False

class HashMap:
    def __init__(self):
        self.entries = [MapEntry() for _ in range(TABLE_SIZE)]
    
    def hash_function(self, key):
        hash_val = 0
        for c in key:
            hash_val += ord(c)
        return hash_val % TABLE_SIZE
    
    def put(self, key, value):
        """Insert or update key-value pair"""
        index = self.hash_function(key)
        
        while self.entries[index].used:
            if self.entries[index].key == key:
                self.entries[index].value = value
                return
            index = (index + 1) % TABLE_SIZE
        
        self.entries[index].key = key
        self.entries[index].value = value
        self.entries[index].used = True
    
    def get(self, key):
        """Retrieve value by key"""
        index = self.hash_function(key)
        
        while self.entries[index].used:
            if self.entries[index].key == key:
                return self.entries[index].value
            index = (index + 1) % TABLE_SIZE
        
        return -1
    
    def contains_key(self, key):
        """Check if key exists"""
        index = self.hash_function(key)
        
        while self.entries[index].used:
            if self.entries[index].key == key:
                return True
            index = (index + 1) % TABLE_SIZE
        
        return False
    
    def remove(self, key):
        """Remove key-value pair"""
        index = self.hash_function(key)
        
        while self.entries[index].used:
            if self.entries[index].key == key:
                self.entries[index].used = False
                return
            index = (index + 1) % TABLE_SIZE

# Test
print("=== HashMap (Python) ===\n")

map_obj = HashMap()

# Put operations
print("Inserting key-value pairs...")
map_obj.put("apple", 5)
map_obj.put("banana", 3)
map_obj.put("orange", 7)
map_obj.put("grape", 4)
print("Inserted: apple->5, banana->3, orange->7, grape->4\n")

# Get operations
print("Retrieving values...")
print(f"get('apple') = {map_obj.get('apple')}")
print(f"get('banana') = {map_obj.get('banana')}")
print(f"get('grape') = {map_obj.get('grape')}")
print(f"get('mango') = {map_obj.get('mango')} (not found)\n")

# Contains key
print("Checking keys...")
print(f"contains_key('apple') = {map_obj.contains_key('apple')}")
print(f"contains_key('mango') = {map_obj.contains_key('mango')}\n")

# Update value
print("Updating value...")
map_obj.put("apple", 10)
print("Updated apple->10")
print(f"get('apple') = {map_obj.get('apple')}\n")

# Remove operation
print("Removing 'banana'...")
map_obj.remove("banana")
print(f"get('banana') = {map_obj.get('banana')} (removed)\n")

print("=== HashMap Operations Complexity ===")
print("put(key, value):    O(1) average, O(n) worst")
print("get(key):           O(1) average, O(n) worst")
print("contains_key(key):  O(1) average, O(n) worst")
print("remove(key):        O(1) average, O(n) worst")
print("Space Complexity:   O(n) where n = number of entries")
