#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Radix Sort in C
// Sorts by processing individual digits

void countingSortForRadix(int arr[], int n, int exp) {
    int output[n];
    int count[10] = {0};
    
    for (int i = 0; i < n; i++)
        count[(arr[i] / exp) % 10]++;
    
    for (int i = 1; i < 10; i++)
        count[i] += count[i - 1];
    
    for (int i = n - 1; i >= 0; i--) {
        int index = (arr[i] / exp) % 10;
        output[count[index] - 1] = arr[i];
        count[index]--;
    }
    
    for (int i = 0; i < n; i++)
        arr[i] = output[i];
}

void radixSort(int arr[], int n) {
    int max = arr[0];
    for (int i = 1; i < n; i++) {
        if (arr[i] > max)
            max = arr[i];
    }
    
    for (int exp = 1; max / exp > 0; exp *= 10)
        countingSortForRadix(arr, n, exp);
}

void displayArray(int arr[], int n) {
    for (int i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main() {
    int arr[] = {170, 45, 75, 90, 2, 802, 24, 2, 66};
    int n = 9;
    
    printf("Original Array: ");
    displayArray(arr, n);
    
    radixSort(arr, n);
    
    printf("Sorted Array (Radix Sort): ");
    displayArray(arr, n);
    
    // Test with single digit
    int arr2[] = {5, 2, 8, 3, 9, 1, 4};
    printf("\nSingle digit array: ");
    displayArray(arr2, 7);
    radixSort(arr2, 7);
    printf("After Radix Sort: ");
    displayArray(arr2, 7);
    
    // Test with duplicates
    int arr3[] = {50, 25, 85, 25, 90, 10, 50, 50};
    printf("\nArray with duplicates: ");
    displayArray(arr3, 8);
    radixSort(arr3, 8);
    printf("After Radix Sort: ");
    displayArray(arr3, 8);
    
    // Test with already sorted
    int arr4[] = {10, 20, 30, 40, 50};
    printf("\nAlready sorted: ");
    displayArray(arr4, 5);
    radixSort(arr4, 5);
    printf("After Radix Sort: ");
    displayArray(arr4, 5);
    
    // Test with reverse sorted
    int arr5[] = {500, 400, 300, 200, 100};
    printf("\nReverse sorted: ");
    displayArray(arr5, 5);
    radixSort(arr5, 5);
    printf("After Radix Sort: ");
    displayArray(arr5, 5);
    
    printf("\nComplexity Analysis:\n");
    printf("Time Complexity: O(d * (n + k)) where d is number of digits\n");
    printf("Space Complexity: O(n + k)\n");
    printf("Best Case: O(d * n)\n");
    printf("Worst Case: O(d * (n + k))\n");
    printf("Average Case: O(d * (n + k))\n");
    printf("Stable: Yes\n");
    printf("Note: Works best for positive integers, efficient for large datasets\n");
    
    return 0;
}
