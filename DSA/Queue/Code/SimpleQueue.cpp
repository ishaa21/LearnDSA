#include <iostream>
#include <vector>
using namespace std;

// Simple Queue in C++
class Queue {
private:
    vector<int> arr;
    int front;
    int rear;
    int maxSize;
    
public:
    Queue(int size = 100) : front(-1), rear(-1), maxSize(size) {
        arr.resize(size);
    }
    
    bool isEmpty() {
        return front == -1;
    }
    
    bool isFull() {
        return rear == maxSize - 1;
    }
    
    void enqueue(int value) {
        if (isFull()) {
            cout << "Queue overflow - cannot enqueue " << value << "\n";
            return;
        }
        if (isEmpty()) {
            front = 0;
        }
        arr[++rear] = value;
        cout << "Successfully enqueued: " << value << " (rear = " << rear << ")\n";
    }
    
    int dequeue() {
        if (isEmpty()) {
            cout << "Queue underflow - cannot dequeue\n";
            return -1;
        }
        int value = arr[front];
        cout << "Successfully dequeued: " << value << " (front = " << front << ")\n";
        
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
            cout << "Queue is empty - cannot peek\n";
            return -1;
        }
        cout << "Peeked: " << arr[front] << " (at front)\n";
        return arr[front];
    }
    
    void display() {
        if (isEmpty()) {
            cout << "Queue is empty\n";
            return;
        }
        cout << "Queue: ";
        for (int i = front; i <= rear; i++) {
            cout << arr[i] << " ";
        }
        cout << "\n";
    }
};

int main() {
    Queue q;
    
    cout << "=== Simple Queue ===\n\n";
    
    q.display();
    
    cout << "\nEnqueuing elements:\n";
    for (int i = 1; i <= 5; i++) {
        q.enqueue(i * 10);
    }
    
    q.display();
    
    cout << "\nDequeuing 2 elements:\n";
    q.dequeue();
    q.dequeue();
    
    q.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Enqueue: O(1)\n";
    cout << "Dequeue: O(1)\n";
    cout << "Peek: O(1)\n";
    cout << "Space: O(n)\n";
    
    return 0;
}
