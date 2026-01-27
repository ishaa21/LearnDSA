#include <iostream>
#include <vector>
using namespace std;

class Heapify {
private:
    void swap(int& a, int& b) {
        int temp = a;
        a = b;
        b = temp;
    }
    
    int leftChild(int i) {
        return 2 * i + 1;
    }
    
    int rightChild(int i) {
        return 2 * i + 2;
    }
    
public:
    void minHeapify(vector<int>& arr, int n, int i) {
        int smallest = i;
        int left = leftChild(i);
        int right = rightChild(i);
        
        if (left < n && arr[left] < arr[smallest]) {
            smallest = left;
        }
        if (right < n && arr[right] < arr[smallest]) {
            smallest = right;
        }
        
        if (smallest != i) {
            swap(arr[i], arr[smallest]);
            minHeapify(arr, n, smallest);
        }
    }
    
    void maxHeapify(vector<int>& arr, int n, int i) {
        int largest = i;
        int left = leftChild(i);
        int right = rightChild(i);
        
        if (left < n && arr[left] > arr[largest]) {
            largest = left;
        }
        if (right < n && arr[right] > arr[largest]) {
            largest = right;
        }
        
        if (largest != i) {
            swap(arr[i], arr[largest]);
            maxHeapify(arr, n, largest);
        }
    }
    
    void buildMinHeap(vector<int>& arr) {
        int n = arr.size();
        for (int i = n / 2 - 1; i >= 0; i--) {
            minHeapify(arr, n, i);
        }
    }
    
    void buildMaxHeap(vector<int>& arr) {
        int n = arr.size();
        for (int i = n / 2 - 1; i >= 0; i--) {
            maxHeapify(arr, n, i);
        }
    }
    
    void printArray(vector<int>& arr) {
        for (int val : arr) {
            cout << val << " ";
        }
        cout << "\n";
    }
};

int main() {
    cout << "=== Heapify (C++) ===\n\n";
    
    Heapify h;
    
    vector<int> arr1 = {4, 10, 3, 5, 1, 2, 8};
    cout << "Original Array: ";
    h.printArray(arr1);
    
    cout << "\nBuilding Min Heap:\n";
    h.buildMinHeap(arr1);
    cout << "Min Heap: ";
    h.printArray(arr1);
    
    vector<int> arr2 = {4, 10, 3, 5, 1, 2, 8};
    cout << "\nBuilding Max Heap:\n";
    h.buildMaxHeap(arr2);
    cout << "Max Heap: ";
    h.printArray(arr2);
    
    cout << "\n=== Heapify Algorithm ===\n";
    cout << "1. Start from last non-leaf node (index n/2 - 1)\n";
    cout << "2. Call heapify for each node from bottom to top\n";
    cout << "3. Heapify moves element down to correct position\n";
    cout << "4. Recursively heapify affected subtrees\n\n";
    
    cout << "=== Heapify Complexity ===\n";
    cout << "Time Complexity:  O(n)\n";
    cout << "Space Complexity: O(log n) for recursion\n";
    cout << "Applications: Heap Sort, Priority Queue construction\n";
    
    return 0;
}
