// Circular Linked List in C#

using System;

class Node {
    public int data;
    public Node next;
    
    public Node(int data) {
        this.data = data;
        this.next = null;
    }
}

class CircularLinkedList {
    Node head;
    
    void InsertAtBeginning(int data) {
        Node newNode = new Node(data);
        if (head == null) {
            newNode.next = newNode;
            head = newNode;
            return;
        }
        
        Node temp = head;
        while (temp.next != head)
            temp = temp.next;
        
        newNode.next = head;
        temp.next = newNode;
        head = newNode;
    }
    
    void InsertAtEnd(int data) {
        Node newNode = new Node(data);
        if (head == null) {
            newNode.next = newNode;
            head = newNode;
            return;
        }
        
        Node temp = head;
        while (temp.next != head)
            temp = temp.next;
        
        temp.next = newNode;
        newNode.next = head;
    }
    
    void Display() {
        if (head == null) return;
        
        Node temp = head;
        do {
            Console.Write(temp.data + " -> ");
            temp = temp.next;
        } while (temp != head);
        Console.WriteLine("(back to " + head.data + ")");
    }
    
    static void Main() {
        CircularLinkedList list = new CircularLinkedList();
        
        Console.WriteLine("=== Circular Linked List ===\n");
        
        list.InsertAtEnd(10);
        list.InsertAtEnd(20);
        list.InsertAtEnd(30);
        
        Console.Write("List: ");
        list.Display();
        
        list.InsertAtBeginning(5);
        Console.Write("After inserting 5 at beginning: ");
        list.Display();
        
        list.InsertAtEnd(40);
        Console.Write("After inserting 40 at end: ");
        list.Display();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Insert at beginning: O(n)");
        Console.WriteLine("Insert at end: O(n)");
        Console.WriteLine("Delete: O(n)");
        Console.WriteLine("Space: O(n)");
    }
}
