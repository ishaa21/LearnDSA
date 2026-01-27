#include <stdio.h>

// Array Update in C
// Modify/Update elements at specific positions

void updateElement(int arr[], int position, int newValue) {
    arr[position] = newValue;
}

void displayArray(int arr[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main() {
    int arr[] = {10, 20, 30, 40, 50};
    int n = 5;
    
    printf("Original array: ");
    displayArray(arr, n);
    
    // Method 1: Direct update
    arr[0] = 15;
    printf("After updating index 0 to 15: ");
    displayArray(arr, n);
    
    // Method 2: Using function
    updateElement(arr, 2, 35);
    printf("After updating index 2 to 35: ");
    displayArray(arr, n);
    
    // Method 3: Conditional update
    for (int i = 0; i < n; i++) {
        if (arr[i] > 20) {
            arr[i] *= 2;
        }
    }
    printf("After doubling elements > 20: ");
    displayArray(arr, n);
    
    // Method 4: Update all elements by adding a value
    int addValue = 5;
    for (int i = 0; i < n; i++) {
        arr[i] += addValue;
    }
    printf("After adding 5 to all elements: ");
    displayArray(arr, n);
    
    return 0;
}
