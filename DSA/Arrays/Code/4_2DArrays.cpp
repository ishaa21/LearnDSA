#include <iostream>
using namespace std;

// 2D Arrays in C++
// Two dimensional arrays are matrix-like structures

int main() {
    // Declaration and initialization
    int arr[3][3] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };
    
    // Accessing elements
    cout << "Element at [0][0]: " << arr[0][0] << endl;
    cout << "Element at [1][2]: " << arr[1][2] << endl;
    cout << "Element at [2][1]: " << arr[2][1] << endl;
    
    // Iterating through 2D array and printing
    cout << "2D Array:\n";
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            cout << arr[i][j] << " ";
        }
        cout << "\n";
    }
    
    // Modifying element
    arr[1][1] = 10;
    cout << "After modification, arr[1][1] = " << arr[1][1] << endl;
    
    // Calculating sum of all elements
    int sum = 0;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            sum += arr[i][j];
        }
    }
    cout << "Sum of all elements: " << sum << endl;
    
    return 0;
}
