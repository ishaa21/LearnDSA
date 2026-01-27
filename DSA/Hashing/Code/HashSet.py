# HashSet in Python

TABLE_SIZE = 100

class SetEntry:
    def __init__(self):
        self.element = None
        self.used = False

class HashSet:
    def __init__(self):
        self.entries = [SetEntry() for _ in range(TABLE_SIZE)]
        self._size = 0
    
    def hash_function(self, element):
        hash_val = 0
        for c in element:
            hash_val += ord(c)
        return hash_val % TABLE_SIZE
    
    def add(self, element):
        """Add element to set (no duplicates)"""
        index = self.hash_function(element)
        
        while self.entries[index].used:
            if self.entries[index].element == element:
                return  # Element already exists
            index = (index + 1) % TABLE_SIZE
        
        self.entries[index].element = element
        self.entries[index].used = True
        self._size += 1
    
    def contains(self, element):
        """Check if element exists in set"""
        index = self.hash_function(element)
        
        while self.entries[index].used:
            if self.entries[index].element == element:
                return True
            index = (index + 1) % TABLE_SIZE
        
        return False
    
    def remove(self, element):
        """Remove element from set"""
        index = self.hash_function(element)
        
        while self.entries[index].used:
            if self.entries[index].element == element:
                self.entries[index].used = False
                self._size -= 1
                return
            index = (index + 1) % TABLE_SIZE
    
    def size(self):
        """Get size of set"""
        return self._size
    
    def print_set(self):
        """Print set contents"""
        print("Set contents: { ", end="")
        for i in range(TABLE_SIZE):
            if self.entries[i].used:
                print(self.entries[i].element + " ", end="")
        print("}")
    
    def intersection(self, other):
        """Return intersection of two sets"""
        result = HashSet()
        for i in range(TABLE_SIZE):
            if self.entries[i].used:
                if other.contains(self.entries[i].element):
                    result.add(self.entries[i].element)
        return result
    
    def union(self, other):
        """Return union of two sets"""
        result = HashSet()
        for i in range(TABLE_SIZE):
            if self.entries[i].used:
                result.add(self.entries[i].element)
        for i in range(TABLE_SIZE):
            if other.entries[i].used:
                result.add(other.entries[i].element)
        return result

# Test
print("=== HashSet (Python) ===\n")

set1 = HashSet()
set2 = HashSet()

# Add elements to set1
print("Adding elements to Set1...")
set1.add("apple")
set1.add("banana")
set1.add("orange")
set1.add("grape")
print(f"Set1 size: {set1.size()}")
set1.print_set()
print("\n")

# Add elements to set2
print("Adding elements to Set2...")
set2.add("banana")
set2.add("grape")
set2.add("mango")
set2.add("pear")
print(f"Set2 size: {set2.size()}")
set2.print_set()
print("\n")

# Contains operation
print("Checking elements...")
print(f"Set1 contains 'apple': {set1.contains('apple')}")
print(f"Set1 contains 'mango': {set1.contains('mango')}\n")

# Union
print("Union of Set1 and Set2:")
union_result = set1.union(set2)
print(f"Union size: {union_result.size()}")
union_result.print_set()
print("\n")

# Intersection
print("Intersection of Set1 and Set2:")
intersect_result = set1.intersection(set2)
print(f"Intersection size: {intersect_result.size()}")
intersect_result.print_set()
print("\n")

# Remove operation
print("Removing 'banana' from Set1...")
set1.remove("banana")
print(f"Set1 size: {set1.size()}")
print(f"Set1 contains 'banana': {set1.contains('banana')}\n")

print("=== HashSet Operations Complexity ===")
print("add(element):       O(1) average, O(n) worst")
print("contains(element):  O(1) average, O(n) worst")
print("remove(element):    O(1) average, O(n) worst")
print("union():            O(m + n) where m, n = set sizes")
print("intersection():     O(m + n) where m, n = set sizes")
print("Space Complexity:   O(n) where n = number of elements")
