#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX_SIZE 100

// Push Operation in C
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

void push(Stack* stack, int value) {
    if (isFull(stack)) {
        printf("Stack overflow - cannot push %d\n", value);
        return;
    }
    stack->arr[++stack->top] = value;
    printf("Successfully pushed: %d (top = %d)\n", value, stack->top);
}

void display(Stack* stack) {
    if (stack->top == -1) {
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
    
    printf("=== Push Operation ===\n\n");
    
    display(stack);
    
    for (int i = 1; i <= 5; i++) {
        push(stack, i * 10);
    }
    
    display(stack);
    
    printf("\nTrying to exceed capacity:\n");
    for (int i = 0; i < 96; i++) {
        push(stack, 999);
    }
    push(stack, 100); // This will fail
    
    printf("\nComplexity Analysis:\n");
    printf("Time: O(1)\n");
    printf("Space: O(1)\n");
    
    free(stack);
    return 0;
}
