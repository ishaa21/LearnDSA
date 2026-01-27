// Deletion in Linked List in C#

using System;

class Node {
    public int data;
    public Node next;
    
    public Node(int data) {
        this.data = data;
        this.next = null;
    }
}

class LinkedListDeletion {
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
    
    void DeleteAtPosition(int pos) {
        if (head == null) return;
        
        if (pos == 1) {
            head = head.next;
            return;
        }
        
        Node temp = head;
        for (int i = 1; i < pos - 1 && temp != null; i++)
            temp = temp.next;
        
        if (temp == null || temp.next == null) return;
        
        temp.next = temp.next.next;
    }
    
    void DeleteByValue(int value) {
        if (head == null) return;
        
        if (head.data == value) {
            head = head.next;
            return;
        }
        
        Node temp = head;
        while (temp.next != null && temp.next.data != value)
            temp = temp.next;
        
        if (temp.next != null)
            temp.next = temp.next.next;
    }
    
    void DeleteAllOccurrences(int value) {
        while (head != null && head.data == value)
            head = head.next;
        
        if (head == null) return;
        
        Node temp = head;
        while (temp.next != null) {
            if (temp.next.data == value)
                temp.next = temp.next.next;
            else
                temp = temp.next;
        }
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
        LinkedListDeletion list = new LinkedListDeletion();
        
        Console.WriteLine("=== Deletion in Linked List ===\n");
        
        // Test 1: Delete at position
        for (int i = 1; i <= 5; i++)
            list.AddNode(i * 10);
        
        Console.Write("Original list: ");
        list.Display();
        
        list.DeleteAtPosition(2);
        Console.Write("After deleting position 2: ");
        list.Display();
        
        // Test 2: Delete by value
        list.DeleteByValue(40);
        Console.Write("After deleting value 40: ");
        list.Display();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Delete at position: O(n)");
        Console.WriteLine("Delete by value: O(n)");
        Console.WriteLine("Delete all occurrences: O(n)");
        Console.WriteLine("Space: O(1)");
    }
}
