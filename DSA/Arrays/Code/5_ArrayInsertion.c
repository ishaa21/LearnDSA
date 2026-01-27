#include <stdio.h>

// Array Insertion in C
// Insert an element at a specific position in an array

// Function to insert element at specific position
void insertElement(int arr[], int *n, int position, int value) {
    // Shift elements to the right
    for (int i = *n - 1; i >= position; i--) {
        arr[i + 1] = arr[i];
    }
    // Insert new element
    arr[position] = value;
    (*n)++;  // Increase size
}

// Function to display array
void displayArray(int arr[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main() {
    int arr[10] = {10, 20, 30, 40, 50};
    int n = 5;
    
    printf("Original array: ");
    displayArray(arr, n);
    
    // Insert at beginning
    insertElement(arr, &n, 0, 5);
    printf("After inserting 5 at beginning: ");
    displayArray(arr, n);
    
    // Insert at middle
    insertElement(arr, &n, 3, 25);
    printf("After inserting 25 at position 3: ");
    displayArray(arr, n);
    
    // Insert at end
    insertElement(arr, &n, n, 60);
    printf("After inserting 60 at end: ");
    displayArray(arr, n);
    
    return 0;
}
