// Deletion in BST in C#

using System;

class DeletionBST {
    class Node {
        public int Data { get; set; }
        public Node Left { get; set; }
        public Node Right { get; set; }
        
        public Node(int data) {
            Data = data;
            Left = null;
            Right = null;
        }
    }
    
    public static Node FindMin(Node node) {
        while (node.Left != null) {
            node = node.Left;
        }
        return node;
    }
    
    public static Node DeleteNode(Node root, int data) {
        if (root == null) {
            return null;
        }
        
        if (data < root.Data) {
            root.Left = DeleteNode(root.Left, data);
        } else if (data > root.Data) {
            root.Right = DeleteNode(root.Right, data);
        } else {
            // Case 1: Leaf node
            if (root.Left == null && root.Right == null) {
                return null;
            }
            
            // Case 2: One child
            if (root.Left == null) {
                return root.Right;
            }
            if (root.Right == null) {
                return root.Left;
            }
            
            // Case 3: Two children
            Node successor = FindMin(root.Right);
            root.Data = successor.Data;
            root.Right = DeleteNode(root.Right, successor.Data);
        }
        
        return root;
    }
    
    public static void Inorder(Node node) {
        if (node == null) return;
        Inorder(node.Left);
        Console.Write(node.Data + " ");
        Inorder(node.Right);
    }
    
    static void Main() {
        Console.WriteLine("=== Deletion in BST (C#) ===\n");
        
        Node root = new Node(50);
        root.Left = new Node(30);
        root.Right = new Node(70);
        root.Left.Left = new Node(20);
        root.Left.Right = new Node(40);
        root.Right.Left = new Node(60);
        root.Right.Right = new Node(80);
        
        Console.Write("Original Tree (Inorder): ");
        Inorder(root);
        Console.WriteLine("\n");
        
        Console.WriteLine("Delete Leaf (20):");
        root = DeleteNode(root, 20);
        Inorder(root);
        Console.WriteLine("\n");
        
        Console.WriteLine("Delete Node with One Child (30):");
        root = DeleteNode(root, 30);
        Inorder(root);
        Console.WriteLine("\n");
        
        Console.WriteLine("Delete Node with Two Children (50):");
        root = DeleteNode(root, 50);
        Inorder(root);
        Console.WriteLine("\n");
        
        Console.WriteLine("=== Deletion Cases ===");
        Console.WriteLine("Case 1: Leaf Node");
        Console.WriteLine("  - Simply remove the node");
        Console.WriteLine("  - Update parent's pointer to null\n");
        
        Console.WriteLine("Case 2: Node with One Child");
        Console.WriteLine("  - Replace node with its child");
        Console.WriteLine("  - Update parent's pointer\n");
        
        Console.WriteLine("Case 3: Node with Two Children");
        Console.WriteLine("  - Find inorder successor (min in right subtree)");
        Console.WriteLine("  - Replace node's data with successor's data");
        Console.WriteLine("  - Delete successor node\n");
        
        Console.WriteLine("=== Deletion Complexity ===");
        Console.WriteLine("Time Complexity:  O(log n) avg, O(n) worst");
        Console.WriteLine("Space Complexity: O(h) for recursion");
    }
}
