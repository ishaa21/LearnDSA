// Doubly Linked List in C#

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

class DoublyLinkedList {
    Node head;
    
    void InsertAtBeginning(int data) {
        Node newNode = new Node(data);
        if (head != null)
            head.prev = newNode;
        newNode.next = head;
        head = newNode;
    }
    
    void InsertAtEnd(int data) {
        Node newNode = new Node(data);
        if (head == null) {
            head = newNode;
            return;
        }
        
        Node temp = head;
        while (temp.next != null)
            temp = temp.next;
        
        temp.next = newNode;
        newNode.prev = temp;
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
        DoublyLinkedList list = new DoublyLinkedList();
        
        Console.WriteLine("=== Doubly Linked List ===\n");
        
        list.InsertAtEnd(10);
        list.InsertAtEnd(20);
        list.InsertAtEnd(30);
        
        Console.Write("Forward: ");
        list.DisplayForward();
        
        Console.Write("Backward: ");
        list.DisplayBackward();
        
        list.InsertAtBeginning(5);
        Console.WriteLine("\nAfter inserting 5 at beginning:");
        Console.Write("Forward: ");
        list.DisplayForward();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Insert at beginning: O(1)");
        Console.WriteLine("Insert at end: O(n)");
        Console.WriteLine("Delete: O(1) with pointer, O(n) without");
        Console.WriteLine("Space: O(n)");
    }
}
