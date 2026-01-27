// Preorder Traversal in Java

import java.util.*;

class Node {
    int data;
    Node left;
    Node right;
    
    Node(int data) {
        this.data = data;
        this.left = null;
        this.right = null;
    }
}

public class PreorderTraversal {
    
    public static void preorderRecursive(Node root) {
        if (root == null) return;
        
        System.out.print(root.data + " ");
        preorderRecursive(root.left);
        preorderRecursive(root.right);
    }
    
    public static void preorderIterative(Node root) {
        Stack<Node> stack = new Stack<>();
        stack.push(root);
        
        while (!stack.isEmpty()) {
            Node node = stack.pop();
            System.out.print(node.data + " ");
            
            if (node.right != null) {
                stack.push(node.right);
            }
            if (node.left != null) {
                stack.push(node.left);
            }
        }
    }
    
    public static void main(String[] args) {
        System.out.println("=== Preorder Traversal (Java) ===\n");
        
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
        
        System.out.print("Recursive Preorder (Root-Left-Right): ");
        preorderRecursive(root);
        System.out.println();
        
        System.out.print("Iterative Preorder (using stack):     ");
        preorderIterative(root);
        System.out.println("\n");
        
        System.out.println("=== Preorder Characteristics ===");
        System.out.println("1. Root → Left subtree → Right subtree");
        System.out.println("2. Root is processed first");
        System.out.println("3. Useful for creating copy of tree");
        System.out.println("4. Useful for prefix expression evaluation\n");
        
        System.out.println("=== Complexity Analysis ===");
        System.out.println("Time Complexity:  O(n) - visit each node once");
        System.out.println("Space Complexity: O(h) - h = height (recursion/stack)");
        System.out.println("                   O(n) worst case (skewed tree)");
    }
}
