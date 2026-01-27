// Level Order Traversal in C#

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

class LevelOrderTraversal {
    
    public static void LevelOrder(Node root) {
        Queue<Node> queue = new Queue<Node>();
        queue.Enqueue(root);
        
        while (queue.Count > 0) {
            Node node = queue.Dequeue();
            Console.Write(node.Data + " ");
            
            if (node.Left != null) {
                queue.Enqueue(node.Left);
            }
            if (node.Right != null) {
                queue.Enqueue(node.Right);
            }
        }
    }
    
    static void Main() {
        Console.WriteLine("=== Level Order Traversal (C#) ===\n");
        
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
        
        Console.Write("Level Order Traversal (BFS): ");
        LevelOrder(root);
        Console.WriteLine("\n");
        
        Console.WriteLine("=== Level Order Characteristics ===");
        Console.WriteLine("1. Visit all nodes at level k before level k+1");
        Console.WriteLine("2. Also called Breadth-First Search (BFS)");
        Console.WriteLine("3. Uses queue data structure");
        Console.WriteLine("4. Useful for finding shortest path in trees\n");
        
        Console.WriteLine("=== Complexity Analysis ===");
        Console.WriteLine("Time Complexity:  O(n) - visit each node once");
        Console.WriteLine("Space Complexity: O(w) - w = maximum width (max nodes at any level)");
        Console.WriteLine("                   O(n) in worst case");
    }
}
