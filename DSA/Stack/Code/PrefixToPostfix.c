#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX 100

// Prefix to Postfix in C
typedef struct {
    char arr[MAX];
    int top;
} Stack;

Stack* createStack() {
    Stack* s = (Stack*)malloc(sizeof(Stack));
    s->top = -1;
    return s;
}

void push(Stack* s, char* c) {
    strcpy(s->arr[++s->top], c);
}

char* pop(Stack* s) {
    return s->arr[s->top--];
}

int isEmpty(Stack* s) {
    return s->top == -1;
}

int isOperator(char c) {
    return (c == '+' || c == '-' || c == '*' || c == '/');
}

void prefixToPostfix(char* prefix, char* postfix) {
    Stack* s = createStack();
    int len = strlen(prefix);
    
    for (int i = len - 1; i >= 0; i--) {
        char c = prefix[i];
        
        if (isOperator(c)) {
            char* op1 = pop(s);
            char* op2 = pop(s);
            
            char temp[MAX];
            sprintf(temp, "%s%s%c", op1, op2, c);
            push(s, temp);
        } else {
            char temp[2] = {c, '\0'};
            push(s, temp);
        }
    }
    
    strcpy(postfix, pop(s));
    free(s);
}

int main() {
    char prefix[MAX] = "-+ab*cd";
    char postfix[MAX];
    
    printf("=== Prefix to Postfix ===\n\n");
    printf("Prefix Expression: %s\n", prefix);
    
    prefixToPostfix(prefix, postfix);
    
    printf("Postfix Expression: %s\n\n", postfix);
    printf("Complexity: O(n)\n");
    
    return 0;
}
