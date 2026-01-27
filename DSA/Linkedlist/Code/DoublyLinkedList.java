// Doubly Linked List in Java

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

public class DoublyLinkedList {
    Node head;
    
    void insertAtBeginning(int data) {
        Node newNode = new Node(data);
        if (head != null)
            head.prev = newNode;
        newNode.next = head;
        head = newNode;
    }
    
    void insertAtEnd(int data) {
        Node newNode = new Node(data);
        if (head == null) {
            head = newNode;
            return;
        }
        
        Node temp = head;
        while (temp.next != null)
            temp = temp.next;
        
        temp.next = newNode;
        newNode.prev = temp;
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
        DoublyLinkedList list = new DoublyLinkedList();
        
        System.out.println("=== Doubly Linked List ===\n");
        
        list.insertAtEnd(10);
        list.insertAtEnd(20);
        list.insertAtEnd(30);
        
        System.out.print("Forward: ");
        list.displayForward();
        
        System.out.print("Backward: ");
        list.displayBackward();
        
        list.insertAtBeginning(5);
        System.out.println("\nAfter inserting 5 at beginning:");
        System.out.print("Forward: ");
        list.displayForward();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Insert at beginning: O(1)");
        System.out.println("Insert at end: O(n)");
        System.out.println("Delete: O(1) with pointer, O(n) without");
        System.out.println("Space: O(n)");
    }
}
