#include <iostream>
using namespace std;

// Array Deletion in C++
// Remove an element from a specific position in an array

void deleteElement(int arr[], int &n, int position) {
    // Shift elements to the left
    for (int i = position; i < n - 1; i++) {
        arr[i] = arr[i + 1];
    }
    n--;  // Decrease size
}

void displayArray(int arr[], int n) {
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << "\n";
}

int main() {
    int arr[] = {10, 20, 30, 40, 50};
    int n = 5;
    
    cout << "Original array: ";
    displayArray(arr, n);
    
    // Delete from beginning
    deleteElement(arr, n, 0);
    cout << "After deleting first element: ";
    displayArray(arr, n);
    
    // Delete from middle
    deleteElement(arr, n, 1);
    cout << "After deleting element at position 1: ";
    displayArray(arr, n);
    
    // Delete from end
    deleteElement(arr, n, n - 1);
    cout << "After deleting last element: ";
    displayArray(arr, n);
    
    return 0;
}
