# Postorder Traversal in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

class PostorderTraversal:
    @staticmethod
    def postorder_recursive(root):
        """Recursive postorder: Left-Right-Root"""
        if root is None:
            return
        
        PostorderTraversal.postorder_recursive(root.left)
        PostorderTraversal.postorder_recursive(root.right)
        print(root.data, end=" ")
    
    @staticmethod
    def postorder_iterative(root):
        """Iterative postorder using two stacks"""
        stack1 = [root]
        stack2 = []
        
        while stack1:
            node = stack1.pop()
            stack2.append(node)
            
            if node.left:
                stack1.append(node.left)
            if node.right:
                stack1.append(node.right)
        
        while stack2:
            print(stack2.pop().data, end=" ")

# Test
print("=== Postorder Traversal (Python) ===\n")

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

print("Recursive Postorder (Left-Right-Root): ", end="")
PostorderTraversal.postorder_recursive(root)
print()

print("Iterative Postorder (two stacks):      ", end="")
PostorderTraversal.postorder_iterative(root)
print("\n")

print("=== Postorder Characteristics ===")
print("1. Left subtree → Right subtree → Root")
print("2. Root is processed last")
print("3. Useful for deleting tree")
print("4. Useful for postfix expression evaluation\n")

print("=== Complexity Analysis ===")
print("Time Complexity:  O(n) - visit each node once")
print("Space Complexity: O(h) - h = height (recursion/stack)")
print("                   O(n) worst case (skewed tree)")
