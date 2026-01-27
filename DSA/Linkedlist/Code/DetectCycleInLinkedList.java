// Detect Cycle in Linked List in Java

import java.util.HashSet;

class Node {
    int data;
    Node next;
    
    Node(int data) {
        this.data = data;
        this.next = null;
    }
}

public class CycleDetection {
    Node head;
    
    void addNode(int data) {
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
    boolean detectCycleFloyd() {
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
    boolean detectCycleHashSet() {
        HashSet<Node> visited = new HashSet<>();
        Node temp = head;
        
        while (temp != null) {
            if (visited.contains(temp))
                return true;
            visited.add(temp);
            temp = temp.next;
        }
        
        return false;
    }
    
    // Find cycle start node
    Node findCycleStart() {
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
    
    public static void main(String[] args) {
        CycleDetection list = new CycleDetection();
        
        System.out.println("=== Detect Cycle in Linked List ===\n");
        
        // Test 1: No cycle
        list.addNode(1);
        list.addNode(2);
        list.addNode(3);
        list.addNode(4);
        
        System.out.print("List 1 (No cycle): ");
        System.out.println(list.detectCycleFloyd() ? "Cycle detected" : "No cycle");
        
        // Test 2: With cycle (manual)
        Node head = new Node(1);
        Node n2 = new Node(2);
        Node n3 = new Node(3);
        Node n4 = new Node(4);
        
        head.next = n2;
        n2.next = n3;
        n3.next = n4;
        n4.next = n2; // Creates cycle
        
        System.out.print("List 2 (With cycle): ");
        
        // Detect using Floyd's algorithm
        Node slow = head;
        Node fast = head;
        boolean hasCycle = false;
        
        while (fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
            
            if (slow == fast) {
                hasCycle = true;
                break;
            }
        }
        
        System.out.println(hasCycle ? "Cycle detected" : "No cycle");
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Floyd's Cycle Detection: O(n) time, O(1) space");
        System.out.println("Hash Set approach: O(n) time, O(n) space");
        System.out.println("Find Cycle Start: O(n) time, O(1) space");
    }
}
