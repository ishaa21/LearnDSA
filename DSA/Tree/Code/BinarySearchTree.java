// Binary Search Tree in Java

public class BinarySearchTree {
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
    
    private Node root;
    
    public BinarySearchTree() {
        root = null;
    }
    
    public Node insert(Node node, int data) {
        if (node == null) {
            return new Node(data);
        }
        
        if (data < node.data) {
            node.left = insert(node.left, data);
        } else if (data > node.data) {
            node.right = insert(node.right, data);
        }
        
        return node;
    }
    
    public Node search(Node node, int data) {
        if (node == null) {
            return null;
        }
        
        if (data == node.data) {
            return node;
        } else if (data < node.data) {
            return search(node.left, data);
        } else {
            return search(node.right, data);
        }
    }
    
    public void inorder(Node node) {
        if (node == null) return;
        
        inorder(node.left);
        System.out.print(node.data + " ");
        inorder(node.right);
    }
    
    public void insertValue(int data) {
        root = insert(root, data);
    }
    
    public boolean searchValue(int data) {
        return search(root, data) != null;
    }
    
    public void printInorder() {
        inorder(root);
    }
    
    public static void main(String[] args) {
        System.out.println("=== Binary Search Tree (Java) ===\n");
        
        BinarySearchTree bst = new BinarySearchTree();
        
        System.out.println("Inserting: 50, 30, 70, 20, 40, 60, 80");
        bst.insertValue(50);
        bst.insertValue(30);
        bst.insertValue(70);
        bst.insertValue(20);
        bst.insertValue(40);
        bst.insertValue(60);
        bst.insertValue(80);
        
        System.out.print("Inorder Traversal (Sorted): ");
        bst.printInorder();
        System.out.println("\n");
        
        System.out.println("Searching for 40: " + (bst.searchValue(40) ? "Found" : "Not Found"));
        System.out.println("Searching for 25: " + (bst.searchValue(25) ? "Found" : "Not Found") + "\n");
        
        System.out.println("=== BST Properties ===");
        System.out.println("1. Left subtree < Root < Right subtree");
        System.out.println("2. All nodes in left subtree < root");
        System.out.println("3. All nodes in right subtree > root");
        System.out.println("4. Inorder traversal gives sorted sequence");
        System.out.println("5. No duplicate values\n");
        
        System.out.println("=== BST Structure ===");
        System.out.println("        50");
        System.out.println("       /  \\");
        System.out.println("      30   70");
        System.out.println("     / \\  / \\");
        System.out.println("    20 40 60 80\n");
        
        System.out.println("=== Operations Complexity ===");
        System.out.println("Average Case (Balanced):");
        System.out.println("  Search:   O(log n)");
        System.out.println("  Insert:   O(log n)");
        System.out.println("  Delete:   O(log n)\n");
        
        System.out.println("Worst Case (Skewed):");
        System.out.println("  Search:   O(n)");
        System.out.println("  Insert:   O(n)");
        System.out.println("  Delete:   O(n)");
    }
}
