// Stack Implementation using Array in Java

public class StackImplementationArray {
    private int[] arr;
    private int top;
    private int maxSize;
    
    public StackImplementationArray(int size) {
        arr = new int[size];
        top = -1;
        maxSize = size;
    }
    
    boolean isFull() {
        return top == maxSize - 1;
    }
    
    boolean isEmpty() {
        return top == -1;
    }
    
    void push(int value) {
        if (isFull()) {
            System.out.println("Stack overflow");
            return;
        }
        arr[++top] = value;
        System.out.println("Pushed: " + value);
    }
    
    int pop() {
        if (isEmpty()) {
            System.out.println("Stack underflow");
            return -1;
        }
        return arr[top--];
    }
    
    int peek() {
        if (isEmpty()) {
            System.out.println("Stack is empty");
            return -1;
        }
        return arr[top];
    }
    
    void display() {
        if (isEmpty()) {
            System.out.println("Stack is empty");
            return;
        }
        
        System.out.print("Stack: ");
        for (int i = 0; i <= top; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
        StackImplementationArray stack = new StackImplementationArray(100);
        
        System.out.println("=== Stack Implementation (Array) ===\n");
        
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
