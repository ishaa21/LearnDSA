#include <stdio.h>
#include <stdlib.h>

typedef struct MinHeap {
    int* arr;
    int capacity;
    int size;
} MinHeap;

MinHeap* createMinHeap(int capacity) {
    MinHeap* heap = (MinHeap*)malloc(sizeof(MinHeap));
    heap->arr = (int*)malloc(sizeof(int) * capacity);
    heap->capacity = capacity;
    heap->size = 0;
    return heap;
}

int parent(int i) {
    return (i - 1) / 2;
}

int leftChild(int i) {
    return 2 * i + 1;
}

int rightChild(int i) {
    return 2 * i + 2;
}

void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void heapifyUp(MinHeap* heap, int i) {
    while (i > 0 && heap->arr[parent(i)] > heap->arr[i]) {
        swap(&heap->arr[i], &heap->arr[parent(i)]);
        i = parent(i);
    }
}

void heapifyDown(MinHeap* heap, int i) {
    int smallest = i;
    int left = leftChild(i);
    int right = rightChild(i);
    
    if (left < heap->size && heap->arr[left] < heap->arr[smallest]) {
        smallest = left;
    }
    if (right < heap->size && heap->arr[right] < heap->arr[smallest]) {
        smallest = right;
    }
    
    if (smallest != i) {
        swap(&heap->arr[i], &heap->arr[smallest]);
        heapifyDown(heap, smallest);
    }
}

void insert(MinHeap* heap, int key) {
    if (heap->size == heap->capacity) {
        return;
    }
    
    heap->arr[heap->size] = key;
    heap->size++;
    heapifyUp(heap, heap->size - 1);
}

int extractMin(MinHeap* heap) {
    if (heap->size == 0) return -1;
    
    int min = heap->arr[0];
    heap->arr[0] = heap->arr[heap->size - 1];
    heap->size--;
    
    if (heap->size > 0) {
        heapifyDown(heap, 0);
    }
    
    return min;
}

void printHeap(MinHeap* heap) {
    printf("Min Heap (Array): ");
    for (int i = 0; i < heap->size; i++) {
        printf("%d ", heap->arr[i]);
    }
    printf("\n");
}

int main() {
    printf("=== Min Heap (C) ===\n\n");
    
    MinHeap* heap = createMinHeap(10);
    
    printf("Inserting: 10, 5, 3, 2, 8, 1\n");
    insert(heap, 10);
    insert(heap, 5);
    insert(heap, 3);
    insert(heap, 2);
    insert(heap, 8);
    insert(heap, 1);
    
    printHeap(heap);
    
    printf("\nExtracting minimum elements:\n");
    printf("Extract: %d\n", extractMin(heap));
    printHeap(heap);
    printf("Extract: %d\n", extractMin(heap));
    printHeap(heap);
    
    printf("\n=== Min Heap Properties ===\n");
    printf("1. Parent <= Left Child\n");
    printf("2. Parent <= Right Child\n");
    printf("3. Complete binary tree (all levels filled except last)\n");
    printf("4. Minimum element always at root\n\n");
    
    printf("=== Min Heap Complexity ===\n");
    printf("Insert:      O(log n)\n");
    printf("Extract Min: O(log n)\n");
    printf("Get Min:     O(1)\n");
    printf("Space:       O(n)\n");
    
    free(heap->arr);
    free(heap);
    return 0;
}
