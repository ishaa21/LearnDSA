#include <iostream>
#include <vector>
using namespace std;

// Insertion Sort in C++
// Build sorted array one item at a time by inserting elements at correct position

void insertionSort(vector<int>& arr) {
    int n = arr.size();
    for (int i = 1; i < n; i++) {
        int key = arr[i];
        int j = i - 1;
        
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

// Insertion sort with statistics
void insertionSortWithStats(vector<int>& arr) {
    int n = arr.size();
    int comparisons = 0, shifts = 0;
    
    for (int i = 1; i < n; i++) {
        int key = arr[i];
        int j = i - 1;
        
        while (j >= 0 && arr[j] > key) {
            comparisons++;
            arr[j + 1] = arr[j];
            shifts++;
            j--;
        }
        comparisons++;
        arr[j + 1] = key;
    }
    
    cout << "Comparisons: " << comparisons << ", Shifts: " << shifts << "\n";
}

void displayArray(const vector<int>& arr) {
    for (int num : arr)
        cout << num << " ";
    cout << "\n";
}

int main() {
    vector<int> arr = {64, 34, 25, 12, 22, 11, 90};
    
    cout << "Original Array: ";
    displayArray(arr);
    
    insertionSort(arr);
    
    cout << "Sorted Array: ";
    displayArray(arr);
    
    // Test with statistics
    vector<int> arr2 = {64, 34, 25, 12, 22, 11, 90};
    cout << "\nInsertion Sort with statistics:\n";
    insertionSortWithStats(arr2);
    displayArray(arr2);
    
    // Test with already sorted
    vector<int> arr3 = {1, 2, 3, 4, 5};
    cout << "\nAlready sorted array: ";
    displayArray(arr3);
    insertionSort(arr3);
    cout << "After Insertion Sort: ";
    displayArray(arr3);
    
    // Test with reverse sorted
    vector<int> arr4 = {5, 4, 3, 2, 1};
    cout << "\nReverse sorted array: ";
    displayArray(arr4);
    insertionSort(arr4);
    cout << "After Insertion Sort: ";
    displayArray(arr4);
    
    // Test with duplicates
    vector<int> arr5 = {5, 2, 8, 2, 9, 1, 5, 5};
    cout << "\nArray with duplicates: ";
    displayArray(arr5);
    insertionSort(arr5);
    cout << "After Insertion Sort: ";
    displayArray(arr5);
    
    cout << "\nComplexity Analysis:\n";
    cout << "Time Complexity: O(n^2) - Quadratic\n";
    cout << "Space Complexity: O(1) - In-place\n";
    cout << "Best Case: O(n) - Already sorted\n";
    cout << "Worst Case: O(n^2) - Reverse sorted\n";
    cout << "Average Case: O(n^2)\n";
    cout << "Stable: Yes\n";
    cout << "Adaptive: Yes - performs well on nearly sorted data\n";
    
    return 0;
}
