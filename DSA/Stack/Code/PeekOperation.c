#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX_SIZE 100

// Peek Operation in C
typedef struct {
    int arr[MAX_SIZE];
    int top;
} Stack;

Stack* createStack() {
    Stack* stack = (Stack*)malloc(sizeof(Stack));
    stack->top = -1;
    return stack;
}

bool isEmpty(Stack* stack) {
    return stack->top == -1;
}

void push(Stack* stack, int value) {
    stack->arr[++stack->top] = value;
}

int peek(Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack is empty - cannot peek\n");
        return -1;
    }
    printf("Peeked: %d (at position %d)\n", stack->arr[stack->top], stack->top);
    return stack->arr[stack->top];
}

void display(Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack is empty\n");
        return;
    }
    printf("Current stack: ");
    for (int i = 0; i <= stack->top; i++) {
        printf("%d ", stack->arr[i]);
    }
    printf("\n");
}

int main() {
    Stack* stack = createStack();
    
    printf("=== Peek Operation ===\n\n");
    
    peek(stack); // Try to peek empty stack
    
    printf("\nPushing elements:\n");
    for (int i = 1; i <= 5; i++) {
        push(stack, i * 10);
    }
    
    display(stack);
    
    printf("\nPeeking without removing:\n");
    for (int i = 0; i < 3; i++) {
        peek(stack);
    }
    
    display(stack);
    
    printf("\nComplexity Analysis:\n");
    printf("Time: O(1)\n");
    printf("Space: O(1)\n");
    
    free(stack);
    return 0;
}
