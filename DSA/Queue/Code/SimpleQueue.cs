// Simple Queue in C#

using System;

class SimpleQueue {
    private int[] arr;
    private int front;
    private int rear;
    private int maxSize;
    
    public SimpleQueue(int size) {
        arr = new int[size];
        front = -1;
        rear = -1;
        maxSize = size;
    }
    
    bool IsEmpty() {
        return front == -1;
    }
    
    bool IsFull() {
        return rear == maxSize - 1;
    }
    
    void Enqueue(int value) {
        if (IsFull()) {
            Console.WriteLine("Queue overflow - cannot enqueue " + value);
            return;
        }
        if (IsEmpty()) {
            front = 0;
        }
        arr[++rear] = value;
        Console.WriteLine("Successfully enqueued: " + value + " (rear = " + rear + ")");
    }
    
    int Dequeue() {
        if (IsEmpty()) {
            Console.WriteLine("Queue underflow - cannot dequeue");
            return -1;
        }
        int value = arr[front];
        Console.WriteLine("Successfully dequeued: " + value + " (front = " + front + ")");
        
        if (front == rear) {
            front = -1;
            rear = -1;
        } else {
            front++;
        }
        return value;
    }
    
    int Peek() {
        if (IsEmpty()) {
            Console.WriteLine("Queue is empty - cannot peek");
            return -1;
        }
        Console.WriteLine("Peeked: " + arr[front] + " (at front)");
        return arr[front];
    }
    
    void Display() {
        if (IsEmpty()) {
            Console.WriteLine("Queue is empty");
            return;
        }
        Console.Write("Queue: ");
        for (int i = front; i <= rear; i++) {
            Console.Write(arr[i] + " ");
        }
        Console.WriteLine();
    }
    
    static void Main() {
        SimpleQueue q = new SimpleQueue(100);
        
        Console.WriteLine("=== Simple Queue ===\n");
        
        q.Display();
        
        Console.WriteLine("\nEnqueuing elements:");
        for (int i = 1; i <= 5; i++) {
            q.Enqueue(i * 10);
        }
        
        q.Display();
        
        Console.WriteLine("\nDequeuing 2 elements:");
        q.Dequeue();
        q.Dequeue();
        
        q.Display();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Enqueue: O(1)");
        Console.WriteLine("Dequeue: O(1)");
        Console.WriteLine("Peek: O(1)");
        Console.WriteLine("Space: O(n)");
    }
}
