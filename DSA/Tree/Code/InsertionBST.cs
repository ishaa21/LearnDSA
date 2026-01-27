// Insertion in BST in C#

using System;

class InsertionBST {
    class Node {
        public int Data { get; set; }
        public Node Left { get; set; }
        public Node Right { get; set; }
        
        public Node(int data) {
            Data = data;
            Left = null;
            Right = null;
        }
    }
    
    public static Node InsertRecursive(Node node, int data) {
        if (node == null) {
            return new Node(data);
        }
        
        if (data < node.Data) {
            node.Left = InsertRecursive(node.Left, data);
        } else if (data > node.Data) {
            node.Right = InsertRecursive(node.Right, data);
        }
        
        return node;
    }
    
    public static Node InsertIterative(Node root, int data) {
        Node newNode = new Node(data);
        
        if (root == null) {
            return newNode;
        }
        
        Node current = root;
        Node parent = null;
        
        while (current != null) {
            parent = current;
            if (data < current.Data) {
                current = current.Left;
            } else if (data > current.Data) {
                current = current.Right;
            } else {
                return root;
            }
        }
        
        if (data < parent.Data) {
            parent.Left = newNode;
        } else {
            parent.Right = newNode;
        }
        
        return root;
    }
    
    public static void Inorder(Node node) {
        if (node == null) return;
        Inorder(node.Left);
        Console.Write(node.Data + " ");
        Inorder(node.Right);
    }
    
    static void Main() {
        Console.WriteLine("=== Insertion in BST (C#) ===\n");
        
        Node root1 = null;
        Console.WriteLine("Recursive Insertion:");
        root1 = InsertRecursive(root1, 50);
        root1 = InsertRecursive(root1, 30);
        root1 = InsertRecursive(root1, 70);
        root1 = InsertRecursive(root1, 20);
        root1 = InsertRecursive(root1, 40);
        root1 = InsertRecursive(root1, 60);
        root1 = InsertRecursive(root1, 80);
        Console.Write("Inorder: ");
        Inorder(root1);
        Console.WriteLine("\n");
        
        Node root2 = null;
        Console.WriteLine("Iterative Insertion:");
        root2 = InsertIterative(root2, 50);
        root2 = InsertIterative(root2, 30);
        root2 = InsertIterative(root2, 70);
        root2 = InsertIterative(root2, 20);
        root2 = InsertIterative(root2, 40);
        root2 = InsertIterative(root2, 60);
        root2 = InsertIterative(root2, 80);
        Console.Write("Inorder: ");
        Inorder(root2);
        Console.WriteLine("\n");
        
        Console.WriteLine("=== Insertion Steps ===");
        Console.WriteLine("1. Start at root");
        Console.WriteLine("2. If data < current, go left");
        Console.WriteLine("3. If data > current, go right");
        Console.WriteLine("4. If NULL found, insert new node");
        Console.WriteLine("5. If duplicate, don't insert\n");
        
        Console.WriteLine("=== Insertion Complexity ===");
        Console.WriteLine("Time Complexity:  O(log n) avg, O(n) worst");
        Console.WriteLine("Space Complexity: O(h) for recursion");
        Console.WriteLine("                  O(1) for iteration");
    }
}
