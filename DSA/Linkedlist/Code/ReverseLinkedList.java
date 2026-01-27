// Reverse Linked List in Java

class Node {
    int data;
    Node next;
    
    Node(int data) {
        this.data = data;
        this.next = null;
    }
}

public class ReverseLinkedList {
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
    
    void reverseIterative() {
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
    
    private Node reverseRecursiveHelper(Node node) {
        if (node == null || node.next == null)
            return node;
        
        Node newHead = reverseRecursiveHelper(node.next);
        node.next.next = node;
        node.next = null;
        
        return newHead;
    }
    
    void reverseRecursive() {
        head = reverseRecursiveHelper(head);
    }
    
    void display() {
        Node temp = head;
        while (temp != null) {
            System.out.print(temp.data + " -> ");
            temp = temp.next;
        }
        System.out.println("NULL");
    }
    
    public static void main(String[] args) {
        ReverseLinkedList list = new ReverseLinkedList();
        
        System.out.println("=== Reverse Linked List ===\n");
        
        // Test 1: Iterative reverse
        for (int i = 1; i <= 5; i++)
            list.addNode(i * 10);
        
        System.out.print("Original list: ");
        list.display();
        
        list.reverseIterative();
        System.out.print("After iterative reverse: ");
        list.display();
        
        // Test 2: Recursive reverse
        ReverseLinkedList list2 = new ReverseLinkedList();
        for (int i = 1; i <= 5; i++)
            list2.addNode(i * 10);
        
        System.out.println("\nOriginal list: ");
        list2.display();
        
        list2.reverseRecursive();
        System.out.print("After recursive reverse: ");
        list2.display();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Iterative reverse: O(n) time, O(1) space");
        System.out.println("Recursive reverse: O(n) time, O(n) space (call stack)");
    }
}
