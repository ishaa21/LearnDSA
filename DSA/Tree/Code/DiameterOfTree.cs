// Diameter of Tree in C#

using System;

class DiameterOfTree {
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
    
    class Result {
        public int Diameter { get; set; } = 0;
    }
    
    private static int GetHeight(Node root) {
        if (root == null) {
            return 0;
        }
        
        return Math.Max(GetHeight(root.Left), GetHeight(root.Right)) + 1;
    }
    
    public static int GetDiameterNaive(Node root) {
        if (root == null) {
            return 0;
        }
        
        int leftHeight = GetHeight(root.Left);
        int rightHeight = GetHeight(root.Right);
        int diameterThroughRoot = leftHeight + rightHeight + 1;
        
        int leftDiameter = GetDiameterNaive(root.Left);
        int rightDiameter = GetDiameterNaive(root.Right);
        
        return Math.Max(diameterThroughRoot, Math.Max(leftDiameter, rightDiameter));
    }
    
    public static int GetDiameterOptimized(Node root, Result result) {
        if (root == null) {
            return 0;
        }
        
        int leftHeight = GetDiameterOptimized(root.Left, result);
        int rightHeight = GetDiameterOptimized(root.Right, result);
        
        int currentDiameter = leftHeight + rightHeight + 1;
        result.Diameter = Math.Max(result.Diameter, currentDiameter);
        
        return Math.Max(leftHeight, rightHeight) + 1;
    }
    
    static void Main() {
        Console.WriteLine("=== Diameter of Tree (C#) ===\n");
        
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
        
        Console.WriteLine("Diameter (Naive approach): " + GetDiameterNaive(root));
        
        Result result = new Result();
        GetDiameterOptimized(root, result);
        Console.WriteLine("Diameter (Optimized approach): " + result.Diameter + "\n");
        
        Console.WriteLine("=== Diameter Definition ===");
        Console.WriteLine("Diameter: Longest path between any two nodes in tree");
        Console.WriteLine("Includes: Number of edges in the path\n");
        
        Console.WriteLine("Possible cases for diameter:");
        Console.WriteLine("1. Path passes through root");
        Console.WriteLine("   diameter = leftHeight + rightHeight + 1");
        Console.WriteLine("2. Path entirely in left subtree");
        Console.WriteLine("3. Path entirely in right subtree\n");
        
        Console.WriteLine("=== Complexity Analysis ===");
        Console.WriteLine("Naive Approach:");
        Console.WriteLine("  Time Complexity:  O(n²) - getHeight called for each node");
        Console.WriteLine("  Space Complexity: O(h) - recursion stack\n");
        
        Console.WriteLine("Optimized Approach:");
        Console.WriteLine("  Time Complexity:  O(n) - single pass");
        Console.WriteLine("  Space Complexity: O(h) - recursion stack");
    }
}
