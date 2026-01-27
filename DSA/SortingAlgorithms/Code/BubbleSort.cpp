#include <iostream>
#include <vector>
using namespace std;

// Bubble Sort in C++
// Repeatedly swap adjacent elements if they are in wrong order

void bubbleSort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                swap(arr[j], arr[j + 1]);
            }
        }
    }
}

// Optimized Bubble Sort with early termination
void bubbleSortOptimized(vector<int>& arr) {
    int n = arr.size();
    for (int i = 0; i < n - 1; i++) {
        bool swapped = false;
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                swap(arr[j], arr[j + 1]);
                swapped = true;
            }
        }
        if (!swapped) break;
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
    
    bubbleSortOptimized(arr);
    
    cout << "Sorted Array (Optimized Bubble Sort): ";
    displayArray(arr);
    
    // Test with already sorted array
    vector<int> arr2 = {1, 2, 3, 4, 5};
    cout << "\nAlready sorted array: ";
    displayArray(arr2);
    bubbleSortOptimized(arr2);
    cout << "After Bubble Sort: ";
    displayArray(arr2);
    
    // Test with reverse sorted array
    vector<int> arr3 = {5, 4, 3, 2, 1};
    cout << "\nReverse sorted array: ";
    displayArray(arr3);
    bubbleSortOptimized(arr3);
    cout << "After Bubble Sort: ";
    displayArray(arr3);
    
    // Test with duplicates
    vector<int> arr4 = {5, 2, 8, 2, 9, 1, 5, 5};
    cout << "\nArray with duplicates: ";
    displayArray(arr4);
    bubbleSortOptimized(arr4);
    cout << "After Bubble Sort: ";
    displayArray(arr4);
    
    cout << "\nComplexity Analysis:\n";
    cout << "Time Complexity: O(n^2) - Quadratic\n";
    cout << "Space Complexity: O(1) - In-place\n";
    cout << "Best Case: O(n) - Already sorted (optimized)\n";
    cout << "Worst Case: O(n^2) - Reverse sorted\n";
    cout << "Stable: Yes\n";
    
    return 0;
}
