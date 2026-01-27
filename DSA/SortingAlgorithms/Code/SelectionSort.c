#include <stdio.h>

// Selection Sort in C
// Find minimum element and place at beginning, repeat for remaining array

void selectionSort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        int minIdx = i;
        for (int j = i + 1; j < n; j++) {
            if (arr[j] < arr[minIdx])
                minIdx = j;
        }
        // Swap
        int temp = arr[i];
        arr[i] = arr[minIdx];
        arr[minIdx] = temp;
    }
}

// Find minimum and swap count
void selectionSortWithSwapCount(int arr[], int n) {
    int swaps = 0;
    for (int i = 0; i < n - 1; i++) {
        int minIdx = i;
        for (int j = i + 1; j < n; j++) {
            if (arr[j] < arr[minIdx])
                minIdx = j;
        }
        if (minIdx != i) {
            int temp = arr[i];
            arr[i] = arr[minIdx];
            arr[minIdx] = temp;
            swaps++;
        }
    }
    printf("Total swaps: %d\n", swaps);
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
    
    selectionSort(arr, n);
    
    printf("Sorted Array: ");
    displayArray(arr, n);
    
    // Test with swap count
    int arr2[] = {64, 34, 25, 12, 22, 11, 90};
    printf("\nSelection Sort with swap count:\n");
    selectionSortWithSwapCount(arr2, 7);
    displayArray(arr2, 7);
    
    // Test with already sorted
    int arr3[] = {1, 2, 3, 4, 5};
    printf("\nAlready sorted array: ");
    displayArray(arr3, 5);
    selectionSort(arr3, 5);
    printf("After Selection Sort: ");
    displayArray(arr3, 5);
    
    // Test with reverse sorted
    int arr4[] = {5, 4, 3, 2, 1};
    printf("\nReverse sorted array: ");
    displayArray(arr4, 5);
    selectionSort(arr4, 5);
    printf("After Selection Sort: ");
    displayArray(arr4, 5);
    
    // Test with duplicates
    int arr5[] = {5, 2, 8, 2, 9, 1, 5, 5};
    printf("\nArray with duplicates: ");
    displayArray(arr5, 8);
    selectionSort(arr5, 8);
    printf("After Selection Sort: ");
    displayArray(arr5, 8);
    
    printf("\nComplexity Analysis:\n");
    printf("Time Complexity: O(n^2) - Quadratic\n");
    printf("Space Complexity: O(1) - In-place\n");
    printf("Best Case: O(n^2)\n");
    printf("Worst Case: O(n^2)\n");
    printf("Average Case: O(n^2)\n");
    printf("Stable: No (not stable)\n");
    printf("Number of swaps: At most n-1\n");
    
    return 0;
}
