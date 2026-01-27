#include <stdio.h>

// 1D Arrays in C
// Single dimensional arrays are linear arrays with one row

int main() {
    // Declaration and initialization
    int arr[5] = {10, 20, 30, 40, 50};
    
    // Accessing elements
    printf("Element at index 0: %d\n", arr[0]);
    printf("Element at index 2: %d\n", arr[2]);
    
    // Modifying elements
    arr[1] = 25;
    printf("Modified element at index 1: %d\n", arr[1]);
    
    // Iterating and printing all elements
    printf("All elements: ");
    for (int i = 0; i < 5; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
    
    // Finding sum
    int sum = 0;
    for (int i = 0; i < 5; i++) {
        sum += arr[i];
    }
    printf("Sum of all elements: %d\n", sum);
    
    return 0;
}
