#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

// Radix Sort in C++
// Sorts by processing individual digits

void countingSortForRadix(vector<int>& arr, int exp) {
    int n = arr.size();
    vector<int> output(n);
    vector<int> count(10, 0);
    
    for (int i = 0; i < n; i++)
        count[(arr[i] / exp) % 10]++;
    
    for (int i = 1; i < 10; i++)
        count[i] += count[i - 1];
    
    for (int i = n - 1; i >= 0; i--) {
        int index = (arr[i] / exp) % 10;
        output[count[index] - 1] = arr[i];
        count[index]--;
    }
    
    arr = output;
}

void radixSort(vector<int>& arr) {
    if (arr.empty()) return;
    
    int maxVal = *max_element(arr.begin(), arr.end());
    
    for (int exp = 1; maxVal / exp > 0; exp *= 10)
        countingSortForRadix(arr, exp);
}

void displayArray(const vector<int>& arr) {
    for (int num : arr)
        cout << num << " ";
    cout << "\n";
}

int main() {
    vector<int> arr = {170, 45, 75, 90, 2, 802, 24, 2, 66};
    
    cout << "Original Array: ";
    displayArray(arr);
    
    radixSort(arr);
    
    cout << "Sorted Array (Radix Sort): ";
    displayArray(arr);
    
    // Test with single digit
    vector<int> arr2 = {5, 2, 8, 3, 9, 1, 4};
    cout << "\nSingle digit array: ";
    displayArray(arr2);
    radixSort(arr2);
    cout << "After Radix Sort: ";
    displayArray(arr2);
    
    // Test with duplicates
    vector<int> arr3 = {50, 25, 85, 25, 90, 10, 50, 50};
    cout << "\nArray with duplicates: ";
    displayArray(arr3);
    radixSort(arr3);
    cout << "After Radix Sort: ";
    displayArray(arr3);
    
    // Test with already sorted
    vector<int> arr4 = {10, 20, 30, 40, 50};
    cout << "\nAlready sorted: ";
    displayArray(arr4);
    radixSort(arr4);
    cout << "After Radix Sort: ";
    displayArray(arr4);
    
    // Test with reverse sorted
    vector<int> arr5 = {500, 400, 300, 200, 100};
    cout << "\nReverse sorted: ";
    displayArray(arr5);
    radixSort(arr5);
    cout << "After Radix Sort: ";
    displayArray(arr5);
    
    cout << "\nComplexity Analysis:\n";
    cout << "Time Complexity: O(d * (n + k)) where d is number of digits\n";
    cout << "Space Complexity: O(n + k)\n";
    cout << "Best Case: O(d * n)\n";
    cout << "Worst Case: O(d * (n + k))\n";
    cout << "Average Case: O(d * (n + k))\n";
    cout << "Stable: Yes\n";
    cout << "Note: Works best for positive integers, efficient for large datasets\n";
    
    return 0;
}
