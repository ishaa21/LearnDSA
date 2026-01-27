#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX_SIZE 100

// Pop Operation in C
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

int pop(Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack underflow - cannot pop\n");
        return -1;
    }
    int value = stack->arr[stack->top];
    printf("Successfully popped: %d (top = %d)\n", value, stack->top - 1);
    stack->top--;
    return value;
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
    
    printf("=== Pop Operation ===\n\n");
    
    for (int i = 1; i <= 5; i++) {
        push(stack, i * 10);
    }
    
    display(stack);
    
    printf("\nPopping elements:\n");
    pop(stack);
    pop(stack);
    
    display(stack);
    
    printf("\nPopping all remaining:\n");
    while (!isEmpty(stack)) {
        pop(stack);
    }
    
    display(stack);
    pop(stack); // Try to pop from empty stack
    
    printf("\nComplexity Analysis:\n");
    printf("Time: O(1)\n");
    printf("Space: O(1)\n");
    
    free(stack);
    return 0;
}
