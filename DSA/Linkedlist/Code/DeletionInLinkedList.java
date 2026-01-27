// Deletion in Linked List in Java

class Node {
    int data;
    Node next;
    
    Node(int data) {
        this.data = data;
        this.next = null;
    }
}

public class LinkedListDeletion {
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
    
    void deleteAtPosition(int pos) {
        if (head == null) return;
        
        if (pos == 1) {
            head = head.next;
            return;
        }
        
        Node temp = head;
        for (int i = 1; i < pos - 1 && temp != null; i++)
            temp = temp.next;
        
        if (temp == null || temp.next == null) return;
        
        temp.next = temp.next.next;
    }
    
    void deleteByValue(int value) {
        if (head == null) return;
        
        if (head.data == value) {
            head = head.next;
            return;
        }
        
        Node temp = head;
        while (temp.next != null && temp.next.data != value)
            temp = temp.next;
        
        if (temp.next != null)
            temp.next = temp.next.next;
    }
    
    void deleteAllOccurrences(int value) {
        while (head != null && head.data == value)
            head = head.next;
        
        if (head == null) return;
        
        Node temp = head;
        while (temp.next != null) {
            if (temp.next.data == value)
                temp.next = temp.next.next;
            else
                temp = temp.next;
        }
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
        LinkedListDeletion list = new LinkedListDeletion();
        
        System.out.println("=== Deletion in Linked List ===\n");
        
        // Test 1: Delete at position
        for (int i = 1; i <= 5; i++)
            list.addNode(i * 10);
        
        System.out.print("Original list: ");
        list.display();
        
        list.deleteAtPosition(2);
        System.out.print("After deleting position 2: ");
        list.display();
        
        // Test 2: Delete by value
        list.deleteByValue(40);
        System.out.print("After deleting value 40: ");
        list.display();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Delete at position: O(n)");
        System.out.println("Delete by value: O(n)");
        System.out.println("Delete all occurrences: O(n)");
        System.out.println("Space: O(1)");
    }
}
