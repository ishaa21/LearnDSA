#include <iostream>
#include <vector>
using namespace std;

// Selection Sort in C++
// Find minimum element and place at beginning, repeat for remaining array

void selectionSort(vector<int>& arr) {
    int n = arr.size();
    for (int i = 0; i < n - 1; i++) {
        int minIdx = i;
        for (int j = i + 1; j < n; j++) {
            if (arr[j] < arr[minIdx])
                minIdx = j;
        }
        swap(arr[i], arr[minIdx]);
    }
}

// Selection sort with comparisons and swaps count
void selectionSortWithStats(vector<int>& arr) {
    int n = arr.size();
    int comparisons = 0, swaps = 0;
    
    for (int i = 0; i < n - 1; i++) {
        int minIdx = i;
        for (int j = i + 1; j < n; j++) {
            comparisons++;
            if (arr[j] < arr[minIdx])
                minIdx = j;
        }
        if (minIdx != i) {
            swap(arr[i], arr[minIdx]);
            swaps++;
        }
    }
    
    cout << "Comparisons: " << comparisons << ", Swaps: " << swaps << "\n";
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
    
    selectionSort(arr);
    
    cout << "Sorted Array: ";
    displayArray(arr);
    
    // Test with statistics
    vector<int> arr2 = {64, 34, 25, 12, 22, 11, 90};
    cout << "\nSelection Sort with statistics:\n";
    selectionSortWithStats(arr2);
    displayArray(arr2);
    
    // Test with already sorted
    vector<int> arr3 = {1, 2, 3, 4, 5};
    cout << "\nAlready sorted array: ";
    displayArray(arr3);
    selectionSort(arr3);
    cout << "After Selection Sort: ";
    displayArray(arr3);
    
    // Test with reverse sorted
    vector<int> arr4 = {5, 4, 3, 2, 1};
    cout << "\nReverse sorted array: ";
    displayArray(arr4);
    selectionSort(arr4);
    cout << "After Selection Sort: ";
    displayArray(arr4);
    
    // Test with duplicates
    vector<int> arr5 = {5, 2, 8, 2, 9, 1, 5, 5};
    cout << "\nArray with duplicates: ";
    displayArray(arr5);
    selectionSort(arr5);
    cout << "After Selection Sort: ";
    displayArray(arr5);
    
    cout << "\nComplexity Analysis:\n";
    cout << "Time Complexity: O(n^2) - Quadratic\n";
    cout << "Space Complexity: O(1) - In-place\n";
    cout << "Best Case: O(n^2)\n";
    cout << "Worst Case: O(n^2)\n";
    cout << "Average Case: O(n^2)\n";
    cout << "Stable: No (not stable)\n";
    cout << "Number of swaps: At most n-1\n";
    
    return 0;
}
