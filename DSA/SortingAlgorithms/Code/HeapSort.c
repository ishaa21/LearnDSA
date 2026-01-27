#include <stdio.h>

// Heap Sort in C
// Uses max heap to sort array in ascending order

void heapify(int arr[], int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;
    
    if (left < n && arr[left] > arr[largest])
        largest = left;
    
    if (right < n && arr[right] > arr[largest])
        largest = right;
    
    if (largest != i) {
        int temp = arr[i];
        arr[i] = arr[largest];
        arr[largest] = temp;
        heapify(arr, n, largest);
    }
}

void heapSort(int arr[], int n) {
    // Build max heap
    for (int i = n / 2 - 1; i >= 0; i--)
        heapify(arr, n, i);
    
    // Extract elements from heap one by one
    for (int i = n - 1; i > 0; i--) {
        int temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        heapify(arr, i, 0);
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
    
    heapSort(arr, n);
    
    printf("Sorted Array (Heap Sort): ");
    displayArray(arr, n);
    
    // Test with already sorted
    int arr2[] = {1, 2, 3, 4, 5};
    printf("\nAlready sorted: ");
    displayArray(arr2, 5);
    heapSort(arr2, 5);
    printf("After Heap Sort: ");
    displayArray(arr2, 5);
    
    // Test with reverse sorted
    int arr3[] = {5, 4, 3, 2, 1};
    printf("\nReverse sorted: ");
    displayArray(arr3, 5);
    heapSort(arr3, 5);
    printf("After Heap Sort: ");
    displayArray(arr3, 5);
    
    // Test with duplicates
    int arr4[] = {5, 2, 8, 2, 9, 1, 5, 5};
    printf("\nArray with duplicates: ");
    displayArray(arr4, 8);
    heapSort(arr4, 8);
    printf("After Heap Sort: ");
    displayArray(arr4, 8);
    
    // Test with single element
    int arr5[] = {42};
    printf("\nSingle element: ");
    displayArray(arr5, 1);
    heapSort(arr5, 1);
    printf("After Heap Sort: ");
    displayArray(arr5, 1);
    
    // Test with two elements
    int arr6[] = {50, 30};
    printf("\nTwo elements: ");
    displayArray(arr6, 2);
    heapSort(arr6, 2);
    printf("After Heap Sort: ");
    displayArray(arr6, 2);
    
    printf("\nComplexity Analysis:\n");
    printf("Time Complexity: O(n log n) - Linearithmic\n");
    printf("Space Complexity: O(1) - In-place\n");
    printf("Best Case: O(n log n)\n");
    printf("Worst Case: O(n log n)\n");
    printf("Average Case: O(n log n)\n");
    printf("Stable: No (not stable)\n");
    printf("Note: In-place, guaranteed O(n log n), good for large datasets\n");
    
    return 0;
}
