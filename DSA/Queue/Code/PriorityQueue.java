// Priority Queue in Java

class Element {
    int data;
    int priority;
    
    Element(int data, int priority) {
        this.data = data;
        this.priority = priority;
    }
}

public class PriorityQueue {
    private java.util.ArrayList<Element> arr;
    
    public PriorityQueue() {
        arr = new java.util.ArrayList<>();
    }
    
    boolean isEmpty() {
        return arr.isEmpty();
    }
    
    boolean isFull() {
        return arr.size() == 100;
    }
    
    void enqueue(int data, int priority) {
        if (isFull()) {
            System.out.println("Priority Queue overflow");
            return;
        }
        
        Element elem = new Element(data, priority);
        int i = arr.size() - 1;
        arr.add(elem);
        
        while (i >= 0 && arr.get(i).priority < priority) {
            arr.set(i + 1, arr.get(i));
            i--;
        }
        arr.set(i + 1, elem);
        
        System.out.println("Enqueued: data=" + data + ", priority=" + priority + " (size=" + arr.size() + ")");
    }
    
    int dequeue() {
        if (isEmpty()) {
            System.out.println("Priority Queue underflow");
            return -1;
        }
        int data = arr.get(0).data;
        System.out.println("Dequeued: data=" + data + ", priority=" + arr.get(0).priority + " (size=" + (arr.size() - 1) + ")");
        
        arr.remove(0);
        return data;
    }
    
    void display() {
        if (isEmpty()) {
            System.out.println("Priority Queue is empty");
            return;
        }
        System.out.println("Priority Queue (data -> priority):");
        for (Element elem : arr) {
            System.out.println("  " + elem.data + " -> " + elem.priority);
        }
    }
    
    public static void main(String[] args) {
        PriorityQueue pq = new PriorityQueue();
        
        System.out.println("=== Priority Queue ===\n");
        
        pq.display();
        
        System.out.println("\nEnqueuing elements:");
        pq.enqueue(10, 2);
        pq.enqueue(20, 5);
        pq.enqueue(30, 1);
        pq.enqueue(40, 3);
        
        pq.display();
        
        System.out.println("\nDequeuing (highest priority first):");
        pq.dequeue();
        pq.dequeue();
        
        pq.display();
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Enqueue: O(n) - insertion in sorted order");
        System.out.println("Dequeue: O(n) - removal with shifting");
        System.out.println("Peek: O(1)");
        System.out.println("Space: O(n)");
        System.out.println("Note: Using linked list or heap improves Enqueue to O(log n)");
    }
}
