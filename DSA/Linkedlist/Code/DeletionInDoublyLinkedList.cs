// Deletion in Doubly Linked List in C#

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

class DoublyLinkedListDeletion {
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
    
    void DeleteAtPosition(int pos) {
        if (head == null) return;
        
        if (pos == 1) {
            head = head.next;
            if (head != null)
                head.prev = null;
            return;
        }
        
        Node temp = head;
        for (int i = 1; i < pos && temp != null; i++)
            temp = temp.next;
        
        if (temp == null) return;
        
        if (temp.next != null)
            temp.next.prev = temp.prev;
        if (temp.prev != null)
            temp.prev.next = temp.next;
    }
    
    void DeleteByValue(int value) {
        if (head == null) return;
        
        if (head.data == value) {
            head = head.next;
            if (head != null)
                head.prev = null;
            return;
        }
        
        Node temp = head;
        while (temp != null && temp.data != value)
            temp = temp.next;
        
        if (temp == null) return;
        
        if (temp.next != null)
            temp.next.prev = temp.prev;
        if (temp.prev != null)
            temp.prev.next = temp.next;
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
        DoublyLinkedListDeletion list = new DoublyLinkedListDeletion();
        
        Console.WriteLine("=== Deletion in Doubly Linked List ===\n");
        
        // Build list
        for (int i = 1; i <= 5; i++)
            list.AddNode(i * 10);
        
        Console.Write("Original list: ");
        list.DisplayForward();
        
        list.DeleteAtPosition(2);
        Console.Write("After deleting position 2: ");
        list.DisplayForward();
        
        list.DeleteByValue(40);
        Console.Write("After deleting value 40: ");
        list.DisplayForward();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Delete at position: O(n)");
        Console.WriteLine("Delete by value: O(n)");
        Console.WriteLine("Space: O(1)");
    }
}
