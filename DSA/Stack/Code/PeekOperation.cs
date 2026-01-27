// Peek Operation in C#

using System;

class PeekOperation {
    private int[] arr;
    private int top;
    private int maxSize;
    
    public PeekOperation(int size) {
        arr = new int[size];
        top = -1;
        maxSize = size;
    }
    
    bool IsEmpty() {
        return top == -1;
    }
    
    void Push(int value) {
        arr[++top] = value;
    }
    
    int Peek() {
        if (IsEmpty()) {
            Console.WriteLine("Stack is empty - cannot peek");
            return -1;
        }
        Console.WriteLine("Peeked: " + arr[top] + " (at position " + top + ")");
        return arr[top];
    }
    
    void Display() {
        if (IsEmpty()) {
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
        PeekOperation stack = new PeekOperation(100);
        
        Console.WriteLine("=== Peek Operation ===\n");
        
        stack.Peek();
        
        Console.WriteLine("\nPushing elements:");
        for (int i = 1; i <= 5; i++) {
            stack.Push(i * 10);
        }
        
        stack.Display();
        
        Console.WriteLine("\nPeeking without removing:");
        for (int i = 0; i < 3; i++) {
            stack.Peek();
        }
        
        stack.Display();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time: O(1)");
        Console.WriteLine("Space: O(1)");
    }
}
