#include <stdio.h>

// Searching in Arrays in C
// Linear Search and Binary Search implementations

// Linear Search
int linearSearch(int arr[], int n, int target) {
    for (int i = 0; i < n; i++) {
        if (arr[i] == target)
            return i;
    }
    return -1;
}

// Binary Search (for sorted array)
int binarySearch(int arr[], int n, int target) {
    int left = 0, right = n - 1;
    while (left <= right) {
        int mid = left + (right - left) / 2;
        if (arr[mid] == target)
            return mid;
        else if (arr[mid] < target)
            left = mid + 1;
        else
            right = mid - 1;
    }
    return -1;
}

int main() {
    int arr[] = {10, 20, 30, 40, 50, 60, 70};
    int n = 7;
    int target = 40;
    
    // Linear Search
    printf("Linear Search for %d: ", target);
    int pos = linearSearch(arr, n, target);
    if (pos != -1)
        printf("Found at index %d\n", pos);
    else
        printf("Not found\n");
    
    // Linear Search for non-existing element
    target = 25;
    printf("Linear Search for %d: ", target);
    pos = linearSearch(arr, n, target);
    if (pos != -1)
        printf("Found at index %d\n", pos);
    else
        printf("Not found\n");
    
    // Binary Search (array is sorted)
    target = 50;
    printf("Binary Search for %d: ", target);
    pos = binarySearch(arr, n, target);
    if (pos != -1)
        printf("Found at index %d\n", pos);
    else
        printf("Not found\n");
    
    return 0;
}
