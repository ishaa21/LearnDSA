// Stack Implementation using Array in C#

using System;

class StackImplementationArray {
    private int[] arr;
    private int top;
    private int maxSize;
    
    public StackImplementationArray(int size) {
        arr = new int[size];
        top = -1;
        maxSize = size;
    }
    
    bool IsFull() {
        return top == maxSize - 1;
    }
    
    bool IsEmpty() {
        return top == -1;
    }
    
    void Push(int value) {
        if (IsFull()) {
            Console.WriteLine("Stack overflow");
            return;
        }
        arr[++top] = value;
        Console.WriteLine("Pushed: " + value);
    }
    
    int Pop() {
        if (IsEmpty()) {
            Console.WriteLine("Stack underflow");
            return -1;
        }
        return arr[top--];
    }
    
    int Peek() {
        if (IsEmpty()) {
            Console.WriteLine("Stack is empty");
            return -1;
        }
        return arr[top];
    }
    
    void Display() {
        if (IsEmpty()) {
            Console.WriteLine("Stack is empty");
            return;
        }
        
        Console.Write("Stack: ");
        for (int i = 0; i <= top; i++) {
            Console.Write(arr[i] + " ");
        }
        Console.WriteLine();
    }
    
    static void Main() {
        StackImplementationArray stack = new StackImplementationArray(100);
        
        Console.WriteLine("=== Stack Implementation (Array) ===\n");
        
        stack.Push(10);
        stack.Push(20);
        stack.Push(30);
        stack.Push(40);
        
        stack.Display();
        
        Console.WriteLine("\nPeek: " + stack.Peek());
        
        Console.WriteLine("\nPopped: " + stack.Pop());
        Console.WriteLine("Popped: " + stack.Pop());
        
        stack.Display();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Push: O(1)");
        Console.WriteLine("Pop: O(1)");
        Console.WriteLine("Peek: O(1)");
        Console.WriteLine("Space: O(n)");
    }
}
