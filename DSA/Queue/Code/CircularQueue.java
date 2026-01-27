// Circular Queue in Java

public class CircularQueue {
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
    
    boolean isEmpty() {
        return size == 0;
    }
    
    boolean isFull() {
        return size == maxSize;
    }
    
    void enqueue(int value) {
        if (isFull()) {
            System.out.println("Circular Queue overflow - cannot enqueue " + value);
            return;
        }
        if (isEmpty()) {
            front = 0;
        }
        rear = (rear + 1) % maxSize;
        arr[rear] = value;
        size++;
        System.out.println("Successfully enqueued: " + value + " (rear = " + rear + ", size = " + size + ")");
    }
    
    int dequeue() {
        if (isEmpty()) {
            System.out.println("Circular Queue underflow - cannot dequeue");
            return -1;
        }
        int value = arr[front];
        System.out.println("Successfully dequeued: " + value + " (front = " + front + ", size = " + (size - 1) + ")");
        
        if (size == 1) {
            front = -1;
            rear = -1;
        } else {
            front = (front + 1) % maxSize;
        }
        size--;
        return value;
    }
    
    int peek() {
        if (isEmpty()) {
            System.out.println("Circular Queue is empty - cannot peek");
            return -1;
        }
        System.out.println("Peeked: " + arr[front] + " (at front)");
        return arr[front];
    }
    
    void display() {
        if (isEmpty()) {
            System.out.println("Circular Queue is empty");
            return;
        }
        System.out.print("Circular Queue: ");
        int i = front;
        for (int count = 0; count < size; count++) {
            System.out.print(arr[i] + " ");
            i = (i + 1) % maxSize;
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
        CircularQueue q = new CircularQueue(100);
        
        System.out.println("=== Circular Queue ===\n");
        
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
        
        System.out.println("\nEnqueuing 2 more elements (circular reuse):");
        q.enqueue(100);
        q.enqueue(200);
        
        q.display();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Enqueue: O(1)");
        System.out.println("Dequeue: O(1)");
        System.out.println("Peek: O(1)");
        System.out.println("Space: O(n)");
        System.out.println("Advantage: Efficient space reuse in circular manner");
    }
}
