#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define MAX 100

// Valid Parentheses in C
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

int isEmpty(Stack* s) {
    return s->top == -1;
}

bool isValidParentheses(char* str) {
    Stack* s = createStack();
    
    for (int i = 0; str[i]; i++) {
        char c = str[i];
        
        if (c == '(' || c == '{' || c == '[') {
            push(s, c);
        } else if (c == ')' || c == '}' || c == ']') {
            if (isEmpty(s)) {
                free(s);
                return false;
            }
            char top = pop(s);
            if ((c == ')' && top != '(') ||
                (c == '}' && top != '{') ||
                (c == ']' && top != '[')) {
                free(s);
                return false;
            }
        }
    }
    
    bool result = isEmpty(s);
    free(s);
    return result;
}

int main() {
    printf("=== Valid Parentheses ===\n\n");
    
    char tests[][50] = {
        "()",
        "(){}[]",
        "([{}])",
        "([)]",
        "{[}",
        "(((",
        ")"
    };
    
    int n = sizeof(tests) / sizeof(tests[0]);
    
    for (int i = 0; i < n; i++) {
        printf("Expression: %s -> %s\n", tests[i], 
               isValidParentheses(tests[i]) ? "Valid" : "Invalid");
    }
    
    printf("\nComplexity: O(n)\n");
    printf("Space: O(n)\n");
    
    return 0;
}
