#include <stdio.h>

// Binary Search in C
// Search for an element in a sorted array by dividing search space in half

int binarySearch(int arr[], int n, int target) {
    int left = 0, right = n - 1;
    
    while (left <= right) {
        int mid = left + (right - left) / 2;
        
        if (arr[mid] == target)
            return mid;  // Element found
        else if (arr[mid] < target)
            left = mid + 1;  // Search in right half
        else
            right = mid - 1;  // Search in left half
    }
    return -1;  // Element not found
}

// Recursive binary search
int binarySearchRecursive(int arr[], int left, int right, int target) {
    if (left > right)
        return -1;
    
    int mid = left + (right - left) / 2;
    
    if (arr[mid] == target)
        return mid;
    else if (arr[mid] < target)
        return binarySearchRecursive(arr, mid + 1, right, target);
    else
        return binarySearchRecursive(arr, left, mid - 1, target);
}

void displayArray(int arr[], int n) {
    for (int i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main() {
    // IMPORTANT: Array must be sorted for binary search
    int arr[] = {11, 12, 22, 25, 34, 64, 90};
    int n = 7;
    int target;
    
    printf("Sorted Array: ");
    displayArray(arr, n);
    
    // Test 1: Search for element in middle
    target = 25;
    printf("\nSearching for %d (Iterative): ", target);
    int result = binarySearch(arr, n, target);
    if (result != -1)
        printf("Found at index %d\n", result);
    else
        printf("Not found\n");
    
    // Test 2: Search using recursive approach
    printf("Searching for %d (Recursive): ", target);
    result = binarySearchRecursive(arr, 0, n - 1, target);
    if (result != -1)
        printf("Found at index %d\n", result);
    else
        printf("Not found\n");
    
    // Test 3: Search for first element
    target = 11;
    printf("Searching for %d: ", target);
    result = binarySearch(arr, n, target);
    if (result != -1)
        printf("Found at index %d\n", result);
    else
        printf("Not found\n");
    
    // Test 4: Search for last element
    target = 90;
    printf("Searching for %d: ", target);
    result = binarySearch(arr, n, target);
    if (result != -1)
        printf("Found at index %d\n", result);
    else
        printf("Not found\n");
    
    // Test 5: Search for non-existing element
    target = 50;
    printf("Searching for %d: ", target);
    result = binarySearch(arr, n, target);
    if (result != -1)
        printf("Found at index %d\n", result);
    else
        printf("Not found\n");
    
    // Time Complexity Analysis
    printf("\nComplexity Analysis:\n");
    printf("Time Complexity: O(log n) - Logarithmic\n");
    printf("Space Complexity: O(1) - Iterative, O(log n) - Recursive\n");
    printf("Best Case: O(1) - Element at middle\n");
    printf("Worst Case: O(log n) - Element not found or at extreme\n");
    
    return 0;
}
