#include <stdio.h>

// Insertion Sort in C
// Build sorted array one item at a time by inserting elements at correct position

void insertionSort(int arr[], int n) {
    for (int i = 1; i < n; i++) {
        int key = arr[i];
        int j = i - 1;
        
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

// Insertion sort with shift count
void insertionSortWithShifts(int arr[], int n) {
    int shifts = 0;
    for (int i = 1; i < n; i++) {
        int key = arr[i];
        int j = i - 1;
        
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            shifts++;
            j--;
        }
        arr[j + 1] = key;
    }
    printf("Total shifts: %d\n", shifts);
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
    
    insertionSort(arr, n);
    
    printf("Sorted Array: ");
    displayArray(arr, n);
    
    // Test with shift count
    int arr2[] = {64, 34, 25, 12, 22, 11, 90};
    printf("\nInsertion Sort with shift count:\n");
    insertionSortWithShifts(arr2, 7);
    displayArray(arr2, 7);
    
    // Test with already sorted
    int arr3[] = {1, 2, 3, 4, 5};
    printf("\nAlready sorted array: ");
    displayArray(arr3, 5);
    insertionSort(arr3, 5);
    printf("After Insertion Sort: ");
    displayArray(arr3, 5);
    
    // Test with reverse sorted
    int arr4[] = {5, 4, 3, 2, 1};
    printf("\nReverse sorted array: ");
    displayArray(arr4, 5);
    insertionSort(arr4, 5);
    printf("After Insertion Sort: ");
    displayArray(arr4, 5);
    
    // Test with duplicates
    int arr5[] = {5, 2, 8, 2, 9, 1, 5, 5};
    printf("\nArray with duplicates: ");
    displayArray(arr5, 8);
    insertionSort(arr5, 8);
    printf("After Insertion Sort: ");
    displayArray(arr5, 8);
    
    printf("\nComplexity Analysis:\n");
    printf("Time Complexity: O(n^2) - Quadratic\n");
    printf("Space Complexity: O(1) - In-place\n");
    printf("Best Case: O(n) - Already sorted\n");
    printf("Worst Case: O(n^2) - Reverse sorted\n");
    printf("Average Case: O(n^2)\n");
    printf("Stable: Yes\n");
    printf("Adaptive: Yes - performs well on nearly sorted data\n");
    
    return 0;
}
