#include <iostream>
using namespace std;

// Introduction to Arrays in C++
// Arrays are fixed-size collections of elements of the same type

int main() {
    // Array declaration and initialization
    int arr[5] = {10, 20, 30, 40, 50};
    
    // Accessing elements
    cout << "First element: " << arr[0] << endl;
    cout << "Last element: " << arr[4] << endl;
    
    // Iterating through array
    cout << "All elements: ";
    for (int i = 0; i < 5; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
    
    // Array size
    int size = sizeof(arr) / sizeof(arr[0]);
    cout << "Array size: " << size << endl;
    
    return 0;
}
