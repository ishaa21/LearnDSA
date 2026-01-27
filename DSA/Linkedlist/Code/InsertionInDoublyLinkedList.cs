// Insertion in Doubly Linked List in C#

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

class DoublyLinkedListInsertion {
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
    
    void InsertAtPosition(int data, int pos) {
        if (pos < 1) {
            Console.WriteLine("Invalid position");
            return;
        }
        
        Node newNode = new Node(data);
        
        if (pos == 1) {
            if (head != null)
                head.prev = newNode;
            newNode.next = head;
            head = newNode;
            return;
        }
        
        Node temp = head;
        for (int i = 1; i < pos - 1 && temp != null; i++)
            temp = temp.next;
        
        if (temp == null) {
            Console.WriteLine("Position out of range");
            return;
        }
        
        newNode.next = temp.next;
        newNode.prev = temp;
        if (temp.next != null)
            temp.next.prev = newNode;
        temp.next = newNode;
    }
    
    void DisplayForward() {
        Node temp = head;
        while (temp != null) {
            Console.Write(temp.data + " <-> ");
            temp = temp.next;
        }
        Console.WriteLine("NULL");
    }
    
    static void Main() {
        DoublyLinkedListInsertion list = new DoublyLinkedListInsertion();
        
        Console.WriteLine("=== Insertion in Doubly Linked List ===\n");
        
        list.InsertAtEnd(10);
        list.InsertAtEnd(20);
        list.InsertAtEnd(30);
        
        Console.Write("After end insertions: ");
        list.DisplayForward();
        
        list.InsertAtBeginning(5);
        Console.Write("After beginning insertion: ");
        list.DisplayForward();
        
        list.InsertAtPosition(15, 2);
        Console.Write("After position insertion: ");
        list.DisplayForward();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Insert at beginning: O(1)");
        Console.WriteLine("Insert at end: O(n)");
        Console.WriteLine("Insert at position: O(n)");
        Console.WriteLine("Space: O(1) for operation");
    }
}
