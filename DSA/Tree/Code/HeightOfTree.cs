// Height of Tree in C#

using System;

class TreeHeight {
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
    
    public static int GetHeight(Node root) {
        if (root == null) {
            return 0;
        }
        
        int leftHeight = GetHeight(root.Left);
        int rightHeight = GetHeight(root.Right);
        
        return Math.Max(leftHeight, rightHeight) + 1;
    }
    
    public static int GetDepth(Node root, Node target, int depth = 0) {
        if (root == null) {
            return -1;
        }
        
        if (root == target) {
            return depth;
        }
        
        int leftDepth = GetDepth(root.Left, target, depth + 1);
        if (leftDepth != -1) return leftDepth;
        
        return GetDepth(root.Right, target, depth + 1);
    }
    
    public static int CountNodes(Node root) {
        if (root == null) {
            return 0;
        }
        
        return 1 + CountNodes(root.Left) + CountNodes(root.Right);
    }
    
    static void Main() {
        Console.WriteLine("=== Height of Tree (C#) ===\n");
        
        // Create tree
        Node root = new Node(1);
        root.Left = new Node(2);
        root.Right = new Node(3);
        root.Left.Left = new Node(4);
        root.Left.Right = new Node(5);
        root.Right.Right = new Node(6);
        root.Right.Right.Right = new Node(7);
        
        Console.WriteLine("Tree structure:");
        Console.WriteLine("         1");
        Console.WriteLine("        / \\");
        Console.WriteLine("       2   3");
        Console.WriteLine("      / \\   \\");
        Console.WriteLine("     4   5   6");
        Console.WriteLine("           \\");
        Console.WriteLine("            7\n");
        
        Console.WriteLine("Height of tree: " + GetHeight(root));
        Console.WriteLine("Number of nodes: " + CountNodes(root) + "\n");
        
        Console.WriteLine("=== Height Analysis ===");
        Console.WriteLine("Minimum height of balanced tree with n nodes:");
        Console.WriteLine("  h_min = ceil(log₂(n+1)) - 1");
        Console.WriteLine("  h_min = ceil(log₂(7+1)) - 1 = 2\n");
        
        Console.WriteLine("Maximum height of skewed tree:");
        Console.WriteLine("  h_max = n - 1 (for n nodes)\n");
        
        Console.WriteLine("=== Height Definition ===");
        Console.WriteLine("Height of node: Distance from node to farthest leaf");
        Console.WriteLine("Height of tree: Height of root node");
        Console.WriteLine("Height of NULL: 0");
        Console.WriteLine("Height of leaf: 1\n");
        
        Console.WriteLine("=== Complexity Analysis ===");
        Console.WriteLine("Time Complexity:  O(n) - visit each node once");
        Console.WriteLine("Space Complexity: O(h) - h = height (recursion stack)");
    }
}
