# Preorder Traversal in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

class PreorderTraversal:
    @staticmethod
    def preorder_recursive(root):
        """Recursive preorder: Root-Left-Right"""
        if root is None:
            return
        
        print(root.data, end=" ")
        PreorderTraversal.preorder_recursive(root.left)
        PreorderTraversal.preorder_recursive(root.right)
    
    @staticmethod
    def preorder_iterative(root):
        """Iterative preorder using stack"""
        stack = [root]
        
        while stack:
            node = stack.pop()
            print(node.data, end=" ")
            
            if node.right:
                stack.append(node.right)
            if node.left:
                stack.append(node.left)

# Test
print("=== Preorder Traversal (Python) ===\n")

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

print("Recursive Preorder (Root-Left-Right): ", end="")
PreorderTraversal.preorder_recursive(root)
print()

print("Iterative Preorder (using stack):     ", end="")
PreorderTraversal.preorder_iterative(root)
print("\n")

print("=== Preorder Characteristics ===")
print("1. Root → Left subtree → Right subtree")
print("2. Root is processed first")
print("3. Useful for creating copy of tree")
print("4. Useful for prefix expression evaluation\n")

print("=== Complexity Analysis ===")
print("Time Complexity:  O(n) - visit each node once")
print("Space Complexity: O(h) - h = height (recursion/stack)")
print("                   O(n) worst case (skewed tree)")
