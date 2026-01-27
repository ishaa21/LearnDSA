#include <stdio.h>
#include <stdlib.h>

void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int leftChild(int i) {
    return 2 * i + 1;
}

int rightChild(int i) {
    return 2 * i + 2;
}

void minHeapify(int* arr, int n, int i) {
    int smallest = i;
    int left = leftChild(i);
    int right = rightChild(i);
    
    if (left < n && arr[left] < arr[smallest]) {
        smallest = left;
    }
    if (right < n && arr[right] < arr[smallest]) {
        smallest = right;
    }
    
    if (smallest != i) {
        swap(&arr[i], &arr[smallest]);
        minHeapify(arr, n, smallest);
    }
}

void maxHeapify(int* arr, int n, int i) {
    int largest = i;
    int left = leftChild(i);
    int right = rightChild(i);
    
    if (left < n && arr[left] > arr[largest]) {
        largest = left;
    }
    if (right < n && arr[right] > arr[largest]) {
        largest = right;
    }
    
    if (largest != i) {
        swap(&arr[i], &arr[largest]);
        maxHeapify(arr, n, largest);
    }
}

void buildMinHeap(int* arr, int n) {
    for (int i = n / 2 - 1; i >= 0; i--) {
        minHeapify(arr, n, i);
    }
}

void buildMaxHeap(int* arr, int n) {
    for (int i = n / 2 - 1; i >= 0; i--) {
        maxHeapify(arr, n, i);
    }
}

void printArray(int* arr, int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main() {
    printf("=== Heapify (C) ===\n\n");
    
    int arr1[] = {4, 10, 3, 5, 1, 2, 8};
    int n = 7;
    
    printf("Original Array: ");
    printArray(arr1, n);
    
    printf("\nBuilding Min Heap:\n");
    buildMinHeap(arr1, n);
    printf("Min Heap: ");
    printArray(arr1, n);
    
    int arr2[] = {4, 10, 3, 5, 1, 2, 8};
    printf("\nBuilding Max Heap:\n");
    buildMaxHeap(arr2, n);
    printf("Max Heap: ");
    printArray(arr2, n);
    
    printf("\n=== Heapify Algorithm ===\n");
    printf("1. Start from last non-leaf node (index n/2 - 1)\n");
    printf("2. Call heapify for each node from bottom to top\n");
    printf("3. Heapify moves element down to correct position\n");
    printf("4. Recursively heapify affected subtrees\n\n");
    
    printf("=== Heapify Complexity ===\n");
    printf("Time Complexity:  O(n)\n");
    printf("Space Complexity: O(log n) for recursion\n");
    printf("Applications: Heap Sort, Priority Queue construction\n");
    
    return 0;
}
