#include <iostream>
#include <vector>
using namespace std;

class MaxHeap {
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
        while (i > 0 && arr[parent(i)] < arr[i]) {
            swap(arr[i], arr[parent(i)]);
            i = parent(i);
        }
    }
    
    void heapifyDown(int i) {
        int largest = i;
        int left = leftChild(i);
        int right = rightChild(i);
        
        if (left < arr.size() && arr[left] > arr[largest]) {
            largest = left;
        }
        if (right < arr.size() && arr[right] > arr[largest]) {
            largest = right;
        }
        
        if (largest != i) {
            swap(arr[i], arr[largest]);
            heapifyDown(largest);
        }
    }
    
public:
    void Insert(int key) {
        arr.push_back(key);
        heapifyUp(arr.size() - 1);
    }
    
    int ExtractMax() {
        if (arr.empty()) return -1;
        
        int max = arr[0];
        arr[0] = arr[arr.size() - 1];
        arr.pop_back();
        
        if (!arr.empty()) {
            heapifyDown(0);
        }
        
        return max;
    }
    
    int GetMax() {
        return arr.empty() ? -1 : arr[0];
    }
    
    void PrintHeap() {
        cout << "Max Heap (Array): ";
        for (int val : arr) {
            cout << val << " ";
        }
        cout << "\n";
    }
};

int main() {
    cout << "=== Max Heap (C++) ===\n\n";
    
    MaxHeap heap;
    
    cout << "Inserting: 5, 10, 3, 2, 8, 1\n";
    heap.Insert(5);
    heap.Insert(10);
    heap.Insert(3);
    heap.Insert(2);
    heap.Insert(8);
    heap.Insert(1);
    
    heap.PrintHeap();
    
    cout << "\nExtracting maximum elements:\n";
    cout << "Extract: " << heap.ExtractMax() << "\n";
    heap.PrintHeap();
    cout << "Extract: " << heap.ExtractMax() << "\n";
    heap.PrintHeap();
    
    cout << "\n=== Max Heap Properties ===\n";
    cout << "1. Parent >= Left Child\n";
    cout << "2. Parent >= Right Child\n";
    cout << "3. Complete binary tree (all levels filled except last)\n";
    cout << "4. Maximum element always at root\n\n";
    
    cout << "=== Max Heap Complexity ===\n";
    cout << "Insert:      O(log n)\n";
    cout << "Extract Max: O(log n)\n";
    cout << "Get Max:     O(1)\n";
    cout << "Space:       O(n)\n";
    
    return 0;
}
