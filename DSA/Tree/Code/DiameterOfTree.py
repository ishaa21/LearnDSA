# Diameter of Tree in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

class DiameterOfTree:
    @staticmethod
    def get_height(root):
        if root is None:
            return 0
        
        return max(DiameterOfTree.get_height(root.left),
                   DiameterOfTree.get_height(root.right)) + 1
    
    @staticmethod
    def get_diameter_naive(root):
        """Naive approach: O(n²)"""
        if root is None:
            return 0
        
        left_height = DiameterOfTree.get_height(root.left)
        right_height = DiameterOfTree.get_height(root.right)
        diameter_through_root = left_height + right_height + 1
        
        left_diameter = DiameterOfTree.get_diameter_naive(root.left)
        right_diameter = DiameterOfTree.get_diameter_naive(root.right)
        
        return max(diameter_through_root, left_diameter, right_diameter)
    
    @staticmethod
    def get_diameter_optimized(root, diameter_list):
        """Optimized approach: O(n)"""
        if root is None:
            return 0
        
        left_height = DiameterOfTree.get_diameter_optimized(root.left, diameter_list)
        right_height = DiameterOfTree.get_diameter_optimized(root.right, diameter_list)
        
        current_diameter = left_height + right_height + 1
        diameter_list[0] = max(diameter_list[0], current_diameter)
        
        return max(left_height, right_height) + 1

# Test
print("=== Diameter of Tree (Python) ===\n")

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

print(f"Diameter (Naive approach): {DiameterOfTree.get_diameter_naive(root)}")

diameter_list = [0]
DiameterOfTree.get_diameter_optimized(root, diameter_list)
print(f"Diameter (Optimized approach): {diameter_list[0]}\n")

print("=== Diameter Definition ===")
print("Diameter: Longest path between any two nodes in tree")
print("Includes: Number of edges in the path\n")

print("Possible cases for diameter:")
print("1. Path passes through root")
print("   diameter = leftHeight + rightHeight + 1")
print("2. Path entirely in left subtree")
print("3. Path entirely in right subtree\n")

print("=== Complexity Analysis ===")
print("Naive Approach:")
print("  Time Complexity:  O(n²) - getHeight called for each node")
print("  Space Complexity: O(h) - recursion stack\n")

print("Optimized Approach:")
print("  Time Complexity:  O(n) - single pass")
print("  Space Complexity: O(h) - recursion stack")
