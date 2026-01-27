#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX_SIZE 100

// Deque (Double Ended Queue) in C
typedef struct {
    int arr[MAX_SIZE];
    int front;
    int rear;
    int size;
} Deque;

Deque* createDeque() {
    Deque* d = (Deque*)malloc(sizeof(Deque));
    d->front = -1;
    d->rear = -1;
    d->size = 0;
    return d;
}

bool isEmpty(Deque* d) {
    return d->size == 0;
}

bool isFull(Deque* d) {
    return d->size == MAX_SIZE;
}

void insertFront(Deque* d, int value) {
    if (isFull(d)) {
        printf("Deque overflow - cannot insert at front\n");
        return;
    }
    if (isEmpty(d)) {
        d->front = 0;
        d->rear = 0;
    } else {
        d->front = (d->front - 1 + MAX_SIZE) % MAX_SIZE;
    }
    d->arr[d->front] = value;
    d->size++;
    printf("Successfully inserted at front: %d (size = %d)\n", value, d->size);
}

void insertRear(Deque* d, int value) {
    if (isFull(d)) {
        printf("Deque overflow - cannot insert at rear\n");
        return;
    }
    if (isEmpty(d)) {
        d->front = 0;
        d->rear = 0;
    } else {
        d->rear = (d->rear + 1) % MAX_SIZE;
    }
    d->arr[d->rear] = value;
    d->size++;
    printf("Successfully inserted at rear: %d (size = %d)\n", value, d->size);
}

int deleteFront(Deque* d) {
    if (isEmpty(d)) {
        printf("Deque underflow - cannot delete from front\n");
        return -1;
    }
    int value = d->arr[d->front];
    printf("Successfully deleted from front: %d (size = %d)\n", value, d->size - 1);
    
    if (d->size == 1) {
        d->front = -1;
        d->rear = -1;
    } else {
        d->front = (d->front + 1) % MAX_SIZE;
    }
    d->size--;
    return value;
}

int deleteRear(Deque* d) {
    if (isEmpty(d)) {
        printf("Deque underflow - cannot delete from rear\n");
        return -1;
    }
    int value = d->arr[d->rear];
    printf("Successfully deleted from rear: %d (size = %d)\n", value, d->size - 1);
    
    if (d->size == 1) {
        d->front = -1;
        d->rear = -1;
    } else {
        d->rear = (d->rear - 1 + MAX_SIZE) % MAX_SIZE;
    }
    d->size--;
    return value;
}

void display(Deque* d) {
    if (isEmpty(d)) {
        printf("Deque is empty\n");
        return;
    }
    printf("Deque: ");
    int i = d->front;
    for (int count = 0; count < d->size; count++) {
        printf("%d ", d->arr[i]);
        i = (i + 1) % MAX_SIZE;
    }
    printf("\n");
}

int main() {
    Deque* d = createDeque();
    
    printf("=== Deque (Double Ended Queue) ===\n\n");
    
    display(d);
    
    printf("\nInserting at rear:\n");
    for (int i = 1; i <= 3; i++) {
        insertRear(d, i * 10);
    }
    
    display(d);
    
    printf("\nInserting at front:\n");
    insertFront(d, 5);
    insertFront(d, 2);
    
    display(d);
    
    printf("\nDeleting from front:\n");
    deleteFront(d);
    
    printf("\nDeleting from rear:\n");
    deleteRear(d);
    
    display(d);
    
    printf("\nComplexity Analysis:\n");
    printf("Insert Front: O(1)\n");
    printf("Insert Rear: O(1)\n");
    printf("Delete Front: O(1)\n");
    printf("Delete Rear: O(1)\n");
    printf("Space: O(n)\n");
    printf("Advantage: Flexible insertion/deletion from both ends\n");
    
    free(d);
    return 0;
}
