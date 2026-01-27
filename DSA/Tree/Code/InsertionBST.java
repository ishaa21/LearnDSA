// Insertion in BST in Java

public class InsertionBST {
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
    
    public static Node insertRecursive(Node node, int data) {
        if (node == null) {
            return new Node(data);
        }
        
        if (data < node.data) {
            node.left = insertRecursive(node.left, data);
        } else if (data > node.data) {
            node.right = insertRecursive(node.right, data);
        }
        
        return node;
    }
    
    public static Node insertIterative(Node root, int data) {
        Node newNode = new Node(data);
        
        if (root == null) {
            return newNode;
        }
        
        Node current = root;
        Node parent = null;
        
        while (current != null) {
            parent = current;
            if (data < current.data) {
                current = current.left;
            } else if (data > current.data) {
                current = current.right;
            } else {
                return root;
            }
        }
        
        if (data < parent.data) {
            parent.left = newNode;
        } else {
            parent.right = newNode;
        }
        
        return root;
    }
    
    public static void inorder(Node node) {
        if (node == null) return;
        inorder(node.left);
        System.out.print(node.data + " ");
        inorder(node.right);
    }
    
    public static void main(String[] args) {
        System.out.println("=== Insertion in BST (Java) ===\n");
        
        Node root1 = null;
        System.out.println("Recursive Insertion:");
        root1 = insertRecursive(root1, 50);
        root1 = insertRecursive(root1, 30);
        root1 = insertRecursive(root1, 70);
        root1 = insertRecursive(root1, 20);
        root1 = insertRecursive(root1, 40);
        root1 = insertRecursive(root1, 60);
        root1 = insertRecursive(root1, 80);
        System.out.print("Inorder: ");
        inorder(root1);
        System.out.println("\n");
        
        Node root2 = null;
        System.out.println("Iterative Insertion:");
        root2 = insertIterative(root2, 50);
        root2 = insertIterative(root2, 30);
        root2 = insertIterative(root2, 70);
        root2 = insertIterative(root2, 20);
        root2 = insertIterative(root2, 40);
        root2 = insertIterative(root2, 60);
        root2 = insertIterative(root2, 80);
        System.out.print("Inorder: ");
        inorder(root2);
        System.out.println("\n");
        
        System.out.println("=== Insertion Steps ===");
        System.out.println("1. Start at root");
        System.out.println("2. If data < current, go left");
        System.out.println("3. If data > current, go right");
        System.out.println("4. If NULL found, insert new node");
        System.out.println("5. If duplicate, don't insert\n");
        
        System.out.println("=== Insertion Complexity ===");
        System.out.println("Time Complexity:  O(log n) avg, O(n) worst");
        System.out.println("Space Complexity: O(h) for recursion");
        System.out.println("                  O(1) for iteration");
    }
}
