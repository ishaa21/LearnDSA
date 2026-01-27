#include <iostream>
#include <vector>
using namespace std;

// Deque (Double Ended Queue) in C++
class Deque {
private:
    vector<int> arr;
    int front;
    int rear;
    int size;
    int maxSize;
    
public:
    Deque(int max_size = 100) : front(-1), rear(-1), size(0), maxSize(max_size) {
        arr.resize(max_size);
    }
    
    bool isEmpty() {
        return size == 0;
    }
    
    bool isFull() {
        return size == maxSize;
    }
    
    void insertFront(int value) {
        if (isFull()) {
            cout << "Deque overflow - cannot insert at front\n";
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
        cout << "Successfully inserted at front: " << value << " (size = " << size << ")\n";
    }
    
    void insertRear(int value) {
        if (isFull()) {
            cout << "Deque overflow - cannot insert at rear\n";
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
        cout << "Successfully inserted at rear: " << value << " (size = " << size << ")\n";
    }
    
    int deleteFront() {
        if (isEmpty()) {
            cout << "Deque underflow - cannot delete from front\n";
            return -1;
        }
        int value = arr[front];
        cout << "Successfully deleted from front: " << value << " (size = " << size - 1 << ")\n";
        
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
            cout << "Deque underflow - cannot delete from rear\n";
            return -1;
        }
        int value = arr[rear];
        cout << "Successfully deleted from rear: " << value << " (size = " << size - 1 << ")\n";
        
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
            cout << "Deque is empty\n";
            return;
        }
        cout << "Deque: ";
        int i = front;
        for (int count = 0; count < size; count++) {
            cout << arr[i] << " ";
            i = (i + 1) % maxSize;
        }
        cout << "\n";
    }
};

int main() {
    Deque d;
    
    cout << "=== Deque (Double Ended Queue) ===\n\n";
    
    d.display();
    
    cout << "\nInserting at rear:\n";
    for (int i = 1; i <= 3; i++) {
        d.insertRear(i * 10);
    }
    
    d.display();
    
    cout << "\nInserting at front:\n";
    d.insertFront(5);
    d.insertFront(2);
    
    d.display();
    
    cout << "\nDeleting from front:\n";
    d.deleteFront();
    
    cout << "\nDeleting from rear:\n";
    d.deleteRear();
    
    d.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Insert Front: O(1)\n";
    cout << "Insert Rear: O(1)\n";
    cout << "Delete Front: O(1)\n";
    cout << "Delete Rear: O(1)\n";
    cout << "Space: O(n)\n";
    cout << "Advantage: Flexible insertion/deletion from both ends\n";
    
    return 0;
}
