// Stack Implementation using Linked List in C#

using System;

class Node {
    public int data;
    public Node next;
    
    public Node(int data) {
        this.data = data;
        this.next = null;
    }
}

class StackImplementationLinkedList {
    Node top;
    
    StackImplementationLinkedList() {
        this.top = null;
    }
    
    bool IsEmpty() {
        return top == null;
    }
    
    void Push(int value) {
        Node newNode = new Node(value);
        newNode.next = top;
        top = newNode;
        Console.WriteLine("Pushed: " + value);
    }
    
    int Pop() {
        if (IsEmpty()) {
            Console.WriteLine("Stack underflow");
            return -1;
        }
        int value = top.data;
        top = top.next;
        return value;
    }
    
    int Peek() {
        if (IsEmpty()) {
            Console.WriteLine("Stack is empty");
            return -1;
        }
        return top.data;
    }
    
    void Display() {
        if (IsEmpty()) {
            Console.WriteLine("Stack is empty");
            return;
        }
        
        Console.Write("Stack: ");
        Node temp = top;
        while (temp != null) {
            Console.Write(temp.data + " -> ");
            temp = temp.next;
        }
        Console.WriteLine("NULL");
    }
    
    static void Main() {
        StackImplementationLinkedList stack = new StackImplementationLinkedList();
        
        Console.WriteLine("=== Stack Implementation (Linked List) ===\n");
        
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
