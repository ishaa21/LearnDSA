#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX_SIZE 100

// Priority Queue in C (Max Heap)
typedef struct {
    int data;
    int priority;
} Element;

typedef struct {
    Element arr[MAX_SIZE];
    int size;
} PriorityQueue;

PriorityQueue* createPriorityQueue() {
    PriorityQueue* pq = (PriorityQueue*)malloc(sizeof(PriorityQueue));
    pq->size = 0;
    return pq;
}

bool isEmpty(PriorityQueue* pq) {
    return pq->size == 0;
}

bool isFull(PriorityQueue* pq) {
    return pq->size == MAX_SIZE;
}

void enqueue(PriorityQueue* pq, int data, int priority) {
    if (isFull(pq)) {
        printf("Priority Queue overflow\n");
        return;
    }
    
    int i = pq->size - 1;
    while (i >= 0 && pq->arr[i].priority < priority) {
        pq->arr[i + 1] = pq->arr[i];
        i--;
    }
    
    pq->arr[i + 1].data = data;
    pq->arr[i + 1].priority = priority;
    pq->size++;
    printf("Enqueued: data=%d, priority=%d (size=%d)\n", data, priority, pq->size);
}

int dequeue(PriorityQueue* pq) {
    if (isEmpty(pq)) {
        printf("Priority Queue underflow\n");
        return -1;
    }
    int data = pq->arr[0].data;
    printf("Dequeued: data=%d, priority=%d (size=%d)\n", data, pq->arr[0].priority, pq->size - 1);
    
    for (int i = 0; i < pq->size - 1; i++) {
        pq->arr[i] = pq->arr[i + 1];
    }
    pq->size--;
    return data;
}

void display(PriorityQueue* pq) {
    if (isEmpty(pq)) {
        printf("Priority Queue is empty\n");
        return;
    }
    printf("Priority Queue (data -> priority):\n");
    for (int i = 0; i < pq->size; i++) {
        printf("  %d -> %d\n", pq->arr[i].data, pq->arr[i].priority);
    }
}

int main() {
    PriorityQueue* pq = createPriorityQueue();
    
    printf("=== Priority Queue ===\n\n");
    
    display(pq);
    
    printf("\nEnqueuing elements:\n");
    enqueue(pq, 10, 2);
    enqueue(pq, 20, 5);
    enqueue(pq, 30, 1);
    enqueue(pq, 40, 3);
    
    display(pq);
    
    printf("\nDequeuing (highest priority first):\n");
    dequeue(pq);
    dequeue(pq);
    
    display(pq);
    
    printf("\nComplexity Analysis:\n");
    printf("Enqueue: O(n) - insertion in sorted order\n");
    printf("Dequeue: O(n) - removal with shifting\n");
    printf("Peek: O(1)\n");
    printf("Space: O(n)\n");
    printf("Note: Using linked list or heap improves Enqueue to O(log n)\n");
    
    free(pq);
    return 0;
}
