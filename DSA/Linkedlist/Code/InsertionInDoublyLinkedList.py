# Insertion in Doubly Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
        self.prev = None

class DoublyLinkedListInsertion:
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
    
    def insert_at_position(self, data, pos):
        if pos < 1:
            print("Invalid position")
            return
        
        new_node = Node(data)
        
        if pos == 1:
            if self.head is not None:
                self.head.prev = new_node
            new_node.next = self.head
            self.head = new_node
            return
        
        temp = self.head
        for i in range(1, pos - 1):
            if temp is None:
                break
            temp = temp.next
        
        if temp is None:
            print("Position out of range")
            return
        
        new_node.next = temp.next
        new_node.prev = temp
        if temp.next is not None:
            temp.next.prev = new_node
        temp.next = new_node
    
    def display_forward(self):
        temp = self.head
        elements = []
        while temp is not None:
            elements.append(str(temp.data))
            temp = temp.next
        print(" <-> ".join(elements) + " <-> NULL")

# Test
list1 = DoublyLinkedListInsertion()

print("=== Insertion in Doubly Linked List ===\n")

list1.insert_at_end(10)
list1.insert_at_end(20)
list1.insert_at_end(30)

print("After end insertions: ", end="")
list1.display_forward()

list1.insert_at_beginning(5)
print("After beginning insertion: ", end="")
list1.display_forward()

list1.insert_at_position(15, 2)
print("After position insertion: ", end="")
list1.display_forward()

print("\nComplexity Analysis:")
print("Insert at beginning: O(1)")
print("Insert at end: O(n)")
print("Insert at position: O(n)")
print("Space: O(1) for operation")
