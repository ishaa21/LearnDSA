// Singly Linked List in Java
// Complete implementation of singly linked list operations

class Node {
    int data;
    Node next;
    
    Node(int data) {
        this.data = data;
        this.next = null;
    }
}

public class SinglyLinkedList {
    Node head;
    
    void insertAtBeginning(int data) {
        Node newNode = new Node(data);
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
    }
    
    void insertAtPosition(int data, int pos) {
        if (pos == 0) {
            insertAtBeginning(data);
            return;
        }
        
        Node temp = head;
        for (int i = 0; i < pos - 1 && temp != null; i++)
            temp = temp.next;
        
        if (temp == null) return;
        
        Node newNode = new Node(data);
        newNode.next = temp.next;
        temp.next = newNode;
    }
    
    void deleteNode(int key) {
        if (head == null) return;
        
        if (head.data == key) {
            head = head.next;
            return;
        }
        
        Node temp = head;
        while (temp.next != null && temp.next.data != key)
            temp = temp.next;
        
        if (temp.next != null)
            temp.next = temp.next.next;
    }
    
    void display() {
        Node temp = head;
        while (temp != null) {
            System.out.print(temp.data + " -> ");
            temp = temp.next;
        }
        System.out.println("NULL");
    }
    
    boolean search(int key) {
        Node temp = head;
        while (temp != null) {
            if (temp.data == key)
                return true;
            temp = temp.next;
        }
        return false;
    }
    
    public static void main(String[] args) {
        SinglyLinkedList list = new SinglyLinkedList();
        
        System.out.println("=== Singly Linked List Operations ===\n");
        
        // Insert at end
        list.insertAtEnd(10);
        list.insertAtEnd(20);
        list.insertAtEnd(30);
        list.insertAtEnd(40);
        
        System.out.print("Initial List: ");
        list.display();
        
        // Insert at beginning
        list.insertAtBeginning(5);
        System.out.print("After inserting 5 at beginning: ");
        list.display();
        
        // Insert at position
        list.insertAtPosition(15, 2);
        System.out.print("After inserting 15 at position 2: ");
        list.display();
        
        // Delete nodes
        list.deleteNode(15);
        System.out.print("After deleting 15: ");
        list.display();
        
        list.deleteNode(5);
        System.out.print("After deleting 5: ");
        list.display();
        
        list.deleteNode(40);
        System.out.print("After deleting 40: ");
        list.display();
        
        // Search
        System.out.println("\nSearch 20: " + (list.search(20) ? "Found" : "Not Found"));
        System.out.println("Search 100: " + (list.search(100) ? "Found" : "Not Found"));
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Insert at beginning: O(1)");
        System.out.println("Insert at end: O(n)");
        System.out.println("Insert at position: O(n)");
        System.out.println("Delete: O(n)");
        System.out.println("Search: O(n)");
        System.out.println("Space: O(n)");
    }
}
