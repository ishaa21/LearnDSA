#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX 100

// Infix to Prefix in C
typedef struct {
    char arr[MAX];
    int top;
} Stack;

Stack* createStack() {
    Stack* s = (Stack*)malloc(sizeof(Stack));
    s->top = -1;
    return s;
}

void push(Stack* s, char c) {
    s->arr[++s->top] = c;
}

char pop(Stack* s) {
    return s->arr[s->top--];
}

char peek(Stack* s) {
    return s->arr[s->top];
}

int isEmpty(Stack* s) {
    return s->top == -1;
}

int precedence(char c) {
    if (c == '+' || c == '-') return 1;
    if (c == '*' || c == '/') return 2;
    if (c == '^') return 3;
    return 0;
}

int isOperator(char c) {
    return (c == '+' || c == '-' || c == '*' || c == '/' || c == '^');
}

void reverseString(char* str) {
    int n = strlen(str);
    for (int i = 0; i < n / 2; i++) {
        char temp = str[i];
        str[i] = str[n - 1 - i];
        str[n - 1 - i] = temp;
    }
}

void swapParentheses(char* str) {
    for (int i = 0; str[i]; i++) {
        if (str[i] == '(') str[i] = ')';
        else if (str[i] == ')') str[i] = '(';
    }
}

int main() {
    printf("=== Infix to Prefix ===\n\n");
    printf("Algorithm: Convert Infix to Postfix, then reverse\n");
    printf("Steps:\n");
    printf("1. Reverse the infix expression\n");
    printf("2. Swap ( and )\n");
    printf("3. Convert to postfix\n");
    printf("4. Reverse result\n\n");
    
    printf("Example:\n");
    printf("Infix: a+b*c-d/e\n");
    printf("Prefix: -+a*bc/de\n\n");
    printf("Complexity: O(n)\n");
    
    free(createStack());
    return 0;
}
