#include <stdio.h>
#include <stdlib.h>

typedef struct MaxHeap {
    int* arr;
    int capacity;
    int size;
} MaxHeap;

MaxHeap* createMaxHeap(int capacity) {
    MaxHeap* heap = (MaxHeap*)malloc(sizeof(MaxHeap));
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

void heapifyUp(MaxHeap* heap, int i) {
    while (i > 0 && heap->arr[parent(i)] < heap->arr[i]) {
        swap(&heap->arr[i], &heap->arr[parent(i)]);
        i = parent(i);
    }
}

void heapifyDown(MaxHeap* heap, int i) {
    int largest = i;
    int left = leftChild(i);
    int right = rightChild(i);
    
    if (left < heap->size && heap->arr[left] > heap->arr[largest]) {
        largest = left;
    }
    if (right < heap->size && heap->arr[right] > heap->arr[largest]) {
        largest = right;
    }
    
    if (largest != i) {
        swap(&heap->arr[i], &heap->arr[largest]);
        heapifyDown(heap, largest);
    }
}

void insert(MaxHeap* heap, int key) {
    if (heap->size == heap->capacity) {
        return;
    }
    
    heap->arr[heap->size] = key;
    heap->size++;
    heapifyUp(heap, heap->size - 1);
}

int extractMax(MaxHeap* heap) {
    if (heap->size == 0) return -1;
    
    int max = heap->arr[0];
    heap->arr[0] = heap->arr[heap->size - 1];
    heap->size--;
    
    if (heap->size > 0) {
        heapifyDown(heap, 0);
    }
    
    return max;
}

void printHeap(MaxHeap* heap) {
    printf("Max Heap (Array): ");
    for (int i = 0; i < heap->size; i++) {
        printf("%d ", heap->arr[i]);
    }
    printf("\n");
}

int main() {
    printf("=== Max Heap (C) ===\n\n");
    
    MaxHeap* heap = createMaxHeap(10);
    
    printf("Inserting: 5, 10, 3, 2, 8, 1\n");
    insert(heap, 5);
    insert(heap, 10);
    insert(heap, 3);
    insert(heap, 2);
    insert(heap, 8);
    insert(heap, 1);
    
    printHeap(heap);
    
    printf("\nExtracting maximum elements:\n");
    printf("Extract: %d\n", extractMax(heap));
    printHeap(heap);
    printf("Extract: %d\n", extractMax(heap));
    printHeap(heap);
    
    printf("\n=== Max Heap Properties ===\n");
    printf("1. Parent >= Left Child\n");
    printf("2. Parent >= Right Child\n");
    printf("3. Complete binary tree (all levels filled except last)\n");
    printf("4. Maximum element always at root\n\n");
    
    printf("=== Max Heap Complexity ===\n");
    printf("Insert:      O(log n)\n");
    printf("Extract Max: O(log n)\n");
    printf("Get Max:     O(1)\n");
    printf("Space:       O(n)\n");
    
    free(heap->arr);
    free(heap);
    return 0;
}
