// Push Operation in C#

using System;

class PushOperation {
    private int[] arr;
    private int top;
    private int maxSize;
    
    public PushOperation(int size) {
        arr = new int[size];
        top = -1;
        maxSize = size;
    }
    
    bool IsFull() {
        return top == maxSize - 1;
    }
    
    void Push(int value) {
        if (IsFull()) {
            Console.WriteLine("Stack overflow - cannot push " + value);
            return;
        }
        arr[++top] = value;
        Console.WriteLine("Successfully pushed: " + value + " (top = " + top + ")");
    }
    
    void Display() {
        if (top == -1) {
            Console.WriteLine("Stack is empty");
            return;
        }
        Console.Write("Current stack: ");
        for (int i = 0; i <= top; i++) {
            Console.Write(arr[i] + " ");
        }
        Console.WriteLine();
    }
    
    static void Main() {
        PushOperation stack = new PushOperation(100);
        
        Console.WriteLine("=== Push Operation ===\n");
        
        stack.Display();
        
        for (int i = 1; i <= 5; i++) {
            stack.Push(i * 10);
        }
        
        stack.Display();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time: O(1)");
        Console.WriteLine("Space: O(1)");
    }
}
