#include <iostream>
#include <vector>
using namespace std;

// Priority Queue in C++
struct Element {
    int data;
    int priority;
};

class PriorityQueue {
private:
    vector<Element> arr;
    
public:
    bool isEmpty() {
        return arr.empty();
    }
    
    bool isFull() {
        return arr.size() == 100;
    }
    
    void enqueue(int data, int priority) {
        if (isFull()) {
            cout << "Priority Queue overflow\n";
            return;
        }
        
        int i = arr.size() - 1;
        Element elem = {data, priority};
        arr.push_back(elem);
        
        while (i >= 0 && arr[i].priority < priority) {
            arr[i + 1] = arr[i];
            i--;
        }
        arr[i + 1] = elem;
        
        cout << "Enqueued: data=" << data << ", priority=" << priority << " (size=" << arr.size() << ")\n";
    }
    
    int dequeue() {
        if (isEmpty()) {
            cout << "Priority Queue underflow\n";
            return -1;
        }
        int data = arr[0].data;
        cout << "Dequeued: data=" << data << ", priority=" << arr[0].priority << " (size=" << arr.size() - 1 << ")\n";
        
        arr.erase(arr.begin());
        return data;
    }
    
    void display() {
        if (isEmpty()) {
            cout << "Priority Queue is empty\n";
            return;
        }
        cout << "Priority Queue (data -> priority):\n";
        for (const auto& elem : arr) {
            cout << "  " << elem.data << " -> " << elem.priority << "\n";
        }
    }
};

int main() {
    PriorityQueue pq;
    
    cout << "=== Priority Queue ===\n\n";
    
    pq.display();
    
    cout << "\nEnqueuing elements:\n";
    pq.enqueue(10, 2);
    pq.enqueue(20, 5);
    pq.enqueue(30, 1);
    pq.enqueue(40, 3);
    
    pq.display();
    
    cout << "\nDequeuing (highest priority first):\n";
    pq.dequeue();
    pq.dequeue();
    
    pq.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Enqueue: O(n) - insertion in sorted order\n";
    cout << "Dequeue: O(n) - removal with shifting\n";
    cout << "Peek: O(1)\n";
    cout << "Space: O(n)\n";
    cout << "Note: Using linked list or heap improves Enqueue to O(log n)\n";
    
    return 0;
}
