// Singly Linked List in C#
// Complete implementation of singly linked list operations

using System;

class Node {
    public int data;
    public Node next;
    
    public Node(int data) {
        this.data = data;
        this.next = null;
    }
}

class SinglyLinkedList {
    Node head;
    
    void InsertAtBeginning(int data) {
        Node newNode = new Node(data);
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
    }
    
    void InsertAtPosition(int data, int pos) {
        if (pos == 0) {
            InsertAtBeginning(data);
            return;
        }
        
        Node temp = head;
        for (int i = 0; i < pos - 1 && temp != null; i++)
            temp = temp.next;
        
        if (temp == null) return;
        
        Node newNode = new Node(data);
        newNode.next = temp.next;
        temp.next = newNode;
    }
    
    void DeleteNode(int key) {
        if (head == null) return;
        
        if (head.data == key) {
            head = head.next;
            return;
        }
        
        Node temp = head;
        while (temp.next != null && temp.next.data != key)
            temp = temp.next;
        
        if (temp.next != null)
            temp.next = temp.next.next;
    }
    
    void Display() {
        Node temp = head;
        while (temp != null) {
            Console.Write(temp.data + " -> ");
            temp = temp.next;
        }
        Console.WriteLine("NULL");
    }
    
    bool Search(int key) {
        Node temp = head;
        while (temp != null) {
            if (temp.data == key)
                return true;
            temp = temp.next;
        }
        return false;
    }
    
    static void Main() {
        SinglyLinkedList list = new SinglyLinkedList();
        
        Console.WriteLine("=== Singly Linked List Operations ===\n");
        
        // Insert at end
        list.InsertAtEnd(10);
        list.InsertAtEnd(20);
        list.InsertAtEnd(30);
        list.InsertAtEnd(40);
        
        Console.Write("Initial List: ");
        list.Display();
        
        // Insert at beginning
        list.InsertAtBeginning(5);
        Console.Write("After inserting 5 at beginning: ");
        list.Display();
        
        // Insert at position
        list.InsertAtPosition(15, 2);
        Console.Write("After inserting 15 at position 2: ");
        list.Display();
        
        // Delete nodes
        list.DeleteNode(15);
        Console.Write("After deleting 15: ");
        list.Display();
        
        list.DeleteNode(5);
        Console.Write("After deleting 5: ");
        list.Display();
        
        list.DeleteNode(40);
        Console.Write("After deleting 40: ");
        list.Display();
        
        // Search
        Console.WriteLine("\nSearch 20: " + (list.Search(20) ? "Found" : "Not Found"));
        Console.WriteLine("Search 100: " + (list.Search(100) ? "Found" : "Not Found"));
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Insert at beginning: O(1)");
        Console.WriteLine("Insert at end: O(n)");
        Console.WriteLine("Insert at position: O(n)");
        Console.WriteLine("Delete: O(n)");
        Console.WriteLine("Search: O(n)");
        Console.WriteLine("Space: O(n)");
    }
}
