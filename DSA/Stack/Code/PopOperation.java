// Pop Operation in Java

public class PopOperation {
    private int[] arr;
    private int top;
    private int maxSize;
    
    public PopOperation(int size) {
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
    
    int pop() {
        if (isEmpty()) {
            System.out.println("Stack underflow - cannot pop");
            return -1;
        }
        int value = arr[top];
        System.out.println("Successfully popped: " + value + " (top = " + (top - 1) + ")");
        top--;
        return value;
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
        PopOperation stack = new PopOperation(100);
        
        System.out.println("=== Pop Operation ===\n");
        
        for (int i = 1; i <= 5; i++) {
            stack.push(i * 10);
        }
        
        stack.display();
        
        System.out.println("\nPopping elements:");
        stack.pop();
        stack.pop();
        
        stack.display();
        
        System.out.println("\nPopping all remaining:");
        while (!stack.isEmpty()) {
            stack.pop();
        }
        
        stack.display();
        stack.pop();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Time: O(1)");
        System.out.println("Space: O(1)");
    }
}
