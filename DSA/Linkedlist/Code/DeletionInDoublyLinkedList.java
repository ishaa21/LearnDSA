// Deletion in Doubly Linked List in Java

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

public class DoublyLinkedListDeletion {
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
    
    void deleteAtPosition(int pos) {
        if (head == null) return;
        
        if (pos == 1) {
            head = head.next;
            if (head != null)
                head.prev = null;
            return;
        }
        
        Node temp = head;
        for (int i = 1; i < pos && temp != null; i++)
            temp = temp.next;
        
        if (temp == null) return;
        
        if (temp.next != null)
            temp.next.prev = temp.prev;
        if (temp.prev != null)
            temp.prev.next = temp.next;
    }
    
    void deleteByValue(int value) {
        if (head == null) return;
        
        if (head.data == value) {
            head = head.next;
            if (head != null)
                head.prev = null;
            return;
        }
        
        Node temp = head;
        while (temp != null && temp.data != value)
            temp = temp.next;
        
        if (temp == null) return;
        
        if (temp.next != null)
            temp.next.prev = temp.prev;
        if (temp.prev != null)
            temp.prev.next = temp.next;
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
        DoublyLinkedListDeletion list = new DoublyLinkedListDeletion();
        
        System.out.println("=== Deletion in Doubly Linked List ===\n");
        
        // Build list
        for (int i = 1; i <= 5; i++)
            list.addNode(i * 10);
        
        System.out.print("Original list: ");
        list.displayForward();
        
        list.deleteAtPosition(2);
        System.out.print("After deleting position 2: ");
        list.displayForward();
        
        list.deleteByValue(40);
        System.out.print("After deleting value 40: ");
        list.displayForward();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Delete at position: O(n)");
        System.out.println("Delete by value: O(n)");
        System.out.println("Space: O(1)");
    }
}
