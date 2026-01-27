// Introduction to Linked List in Java
// Basic structure and node operations

class Node {
    int data;
    Node next;
    
    Node(int data) {
        this.data = data;
        this.next = null;
    }
}

public class IntroductionToLinkedList {
    
    static void insertAtBeginning(Node head, int data) {
        Node newNode = new Node(data);
        newNode.next = head.next;
        head.next = newNode;
    }
    
    static void insertAtEnd(Node head, int data) {
        Node newNode = new Node(data);
        
        Node temp = head;
        while (temp.next != null)
            temp = temp.next;
        
        temp.next = newNode;
    }
    
    static void display(Node head) {
        Node temp = head.next;
        while (temp != null) {
            System.out.print(temp.data + " -> ");
            temp = temp.next;
        }
        System.out.println("NULL");
    }
    
    static int countNodes(Node head) {
        int count = 0;
        Node temp = head.next;
        while (temp != null) {
            count++;
            temp = temp.next;
        }
        return count;
    }
    
    static boolean search(Node head, int key) {
        Node temp = head.next;
        while (temp != null) {
            if (temp.data == key)
                return true;
            temp = temp.next;
        }
        return false;
    }
    
    static int getAtIndex(Node head, int index) {
        Node temp = head.next;
        for (int i = 0; i < index; i++) {
            if (temp == null)
                return -1;
            temp = temp.next;
        }
        return (temp != null) ? temp.data : -1;
    }
    
    public static void main(String[] args) {
        // Create dummy head node
        Node head = new Node(-1);
        
        // Create linked list: 10 -> 20 -> 30 -> NULL
        insertAtEnd(head, 10);
        insertAtEnd(head, 20);
        insertAtEnd(head, 30);
        
        System.out.print("Linked List: ");
        display(head);
        
        // Insert at beginning
        insertAtBeginning(head, 5);
        System.out.print("After inserting 5 at beginning: ");
        display(head);
        
        // Insert at end
        insertAtEnd(head, 40);
        System.out.print("After inserting 40 at end: ");
        display(head);
        
        // Count nodes
        System.out.println("Number of nodes: " + countNodes(head));
        
        // Search
        System.out.println("Search 20: " + (search(head, 20) ? "Found" : "Not Found"));
        System.out.println("Search 50: " + (search(head, 50) ? "Found" : "Not Found"));
        
        // Get at index
        System.out.println("Element at index 0: " + getAtIndex(head, 0));
        System.out.println("Element at index 2: " + getAtIndex(head, 2));
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Create Node: O(1)");
        System.out.println("Insert at beginning: O(1)");
        System.out.println("Insert at end: O(n)");
        System.out.println("Search: O(n)");
        System.out.println("Display/Traverse: O(n)");
        System.out.println("Space: O(n)");
    }
}
