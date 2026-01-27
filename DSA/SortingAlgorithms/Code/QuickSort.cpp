#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>
using namespace std;

// Quick Sort in C++
// Divide and conquer algorithm using pivot element partitioning

int partition(vector<int>& arr, int low, int high) {
    int pivot = arr[high];
    int i = low - 1;
    
    for (int j = low; j < high; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(arr[i], arr[j]);
        }
    }
    
    swap(arr[i + 1], arr[high]);
    return i + 1;
}

// Random pivot selection
int partitionRandom(vector<int>& arr, int low, int high) {
    int randomIdx = low + rand() % (high - low + 1);
    swap(arr[randomIdx], arr[high]);
    return partition(arr, low, high);
}

void quickSort(vector<int>& arr, int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

void quickSortRandom(vector<int>& arr, int low, int high) {
    if (low < high) {
        int pi = partitionRandom(arr, low, high);
        
        quickSortRandom(arr, low, pi - 1);
        quickSortRandom(arr, pi + 1, high);
    }
}

void displayArray(const vector<int>& arr) {
    for (int num : arr)
        cout << num << " ";
    cout << "\n";
}

int main() {
    srand(time(0));
    
    vector<int> arr = {64, 34, 25, 12, 22, 11, 90};
    
    cout << "Original Array: ";
    displayArray(arr);
    
    quickSort(arr, 0, arr.size() - 1);
    
    cout << "Sorted Array (Quick Sort - Last as pivot): ";
    displayArray(arr);
    
    // Test with random pivot
    vector<int> arr2 = {64, 34, 25, 12, 22, 11, 90};
    cout << "\nSorting with random pivot:\n";
    quickSortRandom(arr2, 0, arr2.size() - 1);
    displayArray(arr2);
    
    // Test with already sorted
    vector<int> arr3 = {1, 2, 3, 4, 5};
    cout << "\nAlready sorted: ";
    displayArray(arr3);
    quickSort(arr3, 0, arr3.size() - 1);
    cout << "After Quick Sort: ";
    displayArray(arr3);
    
    // Test with reverse sorted
    vector<int> arr4 = {5, 4, 3, 2, 1};
    cout << "\nReverse sorted: ";
    displayArray(arr4);
    quickSort(arr4, 0, arr4.size() - 1);
    cout << "After Quick Sort: ";
    displayArray(arr4);
    
    // Test with duplicates
    vector<int> arr5 = {5, 2, 8, 2, 9, 1, 5, 5};
    cout << "\nArray with duplicates: ";
    displayArray(arr5);
    quickSort(arr5, 0, arr5.size() - 1);
    cout << "After Quick Sort: ";
    displayArray(arr5);
    
    cout << "\nComplexity Analysis:\n";
    cout << "Time Complexity: O(n log n) - Average, O(n^2) - Worst\n";
    cout << "Space Complexity: O(log n) - Due to recursion stack\n";
    cout << "Best Case: O(n log n)\n";
    cout << "Worst Case: O(n^2) - Already sorted or reverse sorted\n";
    cout << "Average Case: O(n log n)\n";
    cout << "Stable: No (not stable)\n";
    cout << "Note: In-place sorting, efficient on large datasets\n";
    
    return 0;
}
