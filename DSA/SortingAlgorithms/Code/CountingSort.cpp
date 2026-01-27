#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

// Counting Sort in C++
// Non-comparison sort - counts occurrences of each element

void countingSort(vector<int>& arr) {
    if (arr.empty()) return;
    
    int maxVal = *max_element(arr.begin(), arr.end());
    int minVal = *min_element(arr.begin(), arr.end());
    int range = maxVal - minVal + 1;
    
    vector<int> count(range, 0);
    
    for (int num : arr)
        count[num - minVal]++;
    
    for (int i = 1; i < range; i++)
        count[i] += count[i - 1];
    
    vector<int> output(arr.size());
    for (int i = arr.size() - 1; i >= 0; i--) {
        output[count[arr[i] - minVal] - 1] = arr[i];
        count[arr[i] - minVal]--;
    }
    
    arr = output;
}

// Counting sort for range [0, k]
void countingSortRange(vector<int>& arr, int maxVal) {
    vector<int> count(maxVal + 1, 0);
    
    for (int num : arr)
        count[num]++;
    
    int index = 0;
    for (int i = 0; i <= maxVal; i++) {
        for (int j = 0; j < count[i]; j++) {
            arr[index++] = i;
        }
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
    
    countingSort(arr);
    
    cout << "Sorted Array (Counting Sort): ";
    displayArray(arr);
    
    // Test with small range
    vector<int> arr2 = {4, 2, 3, 4, 1, 2, 4};
    cout << "\nSmall range array: ";
    displayArray(arr2);
    countingSortRange(arr2, 4);
    cout << "After Counting Sort: ";
    displayArray(arr2);
    
    // Test with duplicates
    vector<int> arr3 = {5, 2, 8, 2, 9, 1, 5, 5};
    cout << "\nArray with duplicates: ";
    displayArray(arr3);
    countingSort(arr3);
    cout << "After Counting Sort: ";
    displayArray(arr3);
    
    // Test with single element
    vector<int> arr4 = {42};
    cout << "\nSingle element: ";
    displayArray(arr4);
    countingSort(arr4);
    cout << "After Counting Sort: ";
    displayArray(arr4);
    
    cout << "\nComplexity Analysis:\n";
    cout << "Time Complexity: O(n + k) where k is range of input\n";
    cout << "Space Complexity: O(k)\n";
    cout << "Best Case: O(n + k)\n";
    cout << "Worst Case: O(n + k)\n";
    cout << "Average Case: O(n + k)\n";
    cout << "Stable: Yes\n";
    cout << "Note: Non-comparison, efficient for small ranges\n";
    
    return 0;
}
