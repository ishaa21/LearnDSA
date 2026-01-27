// Circular Linked List in Java

class Node {
    int data;
    Node next;
    
    Node(int data) {
        this.data = data;
        this.next = null;
    }
}

public class CircularLinkedList {
    Node head;
    
    void insertAtBeginning(int data) {
        Node newNode = new Node(data);
        if (head == null) {
            newNode.next = newNode;
            head = newNode;
            return;
        }
        
        Node temp = head;
        while (temp.next != head)
            temp = temp.next;
        
        newNode.next = head;
        temp.next = newNode;
        head = newNode;
    }
    
    void insertAtEnd(int data) {
        Node newNode = new Node(data);
        if (head == null) {
            newNode.next = newNode;
            head = newNode;
            return;
        }
        
        Node temp = head;
        while (temp.next != head)
            temp = temp.next;
        
        temp.next = newNode;
        newNode.next = head;
    }
    
    void display() {
        if (head == null) return;
        
        Node temp = head;
        do {
            System.out.print(temp.data + " -> ");
            temp = temp.next;
        } while (temp != head);
        System.out.println("(back to " + head.data + ")");
    }
    
    public static void main(String[] args) {
        CircularLinkedList list = new CircularLinkedList();
        
        System.out.println("=== Circular Linked List ===\n");
        
        list.insertAtEnd(10);
        list.insertAtEnd(20);
        list.insertAtEnd(30);
        
        System.out.print("List: ");
        list.display();
        
        list.insertAtBeginning(5);
        System.out.print("After inserting 5 at beginning: ");
        list.display();
        
        list.insertAtEnd(40);
        System.out.print("After inserting 40 at end: ");
        list.display();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Insert at beginning: O(n)");
        System.out.println("Insert at end: O(n)");
        System.out.println("Delete: O(n)");
        System.out.println("Space: O(n)");
    }
}
