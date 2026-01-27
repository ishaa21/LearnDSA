// Detect Cycle in Doubly Linked List in Java

class Node {
    int data;
    Node next;
    Node prev;
    
    Node(int data) {
        this.data = data;
        this.next = null;
        this.prev = null;
    }
}

public class CycleDetectionDLL {
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
        newNode.prev = temp;
    }
    
    boolean detectCycleForward() {
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
    
    boolean detectCycleBackward() {
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
    
    public static void main(String[] args) {
        CycleDetectionDLL list = new CycleDetectionDLL();
        
        System.out.println("=== Detect Cycle in Doubly Linked List ===\n");
        
        // Test 1: No cycle
        list.addNode(1);
        list.addNode(2);
        list.addNode(3);
        
        System.out.print("List 1 (No cycle): ");
        System.out.println(list.detectCycleForward() ? "Cycle detected" : "No cycle");
        
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
        
        System.out.print("List 2 (With cycle): ");
        
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
        System.out.println("Forward pointer detection: O(n) time, O(1) space");
        System.out.println("Backward pointer detection: O(n) time, O(1) space");
    }
}
