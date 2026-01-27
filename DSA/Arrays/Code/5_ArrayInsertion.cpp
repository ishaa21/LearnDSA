#include <iostream>
using namespace std;

// Array Insertion in C++
// Insert an element at a specific position in an array

void insertElement(int arr[], int &n, int position, int value) {
    // Shift elements to the right
    for (int i = n - 1; i >= position; i--) {
        arr[i + 1] = arr[i];
    }
    // Insert new element
    arr[position] = value;
    n++;  // Increase size
}

void displayArray(int arr[], int n) {
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << "\n";
}

int main() {
    int arr[10] = {10, 20, 30, 40, 50};
    int n = 5;
    
    cout << "Original array: ";
    displayArray(arr, n);
    
    // Insert at beginning
    insertElement(arr, n, 0, 5);
    cout << "After inserting 5 at beginning: ";
    displayArray(arr, n);
    
    // Insert at middle
    insertElement(arr, n, 3, 25);
    cout << "After inserting 25 at position 3: ";
    displayArray(arr, n);
    
    // Insert at end
    insertElement(arr, n, n, 60);
    cout << "After inserting 60 at end: ";
    displayArray(arr, n);
    
    return 0;
}
