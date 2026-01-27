# Singly Linked List in Python
# Complete implementation of singly linked list operations

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class SinglyLinkedList:
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
    
    def insert_at_position(self, data, pos):
        """Insert at specific position O(n)"""
        if pos == 0:
            self.insert_at_beginning(data)
            return
        
        new_node = Node(data)
        temp = self.head
        
        for _ in range(pos - 1):
            if temp is None:
                return
            temp = temp.next
        
        if temp is None:
            return
        
        new_node.next = temp.next
        temp.next = new_node
    
    def delete_node(self, key):
        """Delete node with value key O(n)"""
        if self.head is None:
            return
        
        if self.head.data == key:
            self.head = self.head.next
            return
        
        temp = self.head
        while temp.next is not None and temp.next.data != key:
            temp = temp.next
        
        if temp.next is not None:
            temp.next = temp.next.next
    
    def display(self):
        """Display linked list"""
        elements = []
        temp = self.head
        while temp is not None:
            elements.append(str(temp.data))
            temp = temp.next
        print(" -> ".join(elements) + " -> NULL")
    
    def search(self, key):
        """Search for element"""
        temp = self.head
        while temp is not None:
            if temp.data == key:
                return True
            temp = temp.next
        return False

# Test
ll = SinglyLinkedList()

print("=== Singly Linked List Operations ===\n")

# Insert at end
ll.insert_at_end(10)
ll.insert_at_end(20)
ll.insert_at_end(30)
ll.insert_at_end(40)

print("Initial List: ", end="")
ll.display()

# Insert at beginning
ll.insert_at_beginning(5)
print("After inserting 5 at beginning: ", end="")
ll.display()

# Insert at position
ll.insert_at_position(15, 2)
print("After inserting 15 at position 2: ", end="")
ll.display()

# Delete nodes
ll.delete_node(15)
print("After deleting 15: ", end="")
ll.display()

ll.delete_node(5)
print("After deleting 5: ", end="")
ll.display()

ll.delete_node(40)
print("After deleting 40: ", end="")
ll.display()

# Search
print(f"\nSearch 20: {'Found' if ll.search(20) else 'Not Found'}")
print(f"Search 100: {'Found' if ll.search(100) else 'Not Found'}")

print("\nComplexity Analysis:")
print("Insert at beginning: O(1)")
print("Insert at end: O(n)")
print("Insert at position: O(n)")
print("Delete: O(n)")
print("Search: O(n)")
print("Space: O(n)")
