#include <iostream>
using namespace std;

// Linear Search in C++
// Search for an element by checking each element sequentially

int linearSearch(int arr[], int n, int target) {
    for (int i = 0; i < n; i++) {
        if (arr[i] == target)
            return i;  // Return index if found
    }
    return -1;  // Return -1 if not found
}

void displayArray(int arr[], int n) {
    for (int i = 0; i < n; i++)
        cout << arr[i] << " ";
    cout << "\n";
}

// Advanced: Linear search with callback
void linearSearchAll(int arr[], int n, int target) {
    cout << "All occurrences of " << target << ": ";
    bool found = false;
    for (int i = 0; i < n; i++) {
        if (arr[i] == target) {
            cout << "index " << i << " ";
            found = true;
        }
    }
    if (!found)
        cout << "Not found";
    cout << "\n";
}

int main() {
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = 7;
    int target;
    
    cout << "Array: ";
    displayArray(arr, n);
    
    // Test 1: Search for existing element
    target = 22;
    cout << "\nSearching for " << target << ": ";
    int result = linearSearch(arr, n, target);
    if (result != -1)
        cout << "Found at index " << result << "\n";
    else
        cout << "Not found\n";
    
    // Test 2: Search for first element
    target = 64;
    cout << "Searching for " << target << ": ";
    result = linearSearch(arr, n, target);
    if (result != -1)
        cout << "Found at index " << result << "\n";
    else
        cout << "Not found\n";
    
    // Test 3: Search for last element
    target = 90;
    cout << "Searching for " << target << ": ";
    result = linearSearch(arr, n, target);
    if (result != -1)
        cout << "Found at index " << result << "\n";
    else
        cout << "Not found\n";
    
    // Test 4: Search for non-existing element
    target = 100;
    cout << "Searching for " << target << ": ";
    result = linearSearch(arr, n, target);
    if (result != -1)
        cout << "Found at index " << result << "\n";
    else
        cout << "Not found\n";
    
    // Test 5: Find all occurrences
    cout << "\n";
    int arr2[] = {10, 20, 30, 20, 40, 20};
    int n2 = 6;
    cout << "Array 2: ";
    displayArray(arr2, n2);
    linearSearchAll(arr2, n2, 20);
    
    // Complexity Analysis
    cout << "\nComplexity Analysis:\n";
    cout << "Time Complexity: O(n) - Linear\n";
    cout << "Space Complexity: O(1) - Constant\n";
    
    return 0;
}
