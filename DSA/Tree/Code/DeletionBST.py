# Deletion in BST in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

class BST:
    @staticmethod
    def find_min(node):
        """Find minimum value node"""
        while node.left:
            node = node.left
        return node
    
    @staticmethod
    def delete_node(root, data):
        """Delete node from BST"""
        if root is None:
            return None
        
        if data < root.data:
            root.left = BST.delete_node(root.left, data)
        elif data > root.data:
            root.right = BST.delete_node(root.right, data)
        else:
            # Case 1: Leaf node
            if root.left is None and root.right is None:
                return None
            
            # Case 2: One child
            if root.left is None:
                return root.right
            if root.right is None:
                return root.left
            
            # Case 3: Two children
            successor = BST.find_min(root.right)
            root.data = successor.data
            root.right = BST.delete_node(root.right, successor.data)
        
        return root
    
    @staticmethod
    def inorder(node):
        if node is None:
            return
        BST.inorder(node.left)
        print(node.data, end=" ")
        BST.inorder(node.right)

# Test
print("=== Deletion in BST (Python) ===\n")

root = Node(50)
root.left = Node(30)
root.right = Node(70)
root.left.left = Node(20)
root.left.right = Node(40)
root.right.left = Node(60)
root.right.right = Node(80)

print("Original Tree (Inorder): ", end="")
BST.inorder(root)
print("\n")

print("Delete Leaf (20):")
root = BST.delete_node(root, 20)
BST.inorder(root)
print("\n")

print("Delete Node with One Child (30):")
root = BST.delete_node(root, 30)
BST.inorder(root)
print("\n")

print("Delete Node with Two Children (50):")
root = BST.delete_node(root, 50)
BST.inorder(root)
print("\n")

print("=== Deletion Cases ===")
print("Case 1: Leaf Node")
print("  - Simply remove the node")
print("  - Update parent's pointer to None\n")

print("Case 2: Node with One Child")
print("  - Replace node with its child")
print("  - Update parent's pointer\n")

print("Case 3: Node with Two Children")
print("  - Find inorder successor (min in right subtree)")
print("  - Replace node's data with successor's data")
print("  - Delete successor node\n")

print("=== Deletion Complexity ===")
print("Time Complexity:  O(log n) avg, O(n) worst")
print("Space Complexity: O(h) for recursion")
