#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX 100

// Postfix to Prefix in C
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

void postfixToPrefix(char* postfix, char* prefix) {
    Stack* s = createStack();
    
    for (int i = 0; postfix[i]; i++) {
        char c = postfix[i];
        
        if (isOperator(c)) {
            char* op2 = pop(s);
            char* op1 = pop(s);
            
            char temp[MAX];
            sprintf(temp, "%c%s%s", c, op1, op2);
            push(s, temp);
        } else {
            char temp[2] = {c, '\0'};
            push(s, temp);
        }
    }
    
    strcpy(prefix, pop(s));
    free(s);
}

int main() {
    char postfix[MAX] = "ab+cd*-";
    char prefix[MAX];
    
    printf("=== Postfix to Prefix ===\n\n");
    printf("Postfix Expression: %s\n", postfix);
    
    postfixToPrefix(postfix, prefix);
    
    printf("Prefix Expression: %s\n\n", prefix);
    printf("Complexity: O(n)\n");
    
    return 0;
}
