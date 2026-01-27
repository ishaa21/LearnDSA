// Binary Tree in C#

using System;
using System.Collections.Generic;

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

class BinaryTree {
    private Node root;
    
    public BinaryTree() {
        root = null;
    }
    
    public void Insert(int data) {
        if (root == null) {
            root = new Node(data);
            return;
        }
        
        Queue<Node> queue = new Queue<Node>();
        queue.Enqueue(root);
        
        while (queue.Count > 0) {
            Node node = queue.Dequeue();
            
            if (node.Left == null) {
                node.Left = new Node(data);
                break;
            } else {
                queue.Enqueue(node.Left);
            }
            
            if (node.Right == null) {
                node.Right = new Node(data);
                break;
            } else {
                queue.Enqueue(node.Right);
            }
        }
    }
    
    public void Inorder(Node node) {
        if (node == null) return;
        
        Inorder(node.Left);
        Console.Write(node.Data + " ");
        Inorder(node.Right);
    }
    
    public void Preorder(Node node) {
        if (node == null) return;
        
        Console.Write(node.Data + " ");
        Preorder(node.Left);
        Preorder(node.Right);
    }
    
    public void Postorder(Node node) {
        if (node == null) return;
        
        Postorder(node.Left);
        Postorder(node.Right);
        Console.Write(node.Data + " ");
    }
    
    public bool Search(Node node, int data) {
        if (node == null) return false;
        
        if (node.Data == data) return true;
        
        bool left = Search(node.Left, data);
        if (left) return true;
        
        return Search(node.Right, data);
    }
    
    static void Main() {
        Console.WriteLine("=== Binary Tree (C#) ===\n");
        
        BinaryTree bt = new BinaryTree();
        
        Console.WriteLine("Inserting elements: 1, 2, 3, 4, 5, 6, 7");
        for (int i = 1; i <= 7; i++) {
            bt.Insert(i);
        }
        
        Console.Write("\nInorder Traversal (Left-Root-Right): ");
        bt.Inorder(bt.root);
        Console.WriteLine();
        
        Console.Write("Preorder Traversal (Root-Left-Right): ");
        bt.Preorder(bt.root);
        Console.WriteLine();
        
        Console.Write("Postorder Traversal (Left-Right-Root): ");
        bt.Postorder(bt.root);
        Console.WriteLine("\n");
        
        Console.WriteLine("Searching for 5: " + (bt.Search(bt.root, 5) ? "Found" : "Not Found"));
        Console.WriteLine("Searching for 10: " + (bt.Search(bt.root, 10) ? "Found" : "Not Found") + "\n");
        
        Console.WriteLine("=== Binary Tree Structure ===");
        Console.WriteLine("Tree structure:");
        Console.WriteLine("         1");
        Console.WriteLine("        / \\");
        Console.WriteLine("       2   3");
        Console.WriteLine("      / \\ / \\");
        Console.WriteLine("     4  5 6  7\n");
        
        Console.WriteLine("=== Operations Complexity ===");
        Console.WriteLine("Insert:     O(n) in worst case");
        Console.WriteLine("Search:     O(n) in worst case");
        Console.WriteLine("Traversal:  O(n) for all traversals");
        Console.WriteLine("Space:      O(h) where h = height (recursion stack)");
    }
}
