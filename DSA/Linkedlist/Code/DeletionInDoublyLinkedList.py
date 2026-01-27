# Deletion in Doubly Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
        self.prev = None

class DoublyLinkedListDeletion:
    def __init__(self):
        self.head = None
    
    def add_node(self, data):
        new_node = Node(data)
        if self.head is None:
            self.head = new_node
            return
        temp = self.head
        while temp.next is not None:
            temp = temp.next
        temp.next = new_node
        new_node.prev = temp
    
    def delete_at_position(self, pos):
        if self.head is None:
            return
        
        if pos == 1:
            self.head = self.head.next
            if self.head is not None:
                self.head.prev = None
            return
        
        temp = self.head
        for i in range(1, pos):
            if temp is None:
                return
            temp = temp.next
        
        if temp is None:
            return
        
        if temp.next is not None:
            temp.next.prev = temp.prev
        if temp.prev is not None:
            temp.prev.next = temp.next
    
    def delete_by_value(self, value):
        if self.head is None:
            return
        
        if self.head.data == value:
            self.head = self.head.next
            if self.head is not None:
                self.head.prev = None
            return
        
        temp = self.head
        while temp is not None and temp.data != value:
            temp = temp.next
        
        if temp is None:
            return
        
        if temp.next is not None:
            temp.next.prev = temp.prev
        if temp.prev is not None:
            temp.prev.next = temp.next
    
    def display_forward(self):
        temp = self.head
        elements = []
        while temp is not None:
            elements.append(str(temp.data))
            temp = temp.next
        print(" <-> ".join(elements) + " <-> NULL")

# Test
list1 = DoublyLinkedListDeletion()

print("=== Deletion in Doubly Linked List ===\n")

# Build list
for i in range(1, 6):
    list1.add_node(i * 10)

print("Original list: ", end="")
list1.display_forward()

list1.delete_at_position(2)
print("After deleting position 2: ", end="")
list1.display_forward()

list1.delete_by_value(40)
print("After deleting value 40: ", end="")
list1.display_forward()

print("\nComplexity Analysis:")
print("Delete at position: O(n)")
print("Delete by value: O(n)")
print("Space: O(1)")
