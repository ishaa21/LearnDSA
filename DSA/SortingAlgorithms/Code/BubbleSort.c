#include <stdio.h>

// Bubble Sort in C
// Repeatedly swap adjacent elements if they are in wrong order

void bubbleSort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                // Swap
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

// Optimized Bubble Sort with early termination
void bubbleSortOptimized(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        int swapped = 0;
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
                swapped = 1;
            }
        }
        if (!swapped) break;  // Already sorted
    }
}

void displayArray(int arr[], int n) {
    for (int i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main() {
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = 7;
    
    printf("Original Array: ");
    displayArray(arr, n);
    
    bubbleSort(arr, n);
    
    printf("Sorted Array (Bubble Sort): ");
    displayArray(arr, n);
    
    // Test optimized version
    int arr2[] = {64, 34, 25, 12, 22, 11, 90};
    bubbleSortOptimized(arr2, 7);
    printf("Sorted Array (Optimized): ");
    displayArray(arr2, 7);
    
    // Test with already sorted array
    int arr3[] = {1, 2, 3, 4, 5};
    printf("\nAlready sorted array: ");
    displayArray(arr3, 5);
    bubbleSortOptimized(arr3, 5);
    printf("After Bubble Sort: ");
    displayArray(arr3, 5);
    
    // Test with reverse sorted array
    int arr4[] = {5, 4, 3, 2, 1};
    printf("\nReverse sorted array: ");
    displayArray(arr4, 5);
    bubbleSort(arr4, 5);
    printf("After Bubble Sort: ");
    displayArray(arr4, 5);
    
    printf("\nComplexity Analysis:\n");
    printf("Time Complexity: O(n^2) - Quadratic\n");
    printf("Space Complexity: O(1) - In-place\n");
    printf("Best Case: O(n) - Already sorted (with optimization)\n");
    printf("Worst Case: O(n^2) - Reverse sorted\n");
    printf("Stable: Yes\n");
    
    return 0;
}
