// Reverse Doubly Linked List in Java

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

public class ReverseDoublyLinkedList {
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
    
    void reverseIterative() {
        if (head == null) return;
        
        Node temp = null;
        Node curr = head;
        
        while (curr != null) {
            temp = curr.prev;
            curr.prev = curr.next;
            curr.next = temp;
            curr = curr.prev;
        }
        
        if (temp != null)
            head = temp.prev;
    }
    
    void displayForward() {
        Node temp = head;
        while (temp != null) {
            System.out.print(temp.data + " <-> ");
            temp = temp.next;
        }
        System.out.println("NULL");
    }
    
    void displayBackward() {
        if (head == null) return;
        Node temp = head;
        while (temp.next != null)
            temp = temp.next;
        
        while (temp != null) {
            System.out.print(temp.data + " <-> ");
            temp = temp.prev;
        }
        System.out.println("NULL");
    }
    
    public static void main(String[] args) {
        ReverseDoublyLinkedList list = new ReverseDoublyLinkedList();
        
        System.out.println("=== Reverse Doubly Linked List ===\n");
        
        // Build list
        for (int i = 1; i <= 5; i++)
            list.addNode(i * 10);
        
        System.out.print("Original (Forward): ");
        list.displayForward();
        
        System.out.print("Original (Backward): ");
        list.displayBackward();
        
        list.reverseIterative();
        
        System.out.println("\nAfter reverse (Forward): ");
        list.displayForward();
        
        System.out.print("After reverse (Backward): ");
        list.displayBackward();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Reverse: O(n) time, O(1) space");
    }
}
