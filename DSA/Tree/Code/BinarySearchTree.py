# Binary Search Tree in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

class BST:
    def __init__(self):
        self.root = None
    
    def insert(self, node, data):
        if node is None:
            return Node(data)
        
        if data < node.data:
            node.left = self.insert(node.left, data)
        elif data > node.data:
            node.right = self.insert(node.right, data)
        
        return node
    
    def search(self, node, data):
        if node is None:
            return None
        
        if data == node.data:
            return node
        elif data < node.data:
            return self.search(node.left, data)
        else:
            return self.search(node.right, data)
    
    def inorder(self, node):
        if node is None:
            return
        
        self.inorder(node.left)
        print(node.data, end=" ")
        self.inorder(node.right)
    
    def insert_value(self, data):
        self.root = self.insert(self.root, data)
    
    def search_value(self, data):
        return self.search(self.root, data) is not None
    
    def print_inorder(self):
        self.inorder(self.root)

# Test
print("=== Binary Search Tree (Python) ===\n")

bst = BST()

print("Inserting: 50, 30, 70, 20, 40, 60, 80")
bst.insert_value(50)
bst.insert_value(30)
bst.insert_value(70)
bst.insert_value(20)
bst.insert_value(40)
bst.insert_value(60)
bst.insert_value(80)

print("Inorder Traversal (Sorted): ", end="")
bst.print_inorder()
print("\n")

print(f"Searching for 40: {'Found' if bst.search_value(40) else 'Not Found'}")
print(f"Searching for 25: {'Found' if bst.search_value(25) else 'Not Found'}\n")

print("=== BST Properties ===")
print("1. Left subtree < Root < Right subtree")
print("2. All nodes in left subtree < root")
print("3. All nodes in right subtree > root")
print("4. Inorder traversal gives sorted sequence")
print("5. No duplicate values\n")

print("=== BST Structure ===")
print("        50")
print("       /  \\")
print("      30   70")
print("     / \\  / \\")
print("    20 40 60 80\n")

print("=== Operations Complexity ===")
print("Average Case (Balanced):")
print("  Search:   O(log n)")
print("  Insert:   O(log n)")
print("  Delete:   O(log n)\n")

print("Worst Case (Skewed):")
print("  Search:   O(n)")
print("  Insert:   O(n)")
print("  Delete:   O(n)")
