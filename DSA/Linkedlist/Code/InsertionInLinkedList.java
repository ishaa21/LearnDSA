// Insertion in Linked List in Java

class Node {
    int data;
    Node next;
    
    Node(int data) {
        this.data = data;
        this.next = null;
    }
}

public class LinkedListInsertion {
    Node head;
    
    void insertAtPosition(int data, int pos) {
        if (pos < 1) {
            System.out.println("Invalid position");
            return;
        }
        
        Node newNode = new Node(data);
        
        if (pos == 1) {
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
        temp.next = newNode;
    }
    
    void insertSorted(int data) {
        Node newNode = new Node(data);
        
        if (head == null || head.data >= data) {
            newNode.next = head;
            head = newNode;
            return;
        }
        
        Node temp = head;
        while (temp.next != null && temp.next.data < data)
            temp = temp.next;
        
        newNode.next = temp.next;
        temp.next = newNode;
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
        LinkedListInsertion list = new LinkedListInsertion();
        
        System.out.println("=== Insertion in Linked List ===\n");
        
        // Test 1: Insert at position
        list.insertAtPosition(10, 1);
        list.insertAtPosition(20, 2);
        list.insertAtPosition(30, 3);
        list.insertAtPosition(15, 2);
        
        System.out.print("After position-based insertions: ");
        list.display();
        
        LinkedListInsertion list2 = new LinkedListInsertion();
        
        // Test 2: Insert in sorted order
        list2.insertSorted(20);
        list2.insertSorted(10);
        list2.insertSorted(30);
        list2.insertSorted(15);
        list2.insertSorted(25);
        
        System.out.print("After sorted insertions: ");
        list2.display();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Insert at position: O(n)");
        System.out.println("Insert sorted: O(n)");
        System.out.println("Space: O(1) for operation, O(n) for list");
    }
}
