// Peek Operation in Java

public class PeekOperation {
    private int[] arr;
    private int top;
    private int maxSize;
    
    public PeekOperation(int size) {
        arr = new int[size];
        top = -1;
        maxSize = size;
    }
    
    boolean isEmpty() {
        return top == -1;
    }
    
    void push(int value) {
        arr[++top] = value;
    }
    
    int peek() {
        if (isEmpty()) {
            System.out.println("Stack is empty - cannot peek");
            return -1;
        }
        System.out.println("Peeked: " + arr[top] + " (at position " + top + ")");
        return arr[top];
    }
    
    void display() {
        if (isEmpty()) {
            System.out.println("Stack is empty");
            return;
        }
        System.out.print("Current stack: ");
        for (int i = 0; i <= top; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
        PeekOperation stack = new PeekOperation(100);
        
        System.out.println("=== Peek Operation ===\n");
        
        stack.peek();
        
        System.out.println("\nPushing elements:");
        for (int i = 1; i <= 5; i++) {
            stack.push(i * 10);
        }
        
        stack.display();
        
        System.out.println("\nPeeking without removing:");
        for (int i = 0; i < 3; i++) {
            stack.peek();
        }
        
        stack.display();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Time: O(1)");
        System.out.println("Space: O(1)");
    }
}
