// Pop Operation in C#

using System;

class PopOperation {
    private int[] arr;
    private int top;
    private int maxSize;
    
    public PopOperation(int size) {
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
    
    int Pop() {
        if (IsEmpty()) {
            Console.WriteLine("Stack underflow - cannot pop");
            return -1;
        }
        int value = arr[top];
        Console.WriteLine("Successfully popped: " + value + " (top = " + (top - 1) + ")");
        top--;
        return value;
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
        PopOperation stack = new PopOperation(100);
        
        Console.WriteLine("=== Pop Operation ===\n");
        
        for (int i = 1; i <= 5; i++) {
            stack.Push(i * 10);
        }
        
        stack.Display();
        
        Console.WriteLine("\nPopping elements:");
        stack.Pop();
        stack.Pop();
        
        stack.Display();
        
        Console.WriteLine("\nPopping all remaining:");
        while (!stack.IsEmpty()) {
            stack.Pop();
        }
        
        stack.Display();
        stack.Pop();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Time: O(1)");
        Console.WriteLine("Space: O(1)");
    }
}
