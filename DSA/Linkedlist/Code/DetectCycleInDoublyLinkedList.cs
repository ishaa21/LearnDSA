// Detect Cycle in Doubly Linked List in C#

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

class CycleDetectionDLL {
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
    
    bool DetectCycleForward() {
        if (head == null) return false;
        
        Node slow = head;
        Node fast = head;
        
        while (fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
            
            if (slow == fast)
                return true;
        }
        
        return false;
    }
    
    bool DetectCycleBackward() {
        if (head == null) return false;
        
        Node temp = head;
        while (temp.next != null)
            temp = temp.next;
        
        Node slow = head;
        
        while (temp != null && slow != null) {
            if (temp == slow)
                return true;
            temp = temp.prev;
            if (temp == null) break;
            if (temp == slow)
                return true;
            slow = slow.next;
        }
        
        return false;
    }
    
    static void Main() {
        CycleDetectionDLL list = new CycleDetectionDLL();
        
        Console.WriteLine("=== Detect Cycle in Doubly Linked List ===\n");
        
        // Test 1: No cycle
        list.AddNode(1);
        list.AddNode(2);
        list.AddNode(3);
        
        Console.Write("List 1 (No cycle): ");
        Console.WriteLine(list.DetectCycleForward() ? "Cycle detected" : "No cycle");
        
        // Test 2: With cycle (manual)
        Node head = new Node(1);
        Node n2 = new Node(2);
        Node n3 = new Node(3);
        Node n4 = new Node(4);
        
        head.next = n2;
        n2.prev = head;
        n2.next = n3;
        n3.prev = n2;
        n3.next = n4;
        n4.prev = n3;
        n4.next = n2;
        n2.prev = n4;
        
        Console.Write("List 2 (With cycle): ");
        
        Node slow = head;
        Node fast = head;
        bool hasCycle = false;
        
        while (fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
            
            if (slow == fast) {
                hasCycle = true;
                break;
            }
        }
        
        Console.WriteLine(hasCycle ? "Cycle detected" : "No cycle");
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Forward pointer detection: O(n) time, O(1) space");
        Console.WriteLine("Backward pointer detection: O(n) time, O(1) space");
    }
}
