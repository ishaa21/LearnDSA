#include <stdio.h>

// Linear Search in C
// Search for an element by checking each element sequentially

int linearSearch(int arr[], int n, int target) {
    for (int i = 0; i < n; i++) {
        if (arr[i] == target)
            return i;  // Return index if found
    }
    return -1;  // Return -1 if not found
}

void displayArray(int arr[], int n) {
    for (int i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main() {
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = 7;
    int target;
    
    printf("Array: ");
    displayArray(arr, n);
    
    // Test 1: Search for existing element
    target = 22;
    printf("\nSearching for %d: ", target);
    int result = linearSearch(arr, n, target);
    if (result != -1)
        printf("Found at index %d\n", result);
    else
        printf("Not found\n");
    
    // Test 2: Search for another element
    target = 90;
    printf("Searching for %d: ", target);
    result = linearSearch(arr, n, target);
    if (result != -1)
        printf("Found at index %d\n", result);
    else
        printf("Not found\n");
    
    // Test 3: Search for non-existing element
    target = 50;
    printf("Searching for %d: ", target);
    result = linearSearch(arr, n, target);
    if (result != -1)
        printf("Found at index %d\n", result);
    else
        printf("Not found\n");
    
    // Test 4: Count occurrences
    printf("\nCounting occurrences of 22: ");
    int count = 0;
    for (int i = 0; i < n; i++) {
        if (arr[i] == 22)
            count++;
    }
    printf("%d\n", count);
    
    // Time Complexity: O(n)
    // Space Complexity: O(1)
    printf("\nTime Complexity: O(n)\n");
    printf("Space Complexity: O(1)\n");
    
    return 0;
}
