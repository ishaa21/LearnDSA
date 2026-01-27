#include <iostream>
#include <vector>
using namespace std;

// Circular Queue in C++
class CircularQueue {
private:
    vector<int> arr;
    int front;
    int rear;
    int size;
    int maxSize;
    
public:
    CircularQueue(int max_size = 100) : front(-1), rear(-1), size(0), maxSize(max_size) {
        arr.resize(max_size);
    }
    
    bool isEmpty() {
        return size == 0;
    }
    
    bool isFull() {
        return size == maxSize;
    }
    
    void enqueue(int value) {
        if (isFull()) {
            cout << "Circular Queue overflow - cannot enqueue " << value << "\n";
            return;
        }
        if (isEmpty()) {
            front = 0;
        }
        rear = (rear + 1) % maxSize;
        arr[rear] = value;
        size++;
        cout << "Successfully enqueued: " << value << " (rear = " << rear << ", size = " << size << ")\n";
    }
    
    int dequeue() {
        if (isEmpty()) {
            cout << "Circular Queue underflow - cannot dequeue\n";
            return -1;
        }
        int value = arr[front];
        cout << "Successfully dequeued: " << value << " (front = " << front << ", size = " << size - 1 << ")\n";
        
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
            cout << "Circular Queue is empty - cannot peek\n";
            return -1;
        }
        cout << "Peeked: " << arr[front] << " (at front)\n";
        return arr[front];
    }
    
    void display() {
        if (isEmpty()) {
            cout << "Circular Queue is empty\n";
            return;
        }
        cout << "Circular Queue: ";
        int i = front;
        for (int count = 0; count < size; count++) {
            cout << arr[i] << " ";
            i = (i + 1) % maxSize;
        }
        cout << "\n";
    }
};

int main() {
    CircularQueue q;
    
    cout << "=== Circular Queue ===\n\n";
    
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
    
    cout << "\nEnqueuing 2 more elements (circular reuse):\n";
    q.enqueue(100);
    q.enqueue(200);
    
    q.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Enqueue: O(1)\n";
    cout << "Dequeue: O(1)\n";
    cout << "Peek: O(1)\n";
    cout << "Space: O(n)\n";
    cout << "Advantage: Efficient space reuse in circular manner\n";
    
    return 0;
}
