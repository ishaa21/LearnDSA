# Reverse Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class ReverseLinkedList:
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
    
    def reverse_iterative(self):
        prev = None
        curr = self.head
        next_node = None
        
        while curr is not None:
            next_node = curr.next
            curr.next = prev
            prev = curr
            curr = next_node
        
        self.head = prev
    
    def reverse_recursive_helper(self, node):
        if node is None or node.next is None:
            return node
        
        new_head = self.reverse_recursive_helper(node.next)
        node.next.next = node
        node.next = None
        
        return new_head
    
    def reverse_recursive(self):
        self.head = self.reverse_recursive_helper(self.head)
    
    def display(self):
        temp = self.head
        elements = []
        while temp is not None:
            elements.append(str(temp.data))
            temp = temp.next
        print(" -> ".join(elements) + " -> NULL")

# Test
print("=== Reverse Linked List ===\n")

# Test 1: Iterative reverse
list1 = ReverseLinkedList()
for i in range(1, 6):
    list1.add_node(i * 10)

print("Original list: ", end="")
list1.display()

list1.reverse_iterative()
print("After iterative reverse: ", end="")
list1.display()

# Test 2: Recursive reverse
print()
list2 = ReverseLinkedList()
for i in range(1, 6):
    list2.add_node(i * 10)

print("Original list: ", end="")
list2.display()

list2.reverse_recursive()
print("After recursive reverse: ", end="")
list2.display()

print("\nComplexity Analysis:")
print("Iterative reverse: O(n) time, O(1) space")
print("Recursive reverse: O(n) time, O(n) space (call stack)")
