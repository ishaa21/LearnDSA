// Push Operation in Java

public class PushOperation {
    private int[] arr;
    private int top;
    private int maxSize;
    
    public PushOperation(int size) {
        arr = new int[size];
        top = -1;
        maxSize = size;
    }
    
    boolean isFull() {
        return top == maxSize - 1;
    }
    
    void push(int value) {
        if (isFull()) {
            System.out.println("Stack overflow - cannot push " + value);
            return;
        }
        arr[++top] = value;
        System.out.println("Successfully pushed: " + value + " (top = " + top + ")");
    }
    
    void display() {
        if (top == -1) {
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
        PushOperation stack = new PushOperation(100);
        
        System.out.println("=== Push Operation ===\n");
        
        stack.display();
        
        for (int i = 1; i <= 5; i++) {
            stack.push(i * 10);
        }
        
        stack.display();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Time: O(1)");
        System.out.println("Space: O(1)");
    }
}
