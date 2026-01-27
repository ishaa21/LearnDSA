// Deletion in BST in Java

public class DeletionBST {
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
    
    public static Node findMin(Node node) {
        while (node.left != null) {
            node = node.left;
        }
        return node;
    }
    
    public static Node deleteNode(Node root, int data) {
        if (root == null) {
            return null;
        }
        
        if (data < root.data) {
            root.left = deleteNode(root.left, data);
        } else if (data > root.data) {
            root.right = deleteNode(root.right, data);
        } else {
            // Case 1: Leaf node
            if (root.left == null && root.right == null) {
                return null;
            }
            
            // Case 2: One child
            if (root.left == null) {
                return root.right;
            }
            if (root.right == null) {
                return root.left;
            }
            
            // Case 3: Two children
            Node successor = findMin(root.right);
            root.data = successor.data;
            root.right = deleteNode(root.right, successor.data);
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
        System.out.println("=== Deletion in BST (Java) ===\n");
        
        Node root = new Node(50);
        root.left = new Node(30);
        root.right = new Node(70);
        root.left.left = new Node(20);
        root.left.right = new Node(40);
        root.right.left = new Node(60);
        root.right.right = new Node(80);
        
        System.out.print("Original Tree (Inorder): ");
        inorder(root);
        System.out.println("\n");
        
        System.out.println("Delete Leaf (20):");
        root = deleteNode(root, 20);
        inorder(root);
        System.out.println("\n");
        
        System.out.println("Delete Node with One Child (30):");
        root = deleteNode(root, 30);
        inorder(root);
        System.out.println("\n");
        
        System.out.println("Delete Node with Two Children (50):");
        root = deleteNode(root, 50);
        inorder(root);
        System.out.println("\n");
        
        System.out.println("=== Deletion Cases ===");
        System.out.println("Case 1: Leaf Node");
        System.out.println("  - Simply remove the node");
        System.out.println("  - Update parent's pointer to null\n");
        
        System.out.println("Case 2: Node with One Child");
        System.out.println("  - Replace node with its child");
        System.out.println("  - Update parent's pointer\n");
        
        System.out.println("Case 3: Node with Two Children");
        System.out.println("  - Find inorder successor (min in right subtree)");
        System.out.println("  - Replace node's data with successor's data");
        System.out.println("  - Delete successor node\n");
        
        System.out.println("=== Deletion Complexity ===");
        System.out.println("Time Complexity:  O(log n) avg, O(n) worst");
        System.out.println("Space Complexity: O(h) for recursion");
    }
}
