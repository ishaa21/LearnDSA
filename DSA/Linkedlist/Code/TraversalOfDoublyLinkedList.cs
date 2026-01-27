// Traversal of Doubly Linked List in C#

using System;

class Node {
    public int data;
    public Node next;
    public Node prev;
    
    public Node(int data) {
        this.data = data;
        this.next = null;
        this.prev = null;
    }
}

class DoublyLinkedListTraversal {
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
        newNode.prev = temp;
    }
    
    void DisplayForward() {
        Console.Write("Forward: ");
        Node temp = head;
        while (temp != null) {
            Console.Write(temp.data + " <-> ");
            temp = temp.next;
        }
        Console.WriteLine("NULL");
    }
    
    void DisplayBackward() {
        if (head == null) return;
        
        Node temp = head;
        while (temp.next != null)
            temp = temp.next;
        
        Console.Write("Backward: ");
        while (temp != null) {
            Console.Write(temp.data + " <-> ");
            temp = temp.prev;
        }
        Console.WriteLine("NULL");
    }
    
    int CountNodes() {
        int count = 0;
        Node temp = head;
        while (temp != null) {
            count++;
            temp = temp.next;
        }
        return count;
    }
    
    Node GetNode(int pos) {
        if (pos < 1) return null;
        Node temp = head;
        for (int i = 1; i < pos && temp != null; i++)
            temp = temp.next;
        return temp;
    }
    
    static void Main() {
        DoublyLinkedListTraversal list = new DoublyLinkedListTraversal();
        
        Console.WriteLine("=== Traversal of Doubly Linked List ===\n");
        
        // Build list
        for (int i = 1; i <= 5; i++)
            list.AddNode(i * 10);
        
        // Test 1: Forward traversal
        list.DisplayForward();
        
        // Test 2: Backward traversal
        list.DisplayBackward();
        
        // Test 3: Count nodes
        Console.WriteLine("Total nodes: " + list.CountNodes());
        
        // Test 4: Get at position
        Node node = list.GetNode(3);
        if (node != null)
            Console.WriteLine("Node at position 3: " + node.data);
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Forward traversal: O(n)");
        Console.WriteLine("Backward traversal: O(n)");
        Console.WriteLine("Count nodes: O(n)");
        Console.WriteLine("Get at position: O(n)");
    }
}
