#include <iostream>
#include <vector>
using namespace std;

// Merge Sort in C++
// Divide and conquer algorithm - divide array in half, sort, and merge

void merge(vector<int>& arr, int left, int mid, int right) {
    vector<int> leftArr(arr.begin() + left, arr.begin() + mid + 1);
    vector<int> rightArr(arr.begin() + mid + 1, arr.begin() + right + 1);
    
    int i = 0, j = 0, k = left;
    
    while (i < leftArr.size() && j < rightArr.size()) {
        if (leftArr[i] <= rightArr[j]) {
            arr[k++] = leftArr[i++];
        } else {
            arr[k++] = rightArr[j++];
        }
    }
    
    while (i < leftArr.size())
        arr[k++] = leftArr[i++];
    
    while (j < rightArr.size())
        arr[k++] = rightArr[j++];
}

void mergeSort(vector<int>& arr, int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2;
        
        mergeSort(arr, left, mid);
        mergeSort(arr, mid + 1, right);
        merge(arr, left, mid, right);
    }
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
    
    mergeSort(arr, 0, arr.size() - 1);
    
    cout << "Sorted Array (Merge Sort): ";
    displayArray(arr);
    
    // Test with already sorted
    vector<int> arr2 = {1, 2, 3, 4, 5};
    cout << "\nAlready sorted: ";
    displayArray(arr2);
    mergeSort(arr2, 0, arr2.size() - 1);
    cout << "After Merge Sort: ";
    displayArray(arr2);
    
    // Test with reverse sorted
    vector<int> arr3 = {5, 4, 3, 2, 1};
    cout << "\nReverse sorted: ";
    displayArray(arr3);
    mergeSort(arr3, 0, arr3.size() - 1);
    cout << "After Merge Sort: ";
    displayArray(arr3);
    
    // Test with duplicates
    vector<int> arr4 = {5, 2, 8, 2, 9, 1, 5, 5};
    cout << "\nArray with duplicates: ";
    displayArray(arr4);
    mergeSort(arr4, 0, arr4.size() - 1);
    cout << "After Merge Sort: ";
    displayArray(arr4);
    
    // Test with single element
    vector<int> arr5 = {42};
    cout << "\nSingle element: ";
    displayArray(arr5);
    mergeSort(arr5, 0, arr5.size() - 1);
    cout << "After Merge Sort: ";
    displayArray(arr5);
    
    cout << "\nComplexity Analysis:\n";
    cout << "Time Complexity: O(n log n) - Linearithmic\n";
    cout << "Space Complexity: O(n) - Requires temporary arrays\n";
    cout << "Best Case: O(n log n)\n";
    cout << "Worst Case: O(n log n)\n";
    cout << "Average Case: O(n log n)\n";
    cout << "Stable: Yes\n";
    cout << "Note: Divide and conquer approach, consistent performance\n";
    
    return 0;
}
