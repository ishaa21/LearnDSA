// Binary Search Tree in C#

using System;

class BinarySearchTree {
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
    
    private Node root;
    
    public BinarySearchTree() {
        root = null;
    }
    
    public Node Insert(Node node, int data) {
        if (node == null) {
            return new Node(data);
        }
        
        if (data < node.Data) {
            node.Left = Insert(node.Left, data);
        } else if (data > node.Data) {
            node.Right = Insert(node.Right, data);
        }
        
        return node;
    }
    
    public Node Search(Node node, int data) {
        if (node == null) {
            return null;
        }
        
        if (data == node.Data) {
            return node;
        } else if (data < node.Data) {
            return Search(node.Left, data);
        } else {
            return Search(node.Right, data);
        }
    }
    
    public void Inorder(Node node) {
        if (node == null) return;
        
        Inorder(node.Left);
        Console.Write(node.Data + " ");
        Inorder(node.Right);
    }
    
    public void InsertValue(int data) {
        root = Insert(root, data);
    }
    
    public bool SearchValue(int data) {
        return Search(root, data) != null;
    }
    
    public void PrintInorder() {
        Inorder(root);
    }
    
    static void Main() {
        Console.WriteLine("=== Binary Search Tree (C#) ===\n");
        
        BinarySearchTree bst = new BinarySearchTree();
        
        Console.WriteLine("Inserting: 50, 30, 70, 20, 40, 60, 80");
        bst.InsertValue(50);
        bst.InsertValue(30);
        bst.InsertValue(70);
        bst.InsertValue(20);
        bst.InsertValue(40);
        bst.InsertValue(60);
        bst.InsertValue(80);
        
        Console.Write("Inorder Traversal (Sorted): ");
        bst.PrintInorder();
        Console.WriteLine("\n");
        
        Console.WriteLine("Searching for 40: " + (bst.SearchValue(40) ? "Found" : "Not Found"));
        Console.WriteLine("Searching for 25: " + (bst.SearchValue(25) ? "Found" : "Not Found") + "\n");
        
        Console.WriteLine("=== BST Properties ===");
        Console.WriteLine("1. Left subtree < Root < Right subtree");
        Console.WriteLine("2. All nodes in left subtree < root");
        Console.WriteLine("3. All nodes in right subtree > root");
        Console.WriteLine("4. Inorder traversal gives sorted sequence");
        Console.WriteLine("5. No duplicate values\n");
        
        Console.WriteLine("=== BST Structure ===");
        Console.WriteLine("        50");
        Console.WriteLine("       /  \\");
        Console.WriteLine("      30   70");
        Console.WriteLine("     / \\  / \\");
        Console.WriteLine("    20 40 60 80\n");
        
        Console.WriteLine("=== Operations Complexity ===");
        Console.WriteLine("Average Case (Balanced):");
        Console.WriteLine("  Search:   O(log n)");
        Console.WriteLine("  Insert:   O(log n)");
        Console.WriteLine("  Delete:   O(log n)\n");
        
        Console.WriteLine("Worst Case (Skewed):");
        Console.WriteLine("  Search:   O(n)");
        Console.WriteLine("  Insert:   O(n)");
        Console.WriteLine("  Delete:   O(n)");
    }
}
