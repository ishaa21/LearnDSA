#include <stdio.h>

// Quick Sort in C
// Divide and conquer algorithm using pivot element partitioning

int partition(int arr[], int low, int high) {
    int pivot = arr[high];
    int i = low - 1;
    
    for (int j = low; j < high; j++) {
        if (arr[j] < pivot) {
            i++;
            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
    }
    
    int temp = arr[i + 1];
    arr[i + 1] = arr[high];
    arr[high] = temp;
    
    return i + 1;
}

void quickSort(int arr[], int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

// Partition using first element as pivot
int partitionFirst(int arr[], int low, int high) {
    int pivot = arr[low];
    int i = low + 1;
    
    for (int j = low + 1; j <= high; j++) {
        if (arr[j] < pivot) {
            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
            i++;
        }
    }
    
    int temp = arr[low];
    arr[low] = arr[i - 1];
    arr[i - 1] = temp;
    
    return i - 1;
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
    
    quickSort(arr, 0, n - 1);
    
    printf("Sorted Array (Quick Sort - Last as pivot): ");
    displayArray(arr, n);
    
    // Test with first as pivot
    int arr2[] = {64, 34, 25, 12, 22, 11, 90};
    printf("\nSorting with first element as pivot:\n");
    quickSort(arr2, 0, 6);
    displayArray(arr2, 7);
    
    // Test with already sorted
    int arr3[] = {1, 2, 3, 4, 5};
    printf("\nAlready sorted: ");
    displayArray(arr3, 5);
    quickSort(arr3, 0, 4);
    printf("After Quick Sort: ");
    displayArray(arr3, 5);
    
    // Test with reverse sorted
    int arr4[] = {5, 4, 3, 2, 1};
    printf("\nReverse sorted: ");
    displayArray(arr4, 5);
    quickSort(arr4, 0, 4);
    printf("After Quick Sort: ");
    displayArray(arr4, 5);
    
    // Test with duplicates
    int arr5[] = {5, 2, 8, 2, 9, 1, 5, 5};
    printf("\nArray with duplicates: ");
    displayArray(arr5, 8);
    quickSort(arr5, 0, 7);
    printf("After Quick Sort: ");
    displayArray(arr5, 8);
    
    printf("\nComplexity Analysis:\n");
    printf("Time Complexity: O(n log n) - Average, O(n^2) - Worst\n");
    printf("Space Complexity: O(log n) - Due to recursion stack\n");
    printf("Best Case: O(n log n)\n");
    printf("Worst Case: O(n^2) - Already sorted or reverse sorted\n");
    printf("Average Case: O(n log n)\n");
    printf("Stable: No (not stable)\n");
    printf("Note: In-place sorting, efficient on large datasets\n");
    
    return 0;
}
