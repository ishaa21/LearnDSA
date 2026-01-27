#include <iostream>
#include <algorithm>
using namespace std;

// Sorting in Arrays in C++
// Bubble Sort, Selection Sort, and built-in sort

// Bubble Sort
void bubbleSort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                swap(arr[j], arr[j + 1]);
            }
        }
    }
}

// Selection Sort
void selectionSort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        int minIdx = i;
        for (int j = i + 1; j < n; j++) {
            if (arr[j] < arr[minIdx])
                minIdx = j;
        }
        swap(arr[i], arr[minIdx]);
    }
}

void displayArray(int arr[], int n) {
    for (int i = 0; i < n; i++)
        cout << arr[i] << " ";
    cout << "\n";
}

int main() {
    int arr1[] = {64, 34, 25, 12, 22, 11, 90};
    int arr2[] = {64, 34, 25, 12, 22, 11, 90};
    int arr3[] = {64, 34, 25, 12, 22, 11, 90};
    int n = 7;
    
    cout << "Original array: ";
    displayArray(arr1, n);
    
    // Bubble Sort
    bubbleSort(arr1, n);
    cout << "After Bubble Sort: ";
    displayArray(arr1, n);
    
    // Selection Sort
    selectionSort(arr2, n);
    cout << "After Selection Sort: ";
    displayArray(arr2, n);
    
    // Using STL sort
    sort(arr3, arr3 + n);
    cout << "After std::sort: ";
    displayArray(arr3, n);
    
    return 0;
}
