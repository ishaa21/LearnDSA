// Priority Queue in C#

using System;
using System.Collections.Generic;

class Element {
    public int data;
    public int priority;
    
    public Element(int data, int priority) {
        this.data = data;
        this.priority = priority;
    }
}

class PriorityQueue {
    private List<Element> arr;
    
    public PriorityQueue() {
        arr = new List<Element>();
    }
    
    bool IsEmpty() {
        return arr.Count == 0;
    }
    
    bool IsFull() {
        return arr.Count == 100;
    }
    
    void Enqueue(int data, int priority) {
        if (IsFull()) {
            Console.WriteLine("Priority Queue overflow");
            return;
        }
        
        Element elem = new Element(data, priority);
        int i = arr.Count - 1;
        arr.Add(elem);
        
        while (i >= 0 && arr[i].priority < priority) {
            arr[i + 1] = arr[i];
            i--;
        }
        arr[i + 1] = elem;
        
        Console.WriteLine("Enqueued: data=" + data + ", priority=" + priority + " (size=" + arr.Count + ")");
    }
    
    int Dequeue() {
        if (IsEmpty()) {
            Console.WriteLine("Priority Queue underflow");
            return -1;
        }
        int data = arr[0].data;
        Console.WriteLine("Dequeued: data=" + data + ", priority=" + arr[0].priority + " (size=" + (arr.Count - 1) + ")");
        
        arr.RemoveAt(0);
        return data;
    }
    
    void Display() {
        if (IsEmpty()) {
            Console.WriteLine("Priority Queue is empty");
            return;
        }
        Console.WriteLine("Priority Queue (data -> priority):");
        foreach (Element elem in arr) {
            Console.WriteLine("  " + elem.data + " -> " + elem.priority);
        }
    }
    
    static void Main() {
        PriorityQueue pq = new PriorityQueue();
        
        Console.WriteLine("=== Priority Queue ===\n");
        
        pq.Display();
        
        Console.WriteLine("\nEnqueuing elements:");
        pq.Enqueue(10, 2);
        pq.Enqueue(20, 5);
        pq.Enqueue(30, 1);
        pq.Enqueue(40, 3);
        
        pq.Display();
        
        Console.WriteLine("\nDequeuing (highest priority first):");
        pq.Dequeue();
        pq.Dequeue();
        
        pq.Display();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Enqueue: O(n) - insertion in sorted order");
        Console.WriteLine("Dequeue: O(n) - removal with shifting");
        Console.WriteLine("Peek: O(1)");
        Console.WriteLine("Space: O(n)");
        Console.WriteLine("Note: Using linked list or heap improves Enqueue to O(log n)");
    }
}
