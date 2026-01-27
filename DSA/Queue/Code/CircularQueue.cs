// Circular Queue in C#

using System;

class CircularQueue {
    private int[] arr;
    private int front;
    private int rear;
    private int size;
    private int maxSize;
    
    public CircularQueue(int max_size) {
        arr = new int[max_size];
        front = -1;
        rear = -1;
        size = 0;
        maxSize = max_size;
    }
    
    bool IsEmpty() {
        return size == 0;
    }
    
    bool IsFull() {
        return size == maxSize;
    }
    
    void Enqueue(int value) {
        if (IsFull()) {
            Console.WriteLine("Circular Queue overflow - cannot enqueue " + value);
            return;
        }
        if (IsEmpty()) {
            front = 0;
        }
        rear = (rear + 1) % maxSize;
        arr[rear] = value;
        size++;
        Console.WriteLine("Successfully enqueued: " + value + " (rear = " + rear + ", size = " + size + ")");
    }
    
    int Dequeue() {
        if (IsEmpty()) {
            Console.WriteLine("Circular Queue underflow - cannot dequeue");
            return -1;
        }
        int value = arr[front];
        Console.WriteLine("Successfully dequeued: " + value + " (front = " + front + ", size = " + (size - 1) + ")");
        
        if (size == 1) {
            front = -1;
            rear = -1;
        } else {
            front = (front + 1) % maxSize;
        }
        size--;
        return value;
    }
    
    int Peek() {
        if (IsEmpty()) {
            Console.WriteLine("Circular Queue is empty - cannot peek");
            return -1;
        }
        Console.WriteLine("Peeked: " + arr[front] + " (at front)");
        return arr[front];
    }
    
    void Display() {
        if (IsEmpty()) {
            Console.WriteLine("Circular Queue is empty");
            return;
        }
        Console.Write("Circular Queue: ");
        int i = front;
        for (int count = 0; count < size; count++) {
            Console.Write(arr[i] + " ");
            i = (i + 1) % maxSize;
        }
        Console.WriteLine();
    }
    
    static void Main() {
        CircularQueue q = new CircularQueue(100);
        
        Console.WriteLine("=== Circular Queue ===\n");
        
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
        
        Console.WriteLine("\nEnqueuing 2 more elements (circular reuse):");
        q.Enqueue(100);
        q.Enqueue(200);
        
        q.Display();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Enqueue: O(1)");
        Console.WriteLine("Dequeue: O(1)");
        Console.WriteLine("Peek: O(1)");
        Console.WriteLine("Space: O(n)");
        Console.WriteLine("Advantage: Efficient space reuse in circular manner");
    }
}
