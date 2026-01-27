// Height of Tree in Java

public class HeightOfTree {
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
    
    public static int getHeight(Node root) {
        if (root == null) {
            return 0;
        }
        
        int leftHeight = getHeight(root.left);
        int rightHeight = getHeight(root.right);
        
        return Math.max(leftHeight, rightHeight) + 1;
    }
    
    public static int getDepth(Node root, Node target, int depth) {
        if (root == null) {
            return -1;
        }
        
        if (root == target) {
            return depth;
        }
        
        int leftDepth = getDepth(root.left, target, depth + 1);
        if (leftDepth != -1) return leftDepth;
        
        return getDepth(root.right, target, depth + 1);
    }
    
    public static int countNodes(Node root) {
        if (root == null) {
            return 0;
        }
        
        return 1 + countNodes(root.left) + countNodes(root.right);
    }
    
    public static void main(String[] args) {
        System.out.println("=== Height of Tree (Java) ===\n");
        
        // Create tree
        Node root = new Node(1);
        root.left = new Node(2);
        root.right = new Node(3);
        root.left.left = new Node(4);
        root.left.right = new Node(5);
        root.right.right = new Node(6);
        root.right.right.right = new Node(7);
        
        System.out.println("Tree structure:");
        System.out.println("         1");
        System.out.println("        / \\");
        System.out.println("       2   3");
        System.out.println("      / \\   \\");
        System.out.println("     4   5   6");
        System.out.println("           \\");
        System.out.println("            7\n");
        
        System.out.println("Height of tree: " + getHeight(root));
        System.out.println("Number of nodes: " + countNodes(root) + "\n");
        
        System.out.println("=== Height Analysis ===");
        System.out.println("Minimum height of balanced tree with n nodes:");
        System.out.println("  h_min = ceil(log₂(n+1)) - 1");
        System.out.println("  h_min = ceil(log₂(7+1)) - 1 = 2\n");
        
        System.out.println("Maximum height of skewed tree:");
        System.out.println("  h_max = n - 1 (for n nodes)\n");
        
        System.out.println("=== Height Definition ===");
        System.out.println("Height of node: Distance from node to farthest leaf");
        System.out.println("Height of tree: Height of root node");
        System.out.println("Height of NULL: 0");
        System.out.println("Height of leaf: 1\n");
        
        System.out.println("=== Complexity Analysis ===");
        System.out.println("Time Complexity:  O(n) - visit each node once");
        System.out.println("Space Complexity: O(h) - h = height (recursion stack)");
    }
}
