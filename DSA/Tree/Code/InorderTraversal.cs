// Inorder Traversal in C#

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

class InorderTraversal {
    
    public static void InorderRecursive(Node root) {
        if (root == null) return;
        
        InorderRecursive(root.Left);
        Console.Write(root.Data + " ");
        InorderRecursive(root.Right);
    }
    
    public static void InorderIterative(Node root) {
        Stack<Node> stack = new Stack<Node>();
        Node current = root;
        
        while (current != null || stack.Count > 0) {
            while (current != null) {
                stack.Push(current);
                current = current.Left;
            }
            
            current = stack.Pop();
            Console.Write(current.Data + " ");
            current = current.Right;
        }
    }
    
    static void Main() {
        Console.WriteLine("=== Inorder Traversal (C#) ===\n");
        
        // Create tree
        Node root = new Node(1);
        root.Left = new Node(2);
        root.Right = new Node(3);
        root.Left.Left = new Node(4);
        root.Left.Right = new Node(5);
        root.Right.Left = new Node(6);
        root.Right.Right = new Node(7);
        
        Console.WriteLine("Tree structure:");
        Console.WriteLine("         1");
        Console.WriteLine("        / \\");
        Console.WriteLine("       2   3");
        Console.WriteLine("      / \\ / \\");
        Console.WriteLine("     4  5 6  7\n");
        
        Console.Write("Recursive Inorder (Left-Root-Right): ");
        InorderRecursive(root);
        Console.WriteLine();
        
        Console.Write("Iterative Inorder (using stack):     ");
        InorderIterative(root);
        Console.WriteLine("\n");
        
        Console.WriteLine("=== Inorder Characteristics ===");
        Console.WriteLine("1. Left subtree → Root → Right subtree");
        Console.WriteLine("2. For BST: Produces sorted sequence");
        Console.WriteLine("3. Recursive approach: Clean and simple");
        Console.WriteLine("4. Iterative approach: Explicit stack management\n");
        
        Console.WriteLine("=== Complexity Analysis ===");
        Console.WriteLine("Time Complexity:  O(n) - visit each node once");
        Console.WriteLine("Space Complexity: O(h) - h = height (recursion/stack)");
        Console.WriteLine("                   O(n) worst case (skewed tree)");
    }
}
