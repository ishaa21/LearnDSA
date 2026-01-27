// Stack Implementation using Linked List in Java

class Node {
    int data;
    Node next;
    
    Node(int data) {
        this.data = data;
        this.next = null;
    }
}

public class StackImplementationLinkedList {
    Node top;
    
    StackImplementationLinkedList() {
        this.top = null;
    }
    
    boolean isEmpty() {
        return top == null;
    }
    
    void push(int value) {
        Node newNode = new Node(value);
        newNode.next = top;
        top = newNode;
        System.out.println("Pushed: " + value);
    }
    
    int pop() {
        if (isEmpty()) {
            System.out.println("Stack underflow");
            return -1;
        }
        int value = top.data;
        top = top.next;
        return value;
    }
    
    int peek() {
        if (isEmpty()) {
            System.out.println("Stack is empty");
            return -1;
        }
        return top.data;
    }
    
    void display() {
        if (isEmpty()) {
            System.out.println("Stack is empty");
            return;
        }
        
        System.out.print("Stack: ");
        Node temp = top;
        while (temp != null) {
            System.out.print(temp.data + " -> ");
            temp = temp.next;
        }
        System.out.println("NULL");
    }
    
    public static void main(String[] args) {
        StackImplementationLinkedList stack = new StackImplementationLinkedList();
        
        System.out.println("=== Stack Implementation (Linked List) ===\n");
        
        stack.push(10);
        stack.push(20);
        stack.push(30);
        stack.push(40);
        
        stack.display();
        
        System.out.println("\nPeek: " + stack.peek());
        
        System.out.println("\nPopped: " + stack.pop());
        System.out.println("Popped: " + stack.pop());
        
        stack.display();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Push: O(1)");
        System.out.println("Pop: O(1)");
        System.out.println("Peek: O(1)");
        System.out.println("Space: O(n)");
    }
}
