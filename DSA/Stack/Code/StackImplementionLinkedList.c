#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// Stack Implementation using Linked List in C
typedef struct Node {
    int data;
    struct Node* next;
} Node;

typedef struct {
    Node* top;
} Stack;

Stack* createStack() {
    Stack* stack = (Stack*)malloc(sizeof(Stack));
    stack->top = NULL;
    return stack;
}

Node* createNode(int data) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->data = data;
    node->next = NULL;
    return node;
}

bool isEmpty(Stack* stack) {
    return stack->top == NULL;
}

void push(Stack* stack, int value) {
    Node* newNode = createNode(value);
    newNode->next = stack->top;
    stack->top = newNode;
    printf("Pushed: %d\n", value);
}

int pop(Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack underflow\n");
        return -1;
    }
    Node* temp = stack->top;
    int value = temp->data;
    stack->top = stack->top->next;
    free(temp);
    return value;
}

int peek(Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack is empty\n");
        return -1;
    }
    return stack->top->data;
}

void display(Stack* stack) {
    if (isEmpty(stack)) {
        printf("Stack is empty\n");
        return;
    }
    
    printf("Stack: ");
    Node* temp = stack->top;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

void freeStack(Stack* stack) {
    Node* temp;
    while (stack->top != NULL) {
        temp = stack->top;
        stack->top = stack->top->next;
        free(temp);
    }
    free(stack);
}

int main() {
    Stack* stack = createStack();
    
    printf("=== Stack Implementation (Linked List) ===\n\n");
    
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
    
    freeStack(stack);
    return 0;
}
