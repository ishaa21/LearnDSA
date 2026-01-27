# Binary Tree in Python

from collections import deque

class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

class BinaryTree:
    def __init__(self):
        self.root = None
    
    def insert(self, data):
        """Insert element in level order"""
        if self.root is None:
            self.root = Node(data)
            return
        
        queue = deque([self.root])
        
        while queue:
            node = queue.popleft()
            
            if node.left is None:
                node.left = Node(data)
                break
            else:
                queue.append(node.left)
            
            if node.right is None:
                node.right = Node(data)
                break
            else:
                queue.append(node.right)
    
    def inorder(self, node):
        """Inorder traversal: Left-Root-Right"""
        if node is None:
            return
        
        self.inorder(node.left)
        print(node.data, end=" ")
        self.inorder(node.right)
    
    def preorder(self, node):
        """Preorder traversal: Root-Left-Right"""
        if node is None:
            return
        
        print(node.data, end=" ")
        self.preorder(node.left)
        self.preorder(node.right)
    
    def postorder(self, node):
        """Postorder traversal: Left-Right-Root"""
        if node is None:
            return
        
        self.postorder(node.left)
        self.postorder(node.right)
        print(node.data, end=" ")
    
    def search(self, node, data):
        """Search for element in binary tree"""
        if node is None:
            return False
        
        if node.data == data:
            return True
        
        left = self.search(node.left, data)
        if left:
            return True
        
        return self.search(node.right, data)

# Test
print("=== Binary Tree (Python) ===\n")

bt = BinaryTree()

print("Inserting elements: 1, 2, 3, 4, 5, 6, 7")
for i in range(1, 8):
    bt.insert(i)

print("\nInorder Traversal (Left-Root-Right): ", end="")
bt.inorder(bt.root)
print()

print("Preorder Traversal (Root-Left-Right): ", end="")
bt.preorder(bt.root)
print()

print("Postorder Traversal (Left-Right-Root): ", end="")
bt.postorder(bt.root)
print("\n")

print(f"Searching for 5: {'Found' if bt.search(bt.root, 5) else 'Not Found'}")
print(f"Searching for 10: {'Found' if bt.search(bt.root, 10) else 'Not Found'}\n")

print("=== Binary Tree Structure ===")
print("Tree structure:")
print("         1")
print("        / \\")
print("       2   3")
print("      / \\ / \\")
print("     4  5 6  7\n")

print("=== Operations Complexity ===")
print("Insert:     O(n) in worst case")
print("Search:     O(n) in worst case")
print("Traversal:  O(n) for all traversals")
print("Space:      O(h) where h = height (recursion stack)")
