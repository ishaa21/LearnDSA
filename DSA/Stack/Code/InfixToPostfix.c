#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX 100

// Infix to Postfix in C
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

void infixToPostfix(char* infix, char* postfix) {
    Stack* s = createStack();
    int j = 0;
    
    for (int i = 0; infix[i]; i++) {
        char c = infix[i];
        
        if (isalnum(c)) {
            postfix[j++] = c;
        } else if (c == '(') {
            push(s, c);
        } else if (c == ')') {
            while (!isEmpty(s) && peek(s) != '(') {
                postfix[j++] = pop(s);
            }
            pop(s); // Remove '('
        } else if (isOperator(c)) {
            while (!isEmpty(s) && precedence(peek(s)) >= precedence(c)) {
                postfix[j++] = pop(s);
            }
            push(s, c);
        }
    }
    
    while (!isEmpty(s)) {
        postfix[j++] = pop(s);
    }
    postfix[j] = '\0';
    
    free(s);
}

int main() {
    char infix[MAX] = "a+b*c-d/e";
    char postfix[MAX];
    
    printf("=== Infix to Postfix ===\n\n");
    printf("Infix Expression: %s\n", infix);
    
    infixToPostfix(infix, postfix);
    
    printf("Postfix Expression: %s\n\n", postfix);
    
    printf("Algorithm: Shunting-yard\n");
    printf("Complexity: O(n)\n");
    
    return 0;
}
