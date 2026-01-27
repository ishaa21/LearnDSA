#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX_SIZE 100

// Stack Implementation using Array in C
typedef struct {
    int arr[MAX_SIZE];
    int top;
} Stack;

Stack* createStack() {
    Stack* stack = (Stack*)malloc(sizeof(Stack));
    stack->top = -1;
    return stack;
}

bool isFull(Stack* stack) {
    return stack->top == MAX_SIZE - 1;
}

bool isEmpty(Stack* stack) {
    return stack->top == -1;
}

void push(Stack* stack, int value) {
    if (isFull(stack)) {
        printf("Stack overflow\n");
        return;
    }
    stack->arr[++stack->top] = value;
    printf("Pushed: %d\n", value);
}

int pop(Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack underflow\n");
        return -1;
    }
    return stack->arr[stack->top--];
}

int peek(Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack is empty\n");
        return -1;
    }
    return stack->arr[stack->top];
}

void display(Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack is empty\n");
        return;
    }
    
    printf("Stack: ");
    for (int i = 0; i <= stack->top; i++) {
        printf("%d ", stack->arr[i]);
    }
    printf("\n");
}

int main() {
    Stack* stack = createStack();
    
    printf("=== Stack Implementation (Array) ===\n\n");
    
    push(stack, 10);
    push(stack, 20);
    push(stack, 30);
    push(stack, 40);
    
    display(stack);
    
    printf("\nPeek: %d\n", peek(stack));
    
    printf("\nPopped: %d\n", pop(stack));
    printf("Popped: %d\n", pop(stack));
    
    display(stack);
    
    printf("\nComplexity Analysis:\n");
    printf("Push: O(1)\n");
    printf("Pop: O(1)\n");
    printf("Peek: O(1)\n");
    printf("Space: O(n)\n");
    
    free(stack);
    return 0;
}
