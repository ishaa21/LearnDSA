// Introduction to Linked List in C#
// Basic structure and node operations

using System;
using System.Collections.Generic;

class Node {
    public int data;
    public Node next;
    
    public Node(int data) {
        this.data = data;
        this.next = null;
    }
}

class LinkedListIntro {
    
    static void InsertAtBeginning(Node head, int data) {
        Node newNode = new Node(data);
        newNode.next = head.next;
        head.next = newNode;
    }
    
    static void InsertAtEnd(Node head, int data) {
        Node newNode = new Node(data);
        
        Node temp = head;
        while (temp.next != null)
            temp = temp.next;
        
        temp.next = newNode;
    }
    
    static void Display(Node head) {
        Node temp = head.next;
        while (temp != null) {
            Console.Write(temp.data + " -> ");
            temp = temp.next;
        }
        Console.WriteLine("NULL");
    }
    
    static int CountNodes(Node head) {
        int count = 0;
        Node temp = head.next;
        while (temp != null) {
            count++;
            temp = temp.next;
        }
        return count;
    }
    
    static bool Search(Node head, int key) {
        Node temp = head.next;
        while (temp != null) {
            if (temp.data == key)
                return true;
            temp = temp.next;
        }
        return false;
    }
    
    static int GetAtIndex(Node head, int index) {
        Node temp = head.next;
        for (int i = 0; i < index; i++) {
            if (temp == null)
                return -1;
            temp = temp.next;
        }
        return (temp != null) ? temp.data : -1;
    }
    
    static void Main() {
        // Create dummy head node
        Node head = new Node(-1);
        
        // Create linked list: 10 -> 20 -> 30 -> NULL
        InsertAtEnd(head, 10);
        InsertAtEnd(head, 20);
        InsertAtEnd(head, 30);
        
        Console.Write("Linked List: ");
        Display(head);
        
        // Insert at beginning
        InsertAtBeginning(head, 5);
        Console.Write("After inserting 5 at beginning: ");
        Display(head);
        
        // Insert at end
        InsertAtEnd(head, 40);
        Console.Write("After inserting 40 at end: ");
        Display(head);
        
        // Count nodes
        Console.WriteLine("Number of nodes: " + CountNodes(head));
        
        // Search
        Console.WriteLine("Search 20: " + (Search(head, 20) ? "Found" : "Not Found"));
        Console.WriteLine("Search 50: " + (Search(head, 50) ? "Found" : "Not Found"));
        
        // Get at index
        Console.WriteLine("Element at index 0: " + GetAtIndex(head, 0));
        Console.WriteLine("Element at index 2: " + GetAtIndex(head, 2));
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Create Node: O(1)");
        Console.WriteLine("Insert at beginning: O(1)");
        Console.WriteLine("Insert at end: O(n)");
        Console.WriteLine("Search: O(n)");
        Console.WriteLine("Display/Traverse: O(n)");
        Console.WriteLine("Space: O(n)");
    }
}
