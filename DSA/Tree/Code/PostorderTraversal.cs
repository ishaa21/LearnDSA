// Postorder Traversal in C#

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

class PostorderTraversal {
    
    public static void PostorderRecursive(Node root) {
        if (root == null) return;
        
        PostorderRecursive(root.Left);
        PostorderRecursive(root.Right);
        Console.Write(root.Data + " ");
    }
    
    public static void PostorderIterative(Node root) {
        Stack<Node> stack1 = new Stack<Node>();
        Stack<Node> stack2 = new Stack<Node>();
        stack1.Push(root);
        
        while (stack1.Count > 0) {
            Node node = stack1.Pop();
            stack2.Push(node);
            
            if (node.Left != null) stack1.Push(node.Left);
            if (node.Right != null) stack1.Push(node.Right);
        }
        
        while (stack2.Count > 0) {
            Console.Write(stack2.Pop().Data + " ");
        }
    }
    
    static void Main() {
        Console.WriteLine("=== Postorder Traversal (C#) ===\n");
        
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
        
        Console.Write("Recursive Postorder (Left-Right-Root): ");
        PostorderRecursive(root);
        Console.WriteLine();
        
        Console.Write("Iterative Postorder (two stacks):      ");
        PostorderIterative(root);
        Console.WriteLine("\n");
        
        Console.WriteLine("=== Postorder Characteristics ===");
        Console.WriteLine("1. Left subtree → Right subtree → Root");
        Console.WriteLine("2. Root is processed last");
        Console.WriteLine("3. Useful for deleting tree");
        Console.WriteLine("4. Useful for postfix expression evaluation\n");
        
        Console.WriteLine("=== Complexity Analysis ===");
        Console.WriteLine("Time Complexity:  O(n) - visit each node once");
        Console.WriteLine("Space Complexity: O(h) - h = height (recursion/stack)");
        Console.WriteLine("                   O(n) worst case (skewed tree)");
    }
}
