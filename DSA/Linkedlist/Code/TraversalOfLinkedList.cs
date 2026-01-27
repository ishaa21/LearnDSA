// Traversal of Linked List in C#

using System;

class Node {
    public int data;
    public Node next;
    
    public Node(int data) {
        this.data = data;
        this.next = null;
    }
}

class LinkedListTraversal {
    Node head;
    
    void AddNode(int data) {
        Node newNode = new Node(data);
        if (head == null) {
            head = newNode;
            return;
        }
        Node temp = head;
        while (temp.next != null) temp = temp.next;
        temp.next = newNode;
    }
    
    void DisplayForward() {
        Console.Write("Forward: ");
        Node temp = head;
        while (temp != null) {
            Console.Write(temp.data + " -> ");
            temp = temp.next;
        }
        Console.WriteLine("NULL");
    }
    
    void DisplayRecursive(Node node) {
        if (node == null) {
            Console.WriteLine("NULL");
            return;
        }
        Console.Write(node.data + " -> ");
        DisplayRecursive(node.next);
    }
    
    int CountNodes(Node node) {
        if (node == null) return 0;
        return 1 + CountNodes(node.next);
    }
    
    Node GetNode(int pos) {
        if (pos < 1) return null;
        Node temp = head;
        for (int i = 1; i < pos && temp != null; i++)
            temp = temp.next;
        return temp;
    }
    
    static void Main() {
        LinkedListTraversal list = new LinkedListTraversal();
        
        Console.WriteLine("=== Traversal of Linked List ===\n");
        
        // Build list
        for (int i = 1; i <= 5; i++)
            list.AddNode(i * 10);
        
        // Test 1: Iterative forward traversal
        list.DisplayForward();
        
        // Test 2: Recursive traversal
        Console.Write("Recursive: ");
        list.DisplayRecursive(list.head);
        
        // Test 3: Count nodes
        Console.WriteLine("Total nodes: " + list.CountNodes(list.head));
        
        // Test 4: Get specific node
        Node node = list.GetNode(3);
        if (node != null)
            Console.WriteLine("Node at position 3: " + node.data);
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Forward traversal: O(n)");
        Console.WriteLine("Recursive traversal: O(n) time, O(n) space (call stack)");
        Console.WriteLine("Count nodes: O(n)");
        Console.WriteLine("Get at position: O(n)");
    }
}
