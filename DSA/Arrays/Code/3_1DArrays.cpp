#include <iostream>
using namespace std;

// 1D Arrays in C++
// Single dimensional arrays store elements in a linear fashion

int main() {
    // Declaration and initialization
    int arr[5] = {10, 20, 30, 40, 50};
    
    // Accessing elements
    cout << "Element at index 0: " << arr[0] << endl;
    cout << "Element at index 2: " << arr[2] << endl;
    
    // Modifying elements
    arr[1] = 25;
    cout << "Modified element at index 1: " << arr[1] << endl;
    
    // Iterating and printing all elements
    cout << "All elements: ";
    for (int i = 0; i < 5; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
    
    // Finding sum
    int sum = 0;
    for (int i = 0; i < 5; i++) {
        sum += arr[i];
    }
    cout << "Sum of all elements: " << sum << endl;
    
    return 0;
}
