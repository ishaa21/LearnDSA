// Level Order Traversal in Java

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

public class LevelOrderTraversal {
    
    public static void levelOrder(Node root) {
        Queue<Node> queue = new LinkedList<>();
        queue.add(root);
        
        while (!queue.isEmpty()) {
            Node node = queue.poll();
            System.out.print(node.data + " ");
            
            if (node.left != null) {
                queue.add(node.left);
            }
            if (node.right != null) {
                queue.add(node.right);
            }
        }
    }
    
    public static void main(String[] args) {
        System.out.println("=== Level Order Traversal (Java) ===\n");
        
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
        
        System.out.print("Level Order Traversal (BFS): ");
        levelOrder(root);
        System.out.println("\n");
        
        System.out.println("=== Level Order Characteristics ===");
        System.out.println("1. Visit all nodes at level k before level k+1");
        System.out.println("2. Also called Breadth-First Search (BFS)");
        System.out.println("3. Uses queue data structure");
        System.out.println("4. Useful for finding shortest path in trees\n");
        
        System.out.println("=== Complexity Analysis ===");
        System.out.println("Time Complexity:  O(n) - visit each node once");
        System.out.println("Space Complexity: O(w) - w = maximum width (max nodes at any level)");
        System.out.println("                   O(n) in worst case");
    }
}
