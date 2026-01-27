# Traversal of Doubly Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
        self.prev = None

class DoublyLinkedListTraversal:
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
    
    def display_forward(self):
        print("Forward: ", end="")
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
        
        print("Backward: ", end="")
        elements = []
        while temp is not None:
            elements.append(str(temp.data))
            temp = temp.prev
        print(" <-> ".join(elements) + " <-> NULL")
    
    def count_nodes(self):
        count = 0
        temp = self.head
        while temp is not None:
            count += 1
            temp = temp.next
        return count
    
    def get_node(self, pos):
        if pos < 1:
            return None
        temp = self.head
        for i in range(1, pos):
            if temp is None:
                return None
            temp = temp.next
        return temp

# Test
list1 = DoublyLinkedListTraversal()

print("=== Traversal of Doubly Linked List ===\n")

# Build list
for i in range(1, 6):
    list1.add_node(i * 10)

# Test 1: Forward traversal
list1.display_forward()

# Test 2: Backward traversal
list1.display_backward()

# Test 3: Count nodes
print(f"Total nodes: {list1.count_nodes()}")

# Test 4: Get at position
node = list1.get_node(3)
if node is not None:
    print(f"Node at position 3: {node.data}")

print("\nComplexity Analysis:")
print("Forward traversal: O(n)")
print("Backward traversal: O(n)")
print("Count nodes: O(n)")
print("Get at position: O(n)")
