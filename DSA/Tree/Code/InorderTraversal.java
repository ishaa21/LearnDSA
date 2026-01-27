// Inorder Traversal in Java

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

public class InorderTraversal {
    
    public static void inorderRecursive(Node root) {
        if (root == null) return;
        
        inorderRecursive(root.left);
        System.out.print(root.data + " ");
        inorderRecursive(root.right);
    }
    
    public static void inorderIterative(Node root) {
        Stack<Node> stack = new Stack<>();
        Node current = root;
        
        while (current != null || !stack.isEmpty()) {
            while (current != null) {
                stack.push(current);
                current = current.left;
            }
            
            current = stack.pop();
            System.out.print(current.data + " ");
            current = current.right;
        }
    }
    
    public static void main(String[] args) {
        System.out.println("=== Inorder Traversal (Java) ===\n");
        
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
        
        System.out.print("Recursive Inorder (Left-Root-Right): ");
        inorderRecursive(root);
        System.out.println();
        
        System.out.print("Iterative Inorder (using stack):     ");
        inorderIterative(root);
        System.out.println("\n");
        
        System.out.println("=== Inorder Characteristics ===");
        System.out.println("1. Left subtree → Root → Right subtree");
        System.out.println("2. For BST: Produces sorted sequence");
        System.out.println("3. Recursive approach: Clean and simple");
        System.out.println("4. Iterative approach: Explicit stack management\n");
        
        System.out.println("=== Complexity Analysis ===");
        System.out.println("Time Complexity:  O(n) - visit each node once");
        System.out.println("Space Complexity: O(h) - h = height (recursion/stack)");
        System.out.println("                   O(n) worst case (skewed tree)");
    }
}
