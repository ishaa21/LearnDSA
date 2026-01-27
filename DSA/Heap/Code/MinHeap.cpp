#include <iostream>
#include <vector>
using namespace std;

class MinHeap {
private:
    vector<int> arr;
    
    int parent(int i) {
        return (i - 1) / 2;
    }
    
    int leftChild(int i) {
        return 2 * i + 1;
    }
    
    int rightChild(int i) {
        return 2 * i + 2;
    }
    
    void swap(int& a, int& b) {
        int temp = a;
        a = b;
        b = temp;
    }
    
    void heapifyUp(int i) {
        while (i > 0 && arr[parent(i)] > arr[i]) {
            swap(arr[i], arr[parent(i)]);
            i = parent(i);
        }
    }
    
    void heapifyDown(int i) {
        int smallest = i;
        int left = leftChild(i);
        int right = rightChild(i);
        
        if (left < arr.size() && arr[left] < arr[smallest]) {
            smallest = left;
        }
        if (right < arr.size() && arr[right] < arr[smallest]) {
            smallest = right;
        }
        
        if (smallest != i) {
            swap(arr[i], arr[smallest]);
            heapifyDown(smallest);
        }
    }
    
public:
    void Insert(int key) {
        arr.push_back(key);
        heapifyUp(arr.size() - 1);
    }
    
    int ExtractMin() {
        if (arr.empty()) return -1;
        
        int min = arr[0];
        arr[0] = arr[arr.size() - 1];
        arr.pop_back();
        
        if (!arr.empty()) {
            heapifyDown(0);
        }
        
        return min;
    }
    
    int GetMin() {
        return arr.empty() ? -1 : arr[0];
    }
    
    void PrintHeap() {
        cout << "Min Heap (Array): ";
        for (int val : arr) {
            cout << val << " ";
        }
        cout << "\n";
    }
};

int main() {
    cout << "=== Min Heap (C++) ===\n\n";
    
    MinHeap heap;
    
    cout << "Inserting: 10, 5, 3, 2, 8, 1\n";
    heap.Insert(10);
    heap.Insert(5);
    heap.Insert(3);
    heap.Insert(2);
    heap.Insert(8);
    heap.Insert(1);
    
    heap.PrintHeap();
    
    cout << "\nExtracting minimum elements:\n";
    cout << "Extract: " << heap.ExtractMin() << "\n";
    heap.PrintHeap();
    cout << "Extract: " << heap.ExtractMin() << "\n";
    heap.PrintHeap();
    
    cout << "\n=== Min Heap Properties ===\n";
    cout << "1. Parent <= Left Child\n";
    cout << "2. Parent <= Right Child\n";
    cout << "3. Complete binary tree (all levels filled except last)\n";
    cout << "4. Minimum element always at root\n\n";
    
    cout << "=== Min Heap Complexity ===\n";
    cout << "Insert:      O(log n)\n";
    cout << "Extract Min: O(log n)\n";
    cout << "Get Min:     O(1)\n";
    cout << "Space:       O(n)\n";
    
    return 0;
}
