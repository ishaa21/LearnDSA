# Doubly Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
        self.prev = None

class DoublyLinkedList:
    def __init__(self):
        self.head = None
    
    def insert_at_beginning(self, data):
        new_node = Node(data)
        if self.head is not None:
            self.head.prev = new_node
        new_node.next = self.head
        self.head = new_node
    
    def insert_at_end(self, data):
        new_node = Node(data)
        if self.head is None:
            self.head = new_node
            return
        
        temp = self.head
        while temp.next is not None:
            temp = temp.next
        
        temp.next = new_node
        new_node.prev = temp
    
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
dll = DoublyLinkedList()

print("=== Doubly Linked List ===\n")

dll.insert_at_end(10)
dll.insert_at_end(20)
dll.insert_at_end(30)

print("Forward: ", end="")
dll.display_forward()

print("Backward: ", end="")
dll.display_backward()

dll.insert_at_beginning(5)
print("\nAfter inserting 5 at beginning:")
print("Forward: ", end="")
dll.display_forward()

print("\nComplexity Analysis:")
print("Insert at beginning: O(1)")
print("Insert at end: O(n)")
print("Delete: O(1) with pointer, O(n) without")
print("Space: O(n)")
