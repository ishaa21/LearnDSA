#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX 100

// Postfix to Infix in C
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

void postfixToInfix(char* postfix, char* infix) {
    Stack* s = createStack();
    
    for (int i = 0; postfix[i]; i++) {
        char c = postfix[i];
        
        if (isOperator(c)) {
            char* op2 = pop(s);
            char* op1 = pop(s);
            
            char temp[MAX];
            sprintf(temp, "(%s%c%s)", op1, c, op2);
            push(s, temp);
        } else {
            char temp[2] = {c, '\0'};
            push(s, temp);
        }
    }
    
    strcpy(infix, pop(s));
    free(s);
}

int main() {
    char postfix[MAX] = "ab+cd*-";
    char infix[MAX];
    
    printf("=== Postfix to Infix ===\n\n");
    printf("Postfix Expression: %s\n", postfix);
    
    postfixToInfix(postfix, infix);
    
    printf("Infix Expression: %s\n\n", infix);
    printf("Complexity: O(n)\n");
    
    return 0;
}
