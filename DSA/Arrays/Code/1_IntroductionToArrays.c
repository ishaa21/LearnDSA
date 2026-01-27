#include <stdio.h>

// Introduction to Arrays in C
// Arrays are collections of elements of the same data type stored in contiguous memory locations

int main() {
    // Array declaration and initialization
    int arr[5] = {10, 20, 30, 40, 50};
    
    // Accessing array elements
    printf("First element: %d\n", arr[0]);
    printf("Last element: %d\n", arr[4]);
    
    // Iterating through array
    printf("All elements: ");
    for (int i = 0; i < 5; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
    
    // Array size
    int size = sizeof(arr) / sizeof(arr[0]);
    printf("Array size: %d\n", size);
    
    return 0;
}
