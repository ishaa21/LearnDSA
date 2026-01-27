# Introduction to Linked List in Python
# Basic structure and node operations

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None
    
    def insert_at_beginning(self, data):
        """Insert at beginning O(1)"""
        new_node = Node(data)
        new_node.next = self.head
        self.head = new_node
    
    def insert_at_end(self, data):
        """Insert at end O(n)"""
        new_node = Node(data)
        
        if self.head is None:
            self.head = new_node
            return
        
        temp = self.head
        while temp.next is not None:
            temp = temp.next
        
        temp.next = new_node
    
    def display(self):
        """Display linked list"""
        elements = []
        temp = self.head
        while temp is not None:
            elements.append(str(temp.data))
            temp = temp.next
        print(" -> ".join(elements) + " -> NULL")
    
    def count_nodes(self):
        """Count total nodes"""
        count = 0
        temp = self.head
        while temp is not None:
            count += 1
            temp = temp.next
        return count
    
    def search(self, key):
        """Search for element"""
        temp = self.head
        while temp is not None:
            if temp.data == key:
                return True
            temp = temp.next
        return False
    
    def get_at_index(self, index):
        """Get element at index"""
        temp = self.head
        for _ in range(index):
            if temp is None:
                return None
            temp = temp.next
        return temp.data if temp else None

# Test
ll = LinkedList()

# Create linked list: 10 -> 20 -> 30 -> NULL
ll.insert_at_end(10)
ll.insert_at_end(20)
ll.insert_at_end(30)

print("Linked List: ", end="")
ll.display()

# Insert at beginning
ll.insert_at_beginning(5)
print("After inserting 5 at beginning: ", end="")
ll.display()

# Insert at end
ll.insert_at_end(40)
print("After inserting 40 at end: ", end="")
ll.display()

# Count nodes
print(f"Number of nodes: {ll.count_nodes()}")

# Search
print(f"Search 20: {'Found' if ll.search(20) else 'Not Found'}")
print(f"Search 50: {'Found' if ll.search(50) else 'Not Found'}")

# Get at index
print(f"Element at index 0: {ll.get_at_index(0)}")
print(f"Element at index 2: {ll.get_at_index(2)}")

print("\nComplexity Analysis:")
print("Create Node: O(1)")
print("Insert at beginning: O(1)")
print("Insert at end: O(n)")
print("Search: O(n)")
print("Display/Traverse: O(n)")
print("Space: O(n)")
