#include <iostream>
using namespace std;

int binarySearch(int arr[], int n, int target) {
    int low = 0;
    int high = n - 1;

    while (low <= high) {
        int mid = low + (high - low) / 2;

        // Check if target is at mid
        if (arr[mid] == target)
            return mid;

        // If target is greater, ignore left half
        if (arr[mid] < target)
            low = mid + 1;

        // If target is smaller, ignore right half
        else
            high = mid - 1;
    }

    // Target was not found
    return -1;
}

int main() {
    int numbers[] = { 2, 5, 8, 12, 16, 23, 38, 56, 72, 91 };
    int n = sizeof(numbers) / sizeof(numbers[0]);
    int target = 23;
    
    int result = binarySearch(numbers, n, target);
    if (result == -1)
        cout << "Element not found";
    else
        cout << "Element found at index " << result;
        
    return 0;
}
