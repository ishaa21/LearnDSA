# Level Order Traversal in Python

from collections import deque

class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

class LevelOrderTraversal:
    @staticmethod
    def level_order(root):
        """Level Order Traversal (BFS)"""
        queue = deque([root])
        
        while queue:
            node = queue.popleft()
            print(node.data, end=" ")
            
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)

# Test
print("=== Level Order Traversal (Python) ===\n")

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

print("Level Order Traversal (BFS): ", end="")
LevelOrderTraversal.level_order(root)
print("\n")

print("=== Level Order Characteristics ===")
print("1. Visit all nodes at level k before level k+1")
print("2. Also called Breadth-First Search (BFS)")
print("3. Uses queue data structure")
print("4. Useful for finding shortest path in trees\n")

print("=== Complexity Analysis ===")
print("Time Complexity:  O(n) - visit each node once")
print("Space Complexity: O(w) - w = maximum width (max nodes at any level)")
print("                   O(n) in worst case")
