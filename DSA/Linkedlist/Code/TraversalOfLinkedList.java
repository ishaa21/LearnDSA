// Traversal of Linked List in Java

class Node {
    int data;
    Node next;
    
    Node(int data) {
        this.data = data;
        this.next = null;
    }
}

public class LinkedListTraversal {
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
    
    void displayForward() {
        System.out.print("Forward: ");
        Node temp = head;
        while (temp != null) {
            System.out.print(temp.data + " -> ");
            temp = temp.next;
        }
        System.out.println("NULL");
    }
    
    void displayRecursive(Node node) {
        if (node == null) {
            System.out.println("NULL");
            return;
        }
        System.out.print(node.data + " -> ");
        displayRecursive(node.next);
    }
    
    int countNodes(Node node) {
        if (node == null) return 0;
        return 1 + countNodes(node.next);
    }
    
    Node getNode(int pos) {
        if (pos < 1) return null;
        Node temp = head;
        for (int i = 1; i < pos && temp != null; i++)
            temp = temp.next;
        return temp;
    }
    
    public static void main(String[] args) {
        LinkedListTraversal list = new LinkedListTraversal();
        
        System.out.println("=== Traversal of Linked List ===\n");
        
        // Build list
        for (int i = 1; i <= 5; i++)
            list.addNode(i * 10);
        
        // Test 1: Iterative forward traversal
        list.displayForward();
        
        // Test 2: Recursive traversal
        System.out.print("Recursive: ");
        list.displayRecursive(list.head);
        
        // Test 3: Count nodes
        System.out.println("Total nodes: " + list.countNodes(list.head));
        
        // Test 4: Get specific node
        Node node = list.getNode(3);
        if (node != null)
            System.out.println("Node at position 3: " + node.data);
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Forward traversal: O(n)");
        System.out.println("Recursive traversal: O(n) time, O(n) space (call stack)");
        System.out.println("Count nodes: O(n)");
        System.out.println("Get at position: O(n)");
    }
}
