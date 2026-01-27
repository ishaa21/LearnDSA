#include <stdio.h>
#include <stdlib.h>

// Counting Sort in C
// Non-comparison sort - counts occurrences of each element

void countingSort(int arr[], int n) {
    int max = arr[0];
    for (int i = 1; i < n; i++) {
        if (arr[i] > max)
            max = arr[i];
    }
    
    int *count = (int *)malloc((max + 1) * sizeof(int));
    for (int i = 0; i <= max; i++)
        count[i] = 0;
    
    for (int i = 0; i < n; i++)
        count[arr[i]]++;
    
    for (int i = 1; i <= max; i++)
        count[i] += count[i - 1];
    
    int *output = (int *)malloc(n * sizeof(int));
    for (int i = n - 1; i >= 0; i--) {
        output[count[arr[i]] - 1] = arr[i];
        count[arr[i]]--;
    }
    
    for (int i = 0; i < n; i++)
        arr[i] = output[i];
    
    free(count);
    free(output);
}

// Counting sort with range
void countingSortRange(int arr[], int n, int min, int max) {
    int range = max - min + 1;
    int *count = (int *)malloc(range * sizeof(int));
    
    for (int i = 0; i < range; i++)
        count[i] = 0;
    
    for (int i = 0; i < n; i++)
        count[arr[i] - min]++;
    
    int index = 0;
    for (int i = 0; i < range; i++) {
        for (int j = 0; j < count[i]; j++) {
            arr[index++] = i + min;
        }
    }
    
    free(count);
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
    
    countingSort(arr, n);
    
    printf("Sorted Array (Counting Sort): ");
    displayArray(arr, n);
    
    // Test with small range
    int arr2[] = {4, 2, 3, 4, 1, 2, 4};
    printf("\nSmall range array: ");
    displayArray(arr2, 7);
    countingSort(arr2, 7);
    printf("After Counting Sort: ");
    displayArray(arr2, 7);
    
    // Test with duplicates
    int arr3[] = {5, 2, 8, 2, 9, 1, 5, 5};
    printf("\nArray with duplicates: ");
    displayArray(arr3, 8);
    countingSort(arr3, 8);
    printf("After Counting Sort: ");
    displayArray(arr3, 8);
    
    // Test with negative numbers using range
    int arr4[] = {-2, -5, 3, 1, -2, 0, 3};
    printf("\nArray with negative numbers: ");
    displayArray(arr4, 7);
    countingSortRange(arr4, 7, -5, 3);
    printf("After Counting Sort (Range): ");
    displayArray(arr4, 7);
    
    printf("\nComplexity Analysis:\n");
    printf("Time Complexity: O(n + k) where k is range of input\n");
    printf("Space Complexity: O(k)\n");
    printf("Best Case: O(n + k)\n");
    printf("Worst Case: O(n + k)\n");
    printf("Average Case: O(n + k)\n");
    printf("Stable: Yes\n");
    printf("Note: Non-comparison, efficient for small ranges\n");
    
    return 0;
}
