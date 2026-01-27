#include <iostream>
#include <vector>
using namespace std;

// Heap Sort in C++
// Uses max heap to sort array in ascending order

void heapify(vector<int>& arr, int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;
    
    if (left < n && arr[left] > arr[largest])
        largest = left;
    
    if (right < n && arr[right] > arr[largest])
        largest = right;
    
    if (largest != i) {
        swap(arr[i], arr[largest]);
        heapify(arr, n, largest);
    }
}

void heapSort(vector<int>& arr) {
    int n = arr.size();
    
    // Build max heap
    for (int i = n / 2 - 1; i >= 0; i--)
        heapify(arr, n, i);
    
    // Extract elements from heap
    for (int i = n - 1; i > 0; i--) {
        swap(arr[0], arr[i]);
        heapify(arr, i, 0);
    }
}

void displayArray(const vector<int>& arr) {
    for (int num : arr)
        cout << num << " ";
    cout << "\n";
}

int main() {
    vector<int> arr = {64, 34, 25, 12, 22, 11, 90};
    
    cout << "Original Array: ";
    displayArray(arr);
    
    heapSort(arr);
    
    cout << "Sorted Array (Heap Sort): ";
    displayArray(arr);
    
    // Test with already sorted
    vector<int> arr2 = {1, 2, 3, 4, 5};
    cout << "\nAlready sorted: ";
    displayArray(arr2);
    heapSort(arr2);
    cout << "After Heap Sort: ";
    displayArray(arr2);
    
    // Test with reverse sorted
    vector<int> arr3 = {5, 4, 3, 2, 1};
    cout << "\nReverse sorted: ";
    displayArray(arr3);
    heapSort(arr3);
    cout << "After Heap Sort: ";
    displayArray(arr3);
    
    // Test with duplicates
    vector<int> arr4 = {5, 2, 8, 2, 9, 1, 5, 5};
    cout << "\nArray with duplicates: ";
    displayArray(arr4);
    heapSort(arr4);
    cout << "After Heap Sort: ";
    displayArray(arr4);
    
    // Test with single element
    vector<int> arr5 = {42};
    cout << "\nSingle element: ";
    displayArray(arr5);
    heapSort(arr5);
    cout << "After Heap Sort: ";
    displayArray(arr5);
    
    // Test with two elements
    vector<int> arr6 = {50, 30};
    cout << "\nTwo elements: ";
    displayArray(arr6);
    heapSort(arr6);
    cout << "After Heap Sort: ";
    displayArray(arr6);
    
    cout << "\nComplexity Analysis:\n";
    cout << "Time Complexity: O(n log n) - Linearithmic\n";
    cout << "Space Complexity: O(1) - In-place\n";
    cout << "Best Case: O(n log n)\n";
    cout << "Worst Case: O(n log n)\n";
    cout << "Average Case: O(n log n)\n";
    cout << "Stable: No (not stable)\n";
    cout << "Note: In-place, guaranteed O(n log n), good for large datasets\n";
    
    return 0;
}
