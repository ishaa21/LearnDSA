#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

#define MAX 100

// Evaluation of Prefix Expression in C
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

int evaluatePrefix(char* prefix) {
    Stack* s = createStack();
    int len = strlen(prefix);
    
    for (int i = len - 1; i >= 0; i--) {
        char c = prefix[i];
        
        if (isdigit(c)) {
            push(s, c - '0');
        } else if (isOperator(c)) {
            int a = pop(s);
            int b = pop(s);
            push(s, evaluate(a, b, c));
        }
    }
    
    return pop(s);
}

int main() {
    char prefix[MAX] = "-*+2345";
    
    printf("=== Evaluation of Prefix Expression ===\n\n");
    printf("Prefix Expression: %s\n", prefix);
    printf("Result: %d\n\n", evaluatePrefix(prefix));
    
    printf("Steps (-*+2345):\n");
    printf("1. Process 5: Push 5\n");
    printf("2. Process 4: Push 4\n");
    printf("3. Process 3: Push 3\n");
    printf("4. Process +: Pop 3,4; Compute 3+4=7; Push 7\n");
    printf("5. Process 2: Push 2\n");
    printf("6. Process *: Pop 2,7; Compute 2*7=14; Push 14\n");
    printf("7. Process -: Pop 14,5; Compute 14-5=9; Push 9\n\n");
    
    printf("Complexity: O(n)\n");
    
    free(s);
    return 0;
}
