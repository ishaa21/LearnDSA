// Diameter of Tree in Java

public class DiameterOfTree {
    static class Node {
        int data;
        Node left;
        Node right;
        
        Node(int data) {
            this.data = data;
            this.left = null;
            this.right = null;
        }
    }
    
    static class Result {
        int diameter = 0;
    }
    
    private static int getHeight(Node root) {
        if (root == null) {
            return 0;
        }
        
        return Math.max(getHeight(root.left), getHeight(root.right)) + 1;
    }
    
    public static int getDiameterNaive(Node root) {
        if (root == null) {
            return 0;
        }
        
        int leftHeight = getHeight(root.left);
        int rightHeight = getHeight(root.right);
        int diameterThroughRoot = leftHeight + rightHeight + 1;
        
        int leftDiameter = getDiameterNaive(root.left);
        int rightDiameter = getDiameterNaive(root.right);
        
        return Math.max(diameterThroughRoot, Math.max(leftDiameter, rightDiameter));
    }
    
    public static int getDiameterOptimized(Node root, Result result) {
        if (root == null) {
            return 0;
        }
        
        int leftHeight = getDiameterOptimized(root.left, result);
        int rightHeight = getDiameterOptimized(root.right, result);
        
        int currentDiameter = leftHeight + rightHeight + 1;
        result.diameter = Math.max(result.diameter, currentDiameter);
        
        return Math.max(leftHeight, rightHeight) + 1;
    }
    
    public static void main(String[] args) {
        System.out.println("=== Diameter of Tree (Java) ===\n");
        
        // Create tree
        Node root = new Node(1);
        root.left = new Node(2);
        root.right = new Node(3);
        root.left.left = new Node(4);
        root.left.right = new Node(5);
        root.right.left = new Node(6);
        root.right.right = new Node(7);
        
        System.out.println("Tree structure:");
        System.out.println("         1");
        System.out.println("        / \\");
        System.out.println("       2   3");
        System.out.println("      / \\ / \\");
        System.out.println("     4  5 6  7\n");
        
        System.out.println("Diameter (Naive approach): " + getDiameterNaive(root));
        
        Result result = new Result();
        getDiameterOptimized(root, result);
        System.out.println("Diameter (Optimized approach): " + result.diameter + "\n");
        
        System.out.println("=== Diameter Definition ===");
        System.out.println("Diameter: Longest path between any two nodes in tree");
        System.out.println("Includes: Number of edges in the path\n");
        
        System.out.println("Possible cases for diameter:");
        System.out.println("1. Path passes through root");
        System.out.println("   diameter = leftHeight + rightHeight + 1");
        System.out.println("2. Path entirely in left subtree");
        System.out.println("3. Path entirely in right subtree\n");
        
        System.out.println("=== Complexity Analysis ===");
        System.out.println("Naive Approach:");
        System.out.println("  Time Complexity:  O(n²) - getHeight called for each node");
        System.out.println("  Space Complexity: O(h) - recursion stack\n");
        
        System.out.println("Optimized Approach:");
        System.out.println("  Time Complexity:  O(n) - single pass");
        System.out.println("  Space Complexity: O(h) - recursion stack");
    }
}
