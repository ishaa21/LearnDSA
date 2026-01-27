#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX_SIZE 100

// Simple Queue in C
typedef struct {
    int arr[MAX_SIZE];
    int front;
    int rear;
} Queue;

Queue* createQueue() {
    Queue* q = (Queue*)malloc(sizeof(Queue));
    q->front = -1;
    q->rear = -1;
    return q;
}

bool isEmpty(Queue* q) {
    return q->front == -1;
}

bool isFull(Queue* q) {
    return q->rear == MAX_SIZE - 1;
}

void enqueue(Queue* q, int value) {
    if (isFull(q)) {
        printf("Queue overflow - cannot enqueue %d\n", value);
        return;
    }
    if (isEmpty(q)) {
        q->front = 0;
    }
    q->arr[++q->rear] = value;
    printf("Successfully enqueued: %d (rear = %d)\n", value, q->rear);
}

int dequeue(Queue* q) {
    if (isEmpty(q)) {
        printf("Queue underflow - cannot dequeue\n");
        return -1;
    }
    int value = q->arr[q->front];
    printf("Successfully dequeued: %d (front = %d)\n", value, q->front);
    
    if (q->front == q->rear) {
        q->front = -1;
        q->rear = -1;
    } else {
        q->front++;
    }
    return value;
}

int peek(Queue* q) {
    if (isEmpty(q)) {
        printf("Queue is empty - cannot peek\n");
        return -1;
    }
    printf("Peeked: %d (at front)\n", q->arr[q->front]);
    return q->arr[q->front];
}

void display(Queue* q) {
    if (isEmpty(q)) {
        printf("Queue is empty\n");
        return;
    }
    printf("Queue: ");
    for (int i = q->front; i <= q->rear; i++) {
        printf("%d ", q->arr[i]);
    }
    printf("\n");
}

int main() {
    Queue* q = createQueue();
    
    printf("=== Simple Queue ===\n\n");
    
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
    
    printf("\nComplexity Analysis:\n");
    printf("Enqueue: O(1)\n");
    printf("Dequeue: O(1)\n");
    printf("Peek: O(1)\n");
    printf("Space: O(n)\n");
    
    free(q);
    return 0;
}
