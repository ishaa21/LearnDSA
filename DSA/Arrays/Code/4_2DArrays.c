#include <stdio.h>

// 2D Arrays in C
// Two dimensional arrays are matrix-like structures with rows and columns

int main() {
    // Declaration and initialization
    int arr[3][3] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };
    
    // Accessing elements
    printf("Element at [0][0]: %d\n", arr[0][0]);
    printf("Element at [1][2]: %d\n", arr[1][2]);
    printf("Element at [2][1]: %d\n", arr[2][1]);
    
    // Iterating through 2D array and printing
    printf("2D Array:\n");
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            printf("%d ", arr[i][j]);
        }
        printf("\n");
    }
    
    // Modifying element
    arr[1][1] = 10;
    printf("After modification, arr[1][1] = %d\n", arr[1][1]);
    
    // Calculating sum of all elements
    int sum = 0;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            sum += arr[i][j];
        }
    }
    printf("Sum of all elements: %d\n", sum);
    
    return 0;
}
