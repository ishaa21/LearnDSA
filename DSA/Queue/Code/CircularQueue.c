#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX_SIZE 100

// Circular Queue in C
typedef struct {
    int arr[MAX_SIZE];
    int front;
    int rear;
    int size;
} CircularQueue;

CircularQueue* createCircularQueue() {
    CircularQueue* q = (CircularQueue*)malloc(sizeof(CircularQueue));
    q->front = -1;
    q->rear = -1;
    q->size = 0;
    return q;
}

bool isEmpty(CircularQueue* q) {
    return q->size == 0;
}

bool isFull(CircularQueue* q) {
    return q->size == MAX_SIZE;
}

void enqueue(CircularQueue* q, int value) {
    if (isFull(q)) {
        printf("Circular Queue overflow - cannot enqueue %d\n", value);
        return;
    }
    if (isEmpty(q)) {
        q->front = 0;
    }
    q->rear = (q->rear + 1) % MAX_SIZE;
    q->arr[q->rear] = value;
    q->size++;
    printf("Successfully enqueued: %d (rear = %d, size = %d)\n", value, q->rear, q->size);
}

int dequeue(CircularQueue* q) {
    if (isEmpty(q)) {
        printf("Circular Queue underflow - cannot dequeue\n");
        return -1;
    }
    int value = q->arr[q->front];
    printf("Successfully dequeued: %d (front = %d, size = %d)\n", value, q->front, q->size - 1);
    
    if (q->size == 1) {
        q->front = -1;
        q->rear = -1;
    } else {
        q->front = (q->front + 1) % MAX_SIZE;
    }
    q->size--;
    return value;
}

int peek(CircularQueue* q) {
    if (isEmpty(q)) {
        printf("Circular Queue is empty - cannot peek\n");
        return -1;
    }
    printf("Peeked: %d (at front)\n", q->arr[q->front]);
    return q->arr[q->front];
}

void display(CircularQueue* q) {
    if (isEmpty(q)) {
        printf("Circular Queue is empty\n");
        return;
    }
    printf("Circular Queue: ");
    int i = q->front;
    for (int count = 0; count < q->size; count++) {
        printf("%d ", q->arr[i]);
        i = (i + 1) % MAX_SIZE;
    }
    printf("\n");
}

int main() {
    CircularQueue* q = createCircularQueue();
    
    printf("=== Circular Queue ===\n\n");
    
    display(q);
    
    printf("\nEnqueuing elements:\n");
    for (int i = 1; i <= 5; i++) {
        enqueue(q, i * 10);
    }
    
    display(q);
    
    printf("\nDequeuing 2 elements:\n");
    dequeue(q);
    dequeue(q);
    
    display(q);
    
    printf("\nEnqueuing 2 more elements (circular reuse):\n");
    enqueue(q, 100);
    enqueue(q, 200);
    
    display(q);
    
    printf("\nComplexity Analysis:\n");
    printf("Enqueue: O(1)\n");
    printf("Dequeue: O(1)\n");
    printf("Peek: O(1)\n");
    printf("Space: O(n)\n");
    printf("Advantage: Efficient space reuse in circular manner\n");
    
    free(q);
    return 0;
}
