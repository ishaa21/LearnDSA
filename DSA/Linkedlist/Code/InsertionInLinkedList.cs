// Insertion in Linked List in C#

using System;

class Node {
    public int data;
    public Node next;
    
    public Node(int data) {
        this.data = data;
        this.next = null;
    }
}

class LinkedListInsertion {
    Node head;
    
    void InsertAtPosition(int data, int pos) {
        if (pos < 1) {
            Console.WriteLine("Invalid position");
            return;
        }
        
        Node newNode = new Node(data);
        
        if (pos == 1) {
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
        temp.next = newNode;
    }
    
    void InsertSorted(int data) {
        Node newNode = new Node(data);
        
        if (head == null || head.data >= data) {
            newNode.next = head;
            head = newNode;
            return;
        }
        
        Node temp = head;
        while (temp.next != null && temp.next.data < data)
            temp = temp.next;
        
        newNode.next = temp.next;
        temp.next = newNode;
    }
    
    void Display() {
        Node temp = head;
        while (temp != null) {
            Console.Write(temp.data + " -> ");
            temp = temp.next;
        }
        Console.WriteLine("NULL");
    }
    
    static void Main() {
        LinkedListInsertion list = new LinkedListInsertion();
        
        Console.WriteLine("=== Insertion in Linked List ===\n");
        
        // Test 1: Insert at position
        list.InsertAtPosition(10, 1);
        list.InsertAtPosition(20, 2);
        list.InsertAtPosition(30, 3);
        list.InsertAtPosition(15, 2);
        
        Console.Write("After position-based insertions: ");
        list.Display();
        
        LinkedListInsertion list2 = new LinkedListInsertion();
        
        // Test 2: Insert in sorted order
        list2.InsertSorted(20);
        list2.InsertSorted(10);
        list2.InsertSorted(30);
        list2.InsertSorted(15);
        list2.InsertSorted(25);
        
        Console.Write("After sorted insertions: ");
        list2.Display();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Insert at position: O(n)");
        Console.WriteLine("Insert sorted: O(n)");
        Console.WriteLine("Space: O(1) for operation, O(n) for list");
    }
}
