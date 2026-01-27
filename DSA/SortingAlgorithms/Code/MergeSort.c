#include <stdio.h>
#include <stdlib.h>

// Merge Sort in C
// Divide and conquer algorithm - divide array in half, sort, and merge

void merge(int arr[], int left, int mid, int right) {
    int n1 = mid - left + 1;
    int n2 = right - mid;
    
    int *leftArr = (int *)malloc(n1 * sizeof(int));
    int *rightArr = (int *)malloc(n2 * sizeof(int));
    
    for (int i = 0; i < n1; i++)
        leftArr[i] = arr[left + i];
    for (int i = 0; i < n2; i++)
        rightArr[i] = arr[mid + 1 + i];
    
    int i = 0, j = 0, k = left;
    
    while (i < n1 && j < n2) {
        if (leftArr[i] <= rightArr[j]) {
            arr[k++] = leftArr[i++];
        } else {
            arr[k++] = rightArr[j++];
        }
    }
    
    while (i < n1)
        arr[k++] = leftArr[i++];
    
    while (j < n2)
        arr[k++] = rightArr[j++];
    
    free(leftArr);
    free(rightArr);
}

void mergeSort(int arr[], int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2;
        
        mergeSort(arr, left, mid);
        mergeSort(arr, mid + 1, right);
        merge(arr, left, mid, right);
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
    
    mergeSort(arr, 0, n - 1);
    
    printf("Sorted Array (Merge Sort): ");
    displayArray(arr, n);
    
    // Test with already sorted
    int arr2[] = {1, 2, 3, 4, 5};
    printf("\nAlready sorted: ");
    displayArray(arr2, 5);
    mergeSort(arr2, 0, 4);
    printf("After Merge Sort: ");
    displayArray(arr2, 5);
    
    // Test with reverse sorted
    int arr3[] = {5, 4, 3, 2, 1};
    printf("\nReverse sorted: ");
    displayArray(arr3, 5);
    mergeSort(arr3, 0, 4);
    printf("After Merge Sort: ");
    displayArray(arr3, 5);
    
    // Test with duplicates
    int arr4[] = {5, 2, 8, 2, 9, 1, 5, 5};
    printf("\nArray with duplicates: ");
    displayArray(arr4, 8);
    mergeSort(arr4, 0, 7);
    printf("After Merge Sort: ");
    displayArray(arr4, 8);
    
    // Test with single element
    int arr5[] = {42};
    printf("\nSingle element: ");
    displayArray(arr5, 1);
    mergeSort(arr5, 0, 0);
    printf("After Merge Sort: ");
    displayArray(arr5, 1);
    
    printf("\nComplexity Analysis:\n");
    printf("Time Complexity: O(n log n) - Linearithmic\n");
    printf("Space Complexity: O(n) - Requires temporary arrays\n");
    printf("Best Case: O(n log n)\n");
    printf("Worst Case: O(n log n)\n");
    printf("Average Case: O(n log n)\n");
    printf("Stable: Yes\n");
    printf("Note: Divide and conquer approach, consistent performance\n");
    
    return 0;
}
