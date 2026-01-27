#include <stdio.h>

// Array Traversal in C
// Accessing and processing each element of an array

int main() {
    int arr[] = {10, 20, 30, 40, 50};
    int n = 5;
    
    // Method 1: Forward traversal using for loop
    printf("Forward traversal:\n");
    for (int i = 0; i < n; i++) {
        printf("arr[%d] = %d\n", i, arr[i]);
    }
    
    // Method 2: Backward traversal
    printf("\nBackward traversal:\n");
    for (int i = n - 1; i >= 0; i--) {
        printf("arr[%d] = %d\n", i, arr[i]);
    }
    
    // Method 3: Traversal with pointer
    printf("\nTraversal with pointer:\n");
    int *ptr = arr;
    for (int i = 0; i < n; i++) {
        printf("Value: %d\n", *(ptr + i));
    }
    
    // Method 4: Alternative pointer traversal
    printf("\nAlternative pointer traversal:\n");
    ptr = arr;
    while (ptr < arr + n) {
        printf("Value: %d\n", *ptr);
        ptr++;
    }
    
    // Method 5: Calculate sum during traversal
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += arr[i];
    }
    printf("\nSum of all elements: %d\n", sum);
    
    return 0;
}
