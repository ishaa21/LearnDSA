#include <iostream>
#include <array>
using namespace std;

// Array Declaration & Initialization in C++
// Different ways to declare and initialize arrays

int main() {
    // Method 1: C-style array with initialization
    int arr1[5] = {1, 2, 3, 4, 5};
    
    // Method 2: Size inferred from initialization
    int arr2[] = {10, 20, 30, 40};
    
    // Method 3: Partial initialization (remaining elements are 0)
    int arr3[5] = {100, 200};
    
    // Method 4: std::array (C++11)
    array<int, 5> arr4 = {5, 10, 15, 20, 25};
    
    // Method 5: Uniform initialization (C++11)
    int arr5[3]{30, 60, 90};
    
    cout << "arr1: ";
    for (int i = 0; i < 5; i++) cout << arr1[i] << " ";
    cout << "\n";
    
    cout << "arr2: ";
    for (int i = 0; i < 4; i++) cout << arr2[i] << " ";
    cout << "\n";
    
    cout << "arr3 (partial init): ";
    for (int i = 0; i < 5; i++) cout << arr3[i] << " ";
    cout << "\n";
    
    cout << "arr4 (std::array): ";
    for (int i = 0; i < arr4.size(); i++) cout << arr4[i] << " ";
    cout << "\n";
    
    cout << "arr5 (uniform init): ";
    for (int i = 0; i < 3; i++) cout << arr5[i] << " ";
    cout << "\n";
    
    return 0;
}
