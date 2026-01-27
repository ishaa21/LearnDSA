// Traversal of Doubly Linked List in Java

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

public class DoublyLinkedListTraversal {
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
    
    void displayForward() {
        System.out.print("Forward: ");
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
        
        System.out.print("Backward: ");
        while (temp != null) {
            System.out.print(temp.data + " <-> ");
            temp = temp.prev;
        }
        System.out.println("NULL");
    }
    
    int countNodes() {
        int count = 0;
        Node temp = head;
        while (temp != null) {
            count++;
            temp = temp.next;
        }
        return count;
    }
    
    Node getNode(int pos) {
        if (pos < 1) return null;
        Node temp = head;
        for (int i = 1; i < pos && temp != null; i++)
            temp = temp.next;
        return temp;
    }
    
    public static void main(String[] args) {
        DoublyLinkedListTraversal list = new DoublyLinkedListTraversal();
        
        System.out.println("=== Traversal of Doubly Linked List ===\n");
        
        // Build list
        for (int i = 1; i <= 5; i++)
            list.addNode(i * 10);
        
        // Test 1: Forward traversal
        list.displayForward();
        
        // Test 2: Backward traversal
        list.displayBackward();
        
        // Test 3: Count nodes
        System.out.println("Total nodes: " + list.countNodes());
        
        // Test 4: Get at position
        Node node = list.getNode(3);
        if (node != null)
            System.out.println("Node at position 3: " + node.data);
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Forward traversal: O(n)");
        System.out.println("Backward traversal: O(n)");
        System.out.println("Count nodes: O(n)");
        System.out.println("Get at position: O(n)");
    }
}
