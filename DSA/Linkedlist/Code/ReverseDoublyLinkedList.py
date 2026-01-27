# Reverse Doubly Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
        self.prev = None

class ReverseDoublyLinkedList:
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
    
    def reverse_iterative(self):
        if self.head is None:
            return
        
        curr = self.head
        temp = None
        
        while curr is not None:
            temp = curr.prev
            curr.prev = curr.next
            curr.next = temp
            curr = curr.prev
        
        if temp is not None:
            self.head = temp.prev
    
    def display_forward(self):
        temp = self.head
        elements = []
        while temp is not None:
            elements.append(str(temp.data))
            temp = temp.next
        print(" <-> ".join(elements) + " <-> NULL")
    
    def display_backward(self):
        if self.head is None:
            return
        temp = self.head
        while temp.next is not None:
            temp = temp.next
        
        elements = []
        while temp is not None:
            elements.append(str(temp.data))
            temp = temp.prev
        print(" <-> ".join(elements) + " <-> NULL")

# Test
list1 = ReverseDoublyLinkedList()

print("=== Reverse Doubly Linked List ===\n")

# Build list
for i in range(1, 6):
    list1.add_node(i * 10)

print("Original (Forward): ", end="")
list1.display_forward()

print("Original (Backward): ", end="")
list1.display_backward()

list1.reverse_iterative()

print("\nAfter reverse (Forward): ", end="")
list1.display_forward()

print("After reverse (Backward): ", end="")
list1.display_backward()

print("\nComplexity Analysis:")
print("Reverse: O(n) time, O(1) space")
