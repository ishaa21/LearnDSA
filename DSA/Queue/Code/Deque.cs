// Deque (Double Ended Queue) in C#

using System;

class Deque {
    private int[] arr;
    private int front;
    private int rear;
    private int size;
    private int maxSize;
    
    public Deque(int max_size) {
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
    
    void InsertFront(int value) {
        if (IsFull()) {
            Console.WriteLine("Deque overflow - cannot insert at front");
            return;
        }
        if (IsEmpty()) {
            front = 0;
            rear = 0;
        } else {
            front = (front - 1 + maxSize) % maxSize;
        }
        arr[front] = value;
        size++;
        Console.WriteLine("Successfully inserted at front: " + value + " (size = " + size + ")");
    }
    
    void InsertRear(int value) {
        if (IsFull()) {
            Console.WriteLine("Deque overflow - cannot insert at rear");
            return;
        }
        if (IsEmpty()) {
            front = 0;
            rear = 0;
        } else {
            rear = (rear + 1) % maxSize;
        }
        arr[rear] = value;
        size++;
        Console.WriteLine("Successfully inserted at rear: " + value + " (size = " + size + ")");
    }
    
    int DeleteFront() {
        if (IsEmpty()) {
            Console.WriteLine("Deque underflow - cannot delete from front");
            return -1;
        }
        int value = arr[front];
        Console.WriteLine("Successfully deleted from front: " + value + " (size = " + (size - 1) + ")");
        
        if (size == 1) {
            front = -1;
            rear = -1;
        } else {
            front = (front + 1) % maxSize;
        }
        size--;
        return value;
    }
    
    int DeleteRear() {
        if (IsEmpty()) {
            Console.WriteLine("Deque underflow - cannot delete from rear");
            return -1;
        }
        int value = arr[rear];
        Console.WriteLine("Successfully deleted from rear: " + value + " (size = " + (size - 1) + ")");
        
        if (size == 1) {
            front = -1;
            rear = -1;
        } else {
            rear = (rear - 1 + maxSize) % maxSize;
        }
        size--;
        return value;
    }
    
    void Display() {
        if (IsEmpty()) {
            Console.WriteLine("Deque is empty");
            return;
        }
        Console.Write("Deque: ");
        int i = front;
        for (int count = 0; count < size; count++) {
            Console.Write(arr[i] + " ");
            i = (i + 1) % maxSize;
        }
        Console.WriteLine();
    }
    
    static void Main() {
        Deque d = new Deque(100);
        
        Console.WriteLine("=== Deque (Double Ended Queue) ===\n");
        
        d.Display();
        
        Console.WriteLine("\nInserting at rear:");
        for (int i = 1; i <= 3; i++) {
            d.InsertRear(i * 10);
        }
        
        d.Display();
        
        Console.WriteLine("\nInserting at front:");
        d.InsertFront(5);
        d.InsertFront(2);
        
        d.Display();
        
        Console.WriteLine("\nDeleting from front:");
        d.DeleteFront();
        
        Console.WriteLine("\nDeleting from rear:");
        d.DeleteRear();
        
        d.Display();
        
        Console.WriteLine("\nComplexity Analysis:");
        Console.WriteLine("Insert Front: O(1)");
        Console.WriteLine("Insert Rear: O(1)");
        Console.WriteLine("Delete Front: O(1)");
        Console.WriteLine("Delete Rear: O(1)");
        Console.WriteLine("Space: O(n)");
        Console.WriteLine("Advantage: Flexible insertion/deletion from both ends");
    }
}
