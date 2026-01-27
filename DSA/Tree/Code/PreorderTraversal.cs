// Preorder Traversal in C#

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

class PreorderTraversal {
    
    public static void PreorderRecursive(Node root) {
        if (root == null) return;
        
        Console.Write(root.Data + " ");
        PreorderRecursive(root.Left);
        PreorderRecursive(root.Right);
    }
    
    public static void PreorderIterative(Node root) {
        Stack<Node> stack = new Stack<Node>();
        stack.Push(root);
        
        while (stack.Count > 0) {
            Node node = stack.Pop();
            Console.Write(node.Data + " ");
            
            if (node.Right != null) {
                stack.Push(node.Right);
            }
            if (node.Left != null) {
                stack.Push(node.Left);
            }
        }
    }
    
    static void Main() {
        Console.WriteLine("=== Preorder Traversal (C#) ===\n");
        
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
        
        Console.Write("Recursive Preorder (Root-Left-Right): ");
        PreorderRecursive(root);
        Console.WriteLine();
        
        Console.Write("Iterative Preorder (using stack):     ");
        PreorderIterative(root);
        Console.WriteLine("\n");
        
        Console.WriteLine("=== Preorder Characteristics ===");
        Console.WriteLine("1. Root → Left subtree → Right subtree");
        Console.WriteLine("2. Root is processed first");
        Console.WriteLine("3. Useful for creating copy of tree");
        Console.WriteLine("4. Useful for prefix expression evaluation\n");
        
        Console.WriteLine("=== Complexity Analysis ===");
        Console.WriteLine("Time Complexity:  O(n) - visit each node once");
        Console.WriteLine("Space Complexity: O(h) - h = height (recursion/stack)");
        Console.WriteLine("                   O(n) worst case (skewed tree)");
    }
}
