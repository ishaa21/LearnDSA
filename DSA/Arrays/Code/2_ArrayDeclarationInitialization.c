#include <stdio.h>

// Array Declaration & Initialization in C
// Different ways to declare and initialize arrays

int main() {
    // Method 1: Declaration with initialization
    int arr1[5] = {1, 2, 3, 4, 5};
    
    // Method 2: Declaration without size (size inferred from initialization)
    int arr2[] = {10, 20, 30, 40};
    
    // Method 3: Declaration with size, partial initialization
    int arr3[5] = {100, 200};  // Remaining elements are 0
    
    // Method 4: Declaration without initialization
    int arr4[5];  // Contains garbage values
    
    // Method 5: Declaration and later initialization
    int arr5[3];
    arr5[0] = 5;
    arr5[1] = 10;
    arr5[2] = 15;
    
    printf("arr1: ");
    for (int i = 0; i < 5; i++) printf("%d ", arr1[i]);
    printf("\n");
    
    printf("arr2: ");
    for (int i = 0; i < 4; i++) printf("%d ", arr2[i]);
    printf("\n");
    
    printf("arr3 (partial init): ");
    for (int i = 0; i < 5; i++) printf("%d ", arr3[i]);
    printf("\n");
    
    printf("arr5 (manual init): ");
    for (int i = 0; i < 3; i++) printf("%d ", arr5[i]);
    printf("\n");
    
    return 0;
}
