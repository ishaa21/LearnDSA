#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

#define MAX 100

// Evaluation of Postfix Expression in C
typedef struct {
    int arr[MAX];
    int top;
} Stack;

Stack* createStack() {
    Stack* s = (Stack*)malloc(sizeof(Stack));
    s->top = -1;
    return s;
}

void push(Stack* s, int val) {
    s->arr[++s->top] = val;
}

int pop(Stack* s) {
    return s->arr[s->top--];
}

int isEmpty(Stack* s) {
    return s->top == -1;
}

int evaluate(int a, int b, char op) {
    switch(op) {
        case '+': return a + b;
        case '-': return a - b;
        case '*': return a * b;
        case '/': return a / b;
        case '^': return (int)pow(a, b);
    }
    return 0;
}

int isOperator(char c) {
    return (c == '+' || c == '-' || c == '*' || c == '/' || c == '^');
}

int evaluatePostfix(char* postfix) {
    Stack* s = createStack();
    
    for (int i = 0; postfix[i]; i++) {
        char c = postfix[i];
        
        if (isdigit(c)) {
            push(s, c - '0');
        } else if (isOperator(c)) {
            int b = pop(s);
            int a = pop(s);
            push(s, evaluate(a, b, c));
        }
    }
    
    return pop(s);
}

int main() {
    char postfix[MAX] = "23+4*5-";
    
    printf("=== Evaluation of Postfix Expression ===\n\n");
    printf("Postfix Expression: %s\n", postfix);
    printf("Result: %d\n\n", evaluatePostfix(postfix));
    
    printf("Steps (23+4*5-):\n");
    printf("1. Push 2\n");
    printf("2. Push 3\n");
    printf("3. Pop 3,2; Compute 2+3=5; Push 5\n");
    printf("4. Push 4\n");
    printf("5. Pop 4,5; Compute 5*4=20; Push 20\n");
    printf("6. Push 5\n");
    printf("7. Pop 5,20; Compute 20-5=15; Push 15\n\n");
    
    printf("Complexity: O(n)\n");
    
    free(s);
    return 0;
}
