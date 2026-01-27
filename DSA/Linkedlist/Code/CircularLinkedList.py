# Circular Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class CircularLinkedList:
    def __init__(self):
        self.head = None
    
    def insert_at_beginning(self, data):
        new_node = Node(data)
        if self.head is None:
            new_node.next = new_node
            self.head = new_node
            return
        
        temp = self.head
        while temp.next != self.head:
            temp = temp.next
        
        new_node.next = self.head
        temp.next = new_node
        self.head = new_node
    
    def insert_at_end(self, data):
        new_node = Node(data)
        if self.head is None:
            new_node.next = new_node
            self.head = new_node
            return
        
        temp = self.head
        while temp.next != self.head:
            temp = temp.next
        
        temp.next = new_node
        new_node.next = self.head
    
    def display(self):
        if self.head is None:
            return
        
        temp = self.head
        elements = []
        while True:
            elements.append(str(temp.data))
            temp = temp.next
            if temp == self.head:
                break
        
        print(" -> ".join(elements) + " -> (back to " + str(self.head.data) + ")")

# Test
cll = CircularLinkedList()

print("=== Circular Linked List ===\n")

cll.insert_at_end(10)
cll.insert_at_end(20)
cll.insert_at_end(30)

print("List: ", end="")
cll.display()

cll.insert_at_beginning(5)
print("After inserting 5 at beginning: ", end="")
cll.display()

cll.insert_at_end(40)
print("After inserting 40 at end: ", end="")
cll.display()

print("\nComplexity Analysis:")
print("Insert at beginning: O(n)")
print("Insert at end: O(n)")
print("Delete: O(n)")
print("Space: O(n)")
