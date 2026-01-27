# Insertion in Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class LinkedListInsertion:
    def __init__(self):
        self.head = None
    
    def insert_at_position(self, data, pos):
        if pos < 1:
            print("Invalid position")
            return
        
        new_node = Node(data)
        
        if pos == 1:
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
        temp.next = new_node
    
    def insert_sorted(self, data):
        new_node = Node(data)
        
        if self.head is None or self.head.data >= data:
            new_node.next = self.head
            self.head = new_node
            return
        
        temp = self.head
        while temp.next is not None and temp.next.data < data:
            temp = temp.next
        
        new_node.next = temp.next
        temp.next = new_node
    
    def display(self):
        temp = self.head
        elements = []
        while temp is not None:
            elements.append(str(temp.data))
            temp = temp.next
        print(" -> ".join(elements) + " -> NULL")

# Test
list1 = LinkedListInsertion()

print("=== Insertion in Linked List ===\n")

# Test 1: Insert at position
list1.insert_at_position(10, 1)
list1.insert_at_position(20, 2)
list1.insert_at_position(30, 3)
list1.insert_at_position(15, 2)

print("After position-based insertions: ", end="")
list1.display()

# Test 2: Insert in sorted order
list2 = LinkedListInsertion()
list2.insert_sorted(20)
list2.insert_sorted(10)
list2.insert_sorted(30)
list2.insert_sorted(15)
list2.insert_sorted(25)

print("After sorted insertions: ", end="")
list2.display()

print("\nComplexity Analysis:")
print("Insert at position: O(n)")
print("Insert sorted: O(n)")
print("Space: O(1) for operation, O(n) for list")
