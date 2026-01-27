# Height of Tree in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

class TreeHeight:
    @staticmethod
    def get_height(root):
        """Calculate height of tree"""
        if root is None:
            return 0
        
        left_height = TreeHeight.get_height(root.left)
        right_height = TreeHeight.get_height(root.right)
        
        return max(left_height, right_height) + 1
    
    @staticmethod
    def get_depth(root, target, depth=0):
        """Calculate depth (distance from root)"""
        if root is None:
            return -1
        
        if root == target:
            return depth
        
        left_depth = TreeHeight.get_depth(root.left, target, depth + 1)
        if left_depth != -1:
            return left_depth
        
        return TreeHeight.get_depth(root.right, target, depth + 1)
    
    @staticmethod
    def count_nodes(root):
        """Count total nodes in tree"""
        if root is None:
            return 0
        
        return 1 + TreeHeight.count_nodes(root.left) + TreeHeight.count_nodes(root.right)

# Test
print("=== Height of Tree (Python) ===\n")

# Create tree
root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left.left = Node(4)
root.left.right = Node(5)
root.right.right = Node(6)
root.right.right.right = Node(7)

print("Tree structure:")
print("         1")
print("        / \\")
print("       2   3")
print("      / \\   \\")
print("     4   5   6")
print("           \\")
print("            7\n")

print(f"Height of tree: {TreeHeight.get_height(root)}")
print(f"Number of nodes: {TreeHeight.count_nodes(root)}\n")

print("=== Height Analysis ===")
print("Minimum height of balanced tree with n nodes:")
print("  h_min = ceil(log₂(n+1)) - 1")
print("  h_min = ceil(log₂(7+1)) - 1 = 2\n")

print("Maximum height of skewed tree:")
print("  h_max = n - 1 (for n nodes)\n")

print("=== Height Definition ===")
print("Height of node: Distance from node to farthest leaf")
print("Height of tree: Height of root node")
print("Height of NULL: 0")
print("Height of leaf: 1\n")

print("=== Complexity Analysis ===")
print("Time Complexity:  O(n) - visit each node once")
print("Space Complexity: O(h) - h = height (recursion stack)")
