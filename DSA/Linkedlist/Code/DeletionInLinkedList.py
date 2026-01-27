# Deletion in Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class LinkedListDeletion:
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
    
    def delete_at_position(self, pos):
        if self.head is None:
            return
        
        if pos == 1:
            self.head = self.head.next
            return
        
        temp = self.head
        for i in range(1, pos - 1):
            if temp is None:
                return
            temp = temp.next
        
        if temp is None or temp.next is None:
            return
        
        temp.next = temp.next.next
    
    def delete_by_value(self, value):
        if self.head is None:
            return
        
        if self.head.data == value:
            self.head = self.head.next
            return
        
        temp = self.head
        while temp.next is not None and temp.next.data != value:
            temp = temp.next
        
        if temp.next is not None:
            temp.next = temp.next.next
    
    def delete_all_occurrences(self, value):
        while self.head is not None and self.head.data == value:
            self.head = self.head.next
        
        if self.head is None:
            return
        
        temp = self.head
        while temp.next is not None:
            if temp.next.data == value:
                temp.next = temp.next.next
            else:
                temp = temp.next
    
    def display(self):
        temp = self.head
        elements = []
        while temp is not None:
            elements.append(str(temp.data))
            temp = temp.next
        print(" -> ".join(elements) + " -> NULL")

# Test
list1 = LinkedListDeletion()

print("=== Deletion in Linked List ===\n")

# Test 1: Delete at position
for i in range(1, 6):
    list1.add_node(i * 10)

print("Original list: ", end="")
list1.display()

list1.delete_at_position(2)
print("After deleting position 2: ", end="")
list1.display()

# Test 2: Delete by value
list1.delete_by_value(40)
print("After deleting value 40: ", end="")
list1.display()

print("\nComplexity Analysis:")
print("Delete at position: O(n)")
print("Delete by value: O(n)")
print("Delete all occurrences: O(n)")
print("Space: O(1)")
