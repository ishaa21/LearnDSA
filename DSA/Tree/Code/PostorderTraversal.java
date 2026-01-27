// Postorder Traversal in Java

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

public class PostorderTraversal {
    
    public static void postorderRecursive(Node root) {
        if (root == null) return;
        
        postorderRecursive(root.left);
        postorderRecursive(root.right);
        System.out.print(root.data + " ");
    }
    
    public static void postorderIterative(Node root) {
        Stack<Node> stack1 = new Stack<>();
        Stack<Node> stack2 = new Stack<>();
        stack1.push(root);
        
        while (!stack1.isEmpty()) {
            Node node = stack1.pop();
            stack2.push(node);
            
            if (node.left != null) stack1.push(node.left);
            if (node.right != null) stack1.push(node.right);
        }
        
        while (!stack2.isEmpty()) {
            System.out.print(stack2.pop().data + " ");
        }
    }
    
    public static void main(String[] args) {
        System.out.println("=== Postorder Traversal (Java) ===\n");
        
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
        
        System.out.print("Recursive Postorder (Left-Right-Root): ");
        postorderRecursive(root);
        System.out.println();
        
        System.out.print("Iterative Postorder (two stacks):      ");
        postorderIterative(root);
        System.out.println("\n");
        
        System.out.println("=== Postorder Characteristics ===");
        System.out.println("1. Left subtree → Right subtree → Root");
        System.out.println("2. Root is processed last");
        System.out.println("3. Useful for deleting tree");
        System.out.println("4. Useful for postfix expression evaluation\n");
        
        System.out.println("=== Complexity Analysis ===");
        System.out.println("Time Complexity:  O(n) - visit each node once");
        System.out.println("Space Complexity: O(h) - h = height (recursion/stack)");
        System.out.println("                   O(n) worst case (skewed tree)");
    }
}
