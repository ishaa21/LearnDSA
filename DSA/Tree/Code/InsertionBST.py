# Insertion in BST in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

class BST:
    @staticmethod
    def insert_recursive(node, data):
        """Recursive insertion"""
        if node is None:
            return Node(data)
        
        if data < node.data:
            node.left = BST.insert_recursive(node.left, data)
        elif data > node.data:
            node.right = BST.insert_recursive(node.right, data)
        
        return node
    
    @staticmethod
    def insert_iterative(root, data):
        """Iterative insertion"""
        new_node = Node(data)
        
        if root is None:
            return new_node
        
        current = root
        parent = None
        
        while current:
            parent = current
            if data < current.data:
                current = current.left
            elif data > current.data:
                current = current.right
            else:
                return root
        
        if data < parent.data:
            parent.left = new_node
        else:
            parent.right = new_node
        
        return root
    
    @staticmethod
    def inorder(node):
        if node is None:
            return
        BST.inorder(node.left)
        print(node.data, end=" ")
        BST.inorder(node.right)

# Test
print("=== Insertion in BST (Python) ===\n")

root1 = None
print("Recursive Insertion:")
root1 = BST.insert_recursive(root1, 50)
root1 = BST.insert_recursive(root1, 30)
root1 = BST.insert_recursive(root1, 70)
root1 = BST.insert_recursive(root1, 20)
root1 = BST.insert_recursive(root1, 40)
root1 = BST.insert_recursive(root1, 60)
root1 = BST.insert_recursive(root1, 80)
print("Inorder: ", end="")
BST.inorder(root1)
print("\n")

root2 = None
print("Iterative Insertion:")
root2 = BST.insert_iterative(root2, 50)
root2 = BST.insert_iterative(root2, 30)
root2 = BST.insert_iterative(root2, 70)
root2 = BST.insert_iterative(root2, 20)
root2 = BST.insert_iterative(root2, 40)
root2 = BST.insert_iterative(root2, 60)
root2 = BST.insert_iterative(root2, 80)
print("Inorder: ", end="")
BST.inorder(root2)
print("\n")

print("=== Insertion Steps ===")
print("1. Start at root")
print("2. If data < current, go left")
print("3. If data > current, go right")
print("4. If NULL found, insert new node")
print("5. If duplicate, don't insert\n")

print("=== Insertion Complexity ===")
print("Time Complexity:  O(log n) avg, O(n) worst")
print("Space Complexity: O(h) for recursion")
print("                  O(1) for iteration")
