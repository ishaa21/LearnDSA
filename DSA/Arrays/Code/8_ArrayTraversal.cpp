#include <iostream>
using namespace std;

// Array Traversal in C++
// Accessing and processing each element of an array

int main() {
    int arr[] = {10, 20, 30, 40, 50};
    int n = 5;
    
    // Method 1: Forward traversal using for loop
    cout << "Forward traversal:\n";
    for (int i = 0; i < n; i++) {
        cout << "arr[" << i << "] = " << arr[i] << "\n";
    }
    
    // Method 2: Backward traversal
    cout << "\nBackward traversal:\n";
    for (int i = n - 1; i >= 0; i--) {
        cout << "arr[" << i << "] = " << arr[i] << "\n";
    }
    
    // Method 3: Range-based for loop (C++11)
    cout << "\nRange-based for loop:\n";
    for (int val : arr) {
        cout << "Value: " << val << "\n";
    }
    
    // Method 4: Traversal with pointer
    cout << "\nTraversal with pointer:\n";
    int *ptr = arr;
    for (int i = 0; i < n; i++) {
        cout << "Value: " << *(ptr + i) << "\n";
    }
    
    // Method 5: Calculate sum during traversal
    int sum = 0;
    for (int val : arr) {
        sum += val;
    }
    cout << "\nSum of all elements: " << sum << "\n";
    
    return 0;
}
