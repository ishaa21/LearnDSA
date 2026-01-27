#include <iostream>
using namespace std;

// Array Update in C++
// Modify/Update elements at specific positions

void updateElement(int arr[], int position, int newValue) {
    arr[position] = newValue;
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
    
    // Method 1: Direct update
    arr[0] = 15;
    cout << "After updating index 0 to 15: ";
    displayArray(arr, n);
    
    // Method 2: Using function
    updateElement(arr, 2, 35);
    cout << "After updating index 2 to 35: ";
    displayArray(arr, n);
    
    // Method 3: Conditional update
    for (int i = 0; i < n; i++) {
        if (arr[i] > 20) {
            arr[i] *= 2;
        }
    }
    cout << "After doubling elements > 20: ";
    displayArray(arr, n);
    
    // Method 4: Update all elements
    int addValue = 5;
    for (int i = 0; i < n; i++) {
        arr[i] += addValue;
    }
    cout << "After adding 5 to all elements: ";
    displayArray(arr, n);
    
    return 0;
}
