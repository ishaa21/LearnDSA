// Simple Queue in Java

public class SimpleQueue {
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
    
    boolean isEmpty() {
        return front == -1;
    }
    
    boolean isFull() {
        return rear == maxSize - 1;
    }
    
    void enqueue(int value) {
        if (isFull()) {
            System.out.println("Queue overflow - cannot enqueue " + value);
            return;
        }
        if (isEmpty()) {
            front = 0;
        }
        arr[++rear] = value;
        System.out.println("Successfully enqueued: " + value + " (rear = " + rear + ")");
    }
    
    int dequeue() {
        if (isEmpty()) {
            System.out.println("Queue underflow - cannot dequeue");
            return -1;
        }
        int value = arr[front];
        System.out.println("Successfully dequeued: " + value + " (front = " + front + ")");
        
        if (front == rear) {
            front = -1;
            rear = -1;
        } else {
            front++;
        }
        return value;
    }
    
    int peek() {
        if (isEmpty()) {
            System.out.println("Queue is empty - cannot peek");
            return -1;
        }
        System.out.println("Peeked: " + arr[front] + " (at front)");
        return arr[front];
    }
    
    void display() {
        if (isEmpty()) {
            System.out.println("Queue is empty");
            return;
        }
        System.out.print("Queue: ");
        for (int i = front; i <= rear; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
        SimpleQueue q = new SimpleQueue(100);
        
        System.out.println("=== Simple Queue ===\n");
        
        q.display();
        
        System.out.println("\nEnqueuing elements:");
        for (int i = 1; i <= 5; i++) {
            q.enqueue(i * 10);
        }
        
        q.display();
        
        System.out.println("\nDequeuing 2 elements:");
        q.dequeue();
        q.dequeue();
        
        q.display();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Enqueue: O(1)");
        System.out.println("Dequeue: O(1)");
        System.out.println("Peek: O(1)");
        System.out.println("Space: O(n)");
    }
}
