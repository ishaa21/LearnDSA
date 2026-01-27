// Reverse Linked List in C#

using System;

class Node {
    public int data;
    public Node next;
    
    public Node(int data) {
        this.data = data;
        this.next = null;
    }
}

class ReverseLinkedList {
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
    
    void ReverseIterative() {
        Node prev = null;
        Node curr = head;
        Node next = null;
        
        while (curr != null) {
            next = curr.next;
            curr.next = prev;
            prev = curr;
            curr = next;
        }
        
        head = prev;
    }
    
    private Node ReverseRecursiveHelper(Node node) {
        if (node == null || node.next == null)
            return node;
        
        Node newHead = ReverseRecursiveHelper(node.next);
        node.next.next = node;
        node.next = null;
        
        return newHead;
    }
    
    void ReverseRecursive() {
        head = ReverseRecursiveHelper(head);
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
        ReverseLinkedList list = new ReverseLinkedList();
        
        Console.WriteLine("=== Reverse Linked List ===\n");
        
        // Test 1: Iterative reverse
        for (int i = 1; i <= 5; i++)
            list.AddNode(i * 10);
        
        Console.Write("Original list: ");
        list.Display();
        
        list.ReverseIterative();
        Console.Write("After iterative reverse: ");
        list.Display();
        
        // Test 2: Recursive reverse
        ReverseLinkedList list2 = new ReverseLinkedList();
        for (int i = 1; i <= 5; i++)
            list2.AddNode(i * 10);
        
        Console.WriteLine("\nOriginal list: ");
        list2.Display();
        
        list2.ReverseRecursive();
        Console.Write("After recursive reverse: ");
        list2.Display();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Iterative reverse: O(n) time, O(1) space");
        Console.WriteLine("Recursive reverse: O(n) time, O(n) space (call stack)");
    }
}
