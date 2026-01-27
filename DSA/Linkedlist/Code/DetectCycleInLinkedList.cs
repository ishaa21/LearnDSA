// Detect Cycle in Linked List in C#

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

class CycleDetection {
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
    
    // Floyd's Cycle Detection
    bool DetectCycleFloyd() {
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
    
    // Hash Set approach
    bool DetectCycleHashSet() {
        HashSet<Node> visited = new HashSet<Node>();
        Node temp = head;
        
        while (temp != null) {
            if (visited.Contains(temp))
                return true;
            visited.Add(temp);
            temp = temp.next;
        }
        
        return false;
    }
    
    // Find cycle start node
    Node FindCycleStart() {
        if (head == null) return null;
        
        Node slow = head;
        Node fast = head;
        
        while (fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
            
            if (slow == fast)
                break;
        }
        
        if (fast == null || fast.next == null)
            return null;
        
        slow = head;
        while (slow != fast) {
            slow = slow.next;
            fast = fast.next;
        }
        
        return slow;
    }
    
    static void Main() {
        CycleDetection list = new CycleDetection();
        
        Console.WriteLine("=== Detect Cycle in Linked List ===\n");
        
        // Test 1: No cycle
        list.AddNode(1);
        list.AddNode(2);
        list.AddNode(3);
        list.AddNode(4);
        
        Console.Write("List 1 (No cycle): ");
        Console.WriteLine(list.DetectCycleFloyd() ? "Cycle detected" : "No cycle");
        
        // Test 2: With cycle (manual)
        Node head = new Node(1);
        Node n2 = new Node(2);
        Node n3 = new Node(3);
        Node n4 = new Node(4);
        
        head.next = n2;
        n2.next = n3;
        n3.next = n4;
        n4.next = n2;
        
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
        Console.WriteLine("Floyd's Cycle Detection: O(n) time, O(1) space");
        Console.WriteLine("Hash Set approach: O(n) time, O(n) space");
        Console.WriteLine("Find Cycle Start: O(n) time, O(1) space");
    }
}
