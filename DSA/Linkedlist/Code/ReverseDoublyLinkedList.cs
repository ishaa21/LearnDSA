// Reverse Doubly Linked List in C#

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

class ReverseDoublyLinkedList {
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
    
    void ReverseIterative() {
        if (head == null) return;
        
        Node temp = null;
        Node curr = head;
        
        while (curr != null) {
            temp = curr.prev;
            curr.prev = curr.next;
            curr.next = temp;
            curr = curr.prev;
        }
        
        if (temp != null)
            head = temp.prev;
    }
    
    void DisplayForward() {
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
        
        while (temp != null) {
            Console.Write(temp.data + " <-> ");
            temp = temp.prev;
        }
        Console.WriteLine("NULL");
    }
    
    static void Main() {
        ReverseDoublyLinkedList list = new ReverseDoublyLinkedList();
        
        Console.WriteLine("=== Reverse Doubly Linked List ===\n");
        
        // Build list
        for (int i = 1; i <= 5; i++)
            list.AddNode(i * 10);
        
        Console.Write("Original (Forward): ");
        list.DisplayForward();
        
        Console.Write("Original (Backward): ");
        list.DisplayBackward();
        
        list.ReverseIterative();
        
        Console.WriteLine("\nAfter reverse (Forward): ");
        list.DisplayForward();
        
        Console.Write("After reverse (Backward): ");
        list.DisplayBackward();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Reverse: O(n) time, O(1) space");
    }
}
