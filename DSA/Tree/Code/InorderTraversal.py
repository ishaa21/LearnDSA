# Inorder Traversal in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

class InorderTraversal:
    @staticmethod
    def inorder_recursive(root):
        """Recursive inorder: Left-Root-Right"""
        if root is None:
            return
        
        InorderTraversal.inorder_recursive(root.left)
        print(root.data, end=" ")
        InorderTraversal.inorder_recursive(root.right)
    
    @staticmethod
    def inorder_iterative(root):
        """Iterative inorder using stack"""
        stack = []
        current = root
        
        while current or stack:
            while current:
                stack.append(current)
                current = current.left
            
            current = stack.pop()
            print(current.data, end=" ")
            current = current.right

# Test
print("=== Inorder Traversal (Python) ===\n")

# Create tree
root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left.left = Node(4)
root.left.right = Node(5)
root.right.left = Node(6)
root.right.right = Node(7)

print("Tree structure:")
print("         1")
print("        / \\")
print("       2   3")
print("      / \\ / \\")
print("     4  5 6  7\n")

print("Recursive Inorder (Left-Root-Right): ", end="")
InorderTraversal.inorder_recursive(root)
print()

print("Iterative Inorder (using stack):     ", end="")
InorderTraversal.inorder_iterative(root)
print("\n")

print("=== Inorder Characteristics ===")
print("1. Left subtree → Root → Right subtree")
print("2. For BST: Produces sorted sequence")
print("3. Recursive approach: Clean and simple")
print("4. Iterative approach: Explicit stack management\n")

print("=== Complexity Analysis ===")
print("Time Complexity:  O(n) - visit each node once")
print("Space Complexity: O(h) - h = height (recursion/stack)")
print("                   O(n) worst case (skewed tree)")
