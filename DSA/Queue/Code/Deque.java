// Deque (Double Ended Queue) in Java

public class Deque {
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
    
    boolean isEmpty() {
        return size == 0;
    }
    
    boolean isFull() {
        return size == maxSize;
    }
    
    void insertFront(int value) {
        if (isFull()) {
            System.out.println("Deque overflow - cannot insert at front");
            return;
        }
        if (isEmpty()) {
            front = 0;
            rear = 0;
        } else {
            front = (front - 1 + maxSize) % maxSize;
        }
        arr[front] = value;
        size++;
        System.out.println("Successfully inserted at front: " + value + " (size = " + size + ")");
    }
    
    void insertRear(int value) {
        if (isFull()) {
            System.out.println("Deque overflow - cannot insert at rear");
            return;
        }
        if (isEmpty()) {
            front = 0;
            rear = 0;
        } else {
            rear = (rear + 1) % maxSize;
        }
        arr[rear] = value;
        size++;
        System.out.println("Successfully inserted at rear: " + value + " (size = " + size + ")");
    }
    
    int deleteFront() {
        if (isEmpty()) {
            System.out.println("Deque underflow - cannot delete from front");
            return -1;
        }
        int value = arr[front];
        System.out.println("Successfully deleted from front: " + value + " (size = " + (size - 1) + ")");
        
        if (size == 1) {
            front = -1;
            rear = -1;
        } else {
            front = (front + 1) % maxSize;
        }
        size--;
        return value;
    }
    
    int deleteRear() {
        if (isEmpty()) {
            System.out.println("Deque underflow - cannot delete from rear");
            return -1;
        }
        int value = arr[rear];
        System.out.println("Successfully deleted from rear: " + value + " (size = " + (size - 1) + ")");
        
        if (size == 1) {
            front = -1;
            rear = -1;
        } else {
            rear = (rear - 1 + maxSize) % maxSize;
        }
        size--;
        return value;
    }
    
    void display() {
        if (isEmpty()) {
            System.out.println("Deque is empty");
            return;
        }
        System.out.print("Deque: ");
        int i = front;
        for (int count = 0; count < size; count++) {
            System.out.print(arr[i] + " ");
            i = (i + 1) % maxSize;
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
        Deque d = new Deque(100);
        
        System.out.println("=== Deque (Double Ended Queue) ===\n");
        
        d.display();
        
        System.out.println("\nInserting at rear:");
        for (int i = 1; i <= 3; i++) {
            d.insertRear(i * 10);
        }
        
        d.display();
        
        System.out.println("\nInserting at front:");
        d.insertFront(5);
        d.insertFront(2);
        
        d.display();
        
        System.out.println("\nDeleting from front:");
        d.deleteFront();
        
        System.out.println("\nDeleting from rear:");
        d.deleteRear();
        
        d.display();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Insert Front: O(1)");
        System.out.println("Insert Rear: O(1)");
        System.out.println("Delete Front: O(1)");
        System.out.println("Delete Rear: O(1)");
        System.out.println("Space: O(n)");
        System.out.println("Advantage: Flexible insertion/deletion from both ends");
    }
}
