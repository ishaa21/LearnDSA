# Traversal of Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class LinkedListTraversal:
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
    
    def display_forward(self):
        print("Forward: ", end="")
        temp = self.head
        while temp is not None:
            print(f"{temp.data} -> ", end="")
            temp = temp.next
        print("NULL")
    
    def display_recursive(self, node=None):
        if node is None:
            print("Recursive: ", end="")
            node = self.head
        if node is None:
            print("NULL")
            return
        print(f"{node.data} -> ", end="")
        self.display_recursive(node.next)
    
    def count_nodes(self, node=None):
        if node is None:
            node = self.head
        if node is None:
            return 0
        return 1 + self.count_nodes(node.next)
    
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
list1 = LinkedListTraversal()

print("=== Traversal of Linked List ===\n")

# Build list
for i in range(1, 6):
    list1.add_node(i * 10)

# Test 1: Iterative forward traversal
list1.display_forward()

# Test 2: Recursive traversal
list1.display_recursive()

# Test 3: Count nodes
print(f"Total nodes: {list1.count_nodes()}")

# Test 4: Get specific node
node = list1.get_node(3)
if node is not None:
    print(f"Node at position 3: {node.data}")

print("\nComplexity Analysis:")
print("Forward traversal: O(n)")
print("Recursive traversal: O(n) time, O(n) space (call stack)")
print("Count nodes: O(n)")
print("Get at position: O(n)")
