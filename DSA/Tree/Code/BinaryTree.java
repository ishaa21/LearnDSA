// Binary Tree in Java

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

public class BinaryTree {
    private Node root;
    
    public BinaryTree() {
        root = null;
    }
    
    public void insert(int data) {
        if (root == null) {
            root = new Node(data);
            return;
        }
        
        Queue<Node> queue = new LinkedList<>();
        queue.add(root);
        
        while (!queue.isEmpty()) {
            Node node = queue.poll();
            
            if (node.left == null) {
                node.left = new Node(data);
                break;
            } else {
                queue.add(node.left);
            }
            
            if (node.right == null) {
                node.right = new Node(data);
                break;
            } else {
                queue.add(node.right);
            }
        }
    }
    
    public void inorder(Node node) {
        if (node == null) return;
        
        inorder(node.left);
        System.out.print(node.data + " ");
        inorder(node.right);
    }
    
    public void preorder(Node node) {
        if (node == null) return;
        
        System.out.print(node.data + " ");
        preorder(node.left);
        preorder(node.right);
    }
    
    public void postorder(Node node) {
        if (node == null) return;
        
        postorder(node.left);
        postorder(node.right);
        System.out.print(node.data + " ");
    }
    
    public boolean search(Node node, int data) {
        if (node == null) return false;
        
        if (node.data == data) return true;
        
        boolean left = search(node.left, data);
        if (left) return true;
        
        return search(node.right, data);
    }
    
    public static void main(String[] args) {
        System.out.println("=== Binary Tree (Java) ===\n");
        
        BinaryTree bt = new BinaryTree();
        
        System.out.println("Inserting elements: 1, 2, 3, 4, 5, 6, 7");
        for (int i = 1; i <= 7; i++) {
            bt.insert(i);
        }
        
        System.out.print("\nInorder Traversal (Left-Root-Right): ");
        bt.inorder(bt.root);
        System.out.println();
        
        System.out.print("Preorder Traversal (Root-Left-Right): ");
        bt.preorder(bt.root);
        System.out.println();
        
        System.out.print("Postorder Traversal (Left-Right-Root): ");
        bt.postorder(bt.root);
        System.out.println("\n");
        
        System.out.println("Searching for 5: " + (bt.search(bt.root, 5) ? "Found" : "Not Found"));
        System.out.println("Searching for 10: " + (bt.search(bt.root, 10) ? "Found" : "Not Found") + "\n");
        
        System.out.println("=== Binary Tree Structure ===");
        System.out.println("Tree structure:");
        System.out.println("         1");
        System.out.println("        / \\");
        System.out.println("       2   3");
        System.out.println("      / \\ / \\");
        System.out.println("     4  5 6  7\n");
        
        System.out.println("=== Operations Complexity ===");
        System.out.println("Insert:     O(n) in worst case");
        System.out.println("Search:     O(n) in worst case");
        System.out.println("Traversal:  O(n) for all traversals");
        System.out.println("Space:      O(h) where h = height (recursion stack)");
    }
}
