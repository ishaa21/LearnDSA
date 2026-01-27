// Insertion in Doubly Linked List in Java

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

public class DoublyLinkedListInsertion {
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
    
    void insertAtPosition(int data, int pos) {
        if (pos < 1) {
            System.out.println("Invalid position");
            return;
        }
        
        Node newNode = new Node(data);
        
        if (pos == 1) {
            if (head != null)
                head.prev = newNode;
            newNode.next = head;
            head = newNode;
            return;
        }
        
        Node temp = head;
        for (int i = 1; i < pos - 1 && temp != null; i++)
            temp = temp.next;
        
        if (temp == null) {
            System.out.println("Position out of range");
            return;
        }
        
        newNode.next = temp.next;
        newNode.prev = temp;
        if (temp.next != null)
            temp.next.prev = newNode;
        temp.next = newNode;
    }
    
    void displayForward() {
        Node temp = head;
        while (temp != null) {
            System.out.print(temp.data + " <-> ");
            temp = temp.next;
        }
        System.out.println("NULL");
    }
    
    public static void main(String[] args) {
        DoublyLinkedListInsertion list = new DoublyLinkedListInsertion();
        
        System.out.println("=== Insertion in Doubly Linked List ===\n");
        
        list.insertAtEnd(10);
        list.insertAtEnd(20);
        list.insertAtEnd(30);
        
        System.out.print("After end insertions: ");
        list.displayForward();
        
        list.insertAtBeginning(5);
        System.out.print("After beginning insertion: ");
        list.displayForward();
        
        list.insertAtPosition(15, 2);
        System.out.print("After position insertion: ");
        list.displayForward();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Insert at beginning: O(1)");
        System.out.println("Insert at end: O(n)");
        System.out.println("Insert at position: O(n)");
        System.out.println("Space: O(1) for operation");
    }
}
