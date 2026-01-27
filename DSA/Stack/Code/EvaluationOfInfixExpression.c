#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX 100

// Evaluation of Infix Expression in C
typedef struct {
    int arr[MAX];
    int top;
} IntStack;

typedef struct {
    char arr[MAX];
    int top;
} CharStack;

IntStack* createIntStack() {
    IntStack* s = (IntStack*)malloc(sizeof(IntStack));
    s->top = -1;
    return s;
}

CharStack* createCharStack() {
    CharStack* s = (CharStack*)malloc(sizeof(CharStack));
    s->top = -1;
    return s;
}

void pushInt(IntStack* s, int val) {
    s->arr[++s->top] = val;
}

int popInt(IntStack* s) {
    return s->arr[s->top--];
}

void pushChar(CharStack* s, char c) {
    s->arr[++s->top] = c;
}

char popChar(CharStack* s) {
    return s->arr[s->top--];
}

char peekChar(CharStack* s) {
    return s->arr[s->top];
}

int isEmptyChar(CharStack* s) {
    return s->top == -1;
}

int precedence(char c) {
    if (c == '+' || c == '-') return 1;
    if (c == '*' || c == '/') return 2;
    if (c == '^') return 3;
    return 0;
}

int evaluate(int a, int b, char op) {
    switch(op) {
        case '+': return a + b;
        case '-': return a - b;
        case '*': return a * b;
        case '/': return a / b;
    }
    return 0;
}

int evaluateInfix(char* infix) {
    IntStack* nums = createIntStack();
    CharStack* ops = createCharStack();
    
    for (int i = 0; infix[i]; i++) {
        char c = infix[i];
        
        if (isdigit(c)) {
            pushInt(nums, c - '0');
        } else if (c == '(') {
            pushChar(ops, c);
        } else if (c == ')') {
            while (!isEmptyChar(ops) && peekChar(ops) != '(') {
                char op = popChar(ops);
                int b = popInt(nums);
                int a = popInt(nums);
                pushInt(nums, evaluate(a, b, op));
            }
            popChar(ops); // Remove '('
        } else if (c == '+' || c == '-' || c == '*' || c == '/') {
            while (!isEmptyChar(ops) && peekChar(ops) != '(' && 
                   precedence(peekChar(ops)) >= precedence(c)) {
                char op = popChar(ops);
                int b = popInt(nums);
                int a = popInt(nums);
                pushInt(nums, evaluate(a, b, op));
            }
            pushChar(ops, c);
        }
    }
    
    while (!isEmptyChar(ops)) {
        char op = popChar(ops);
        int b = popInt(nums);
        int a = popInt(nums);
        pushInt(nums, evaluate(a, b, op));
    }
    
    return popInt(nums);
}

int main() {
    char infix[MAX] = "2+3*4-5";
    
    printf("=== Evaluation of Infix Expression ===\n\n");
    printf("Infix Expression: %s\n", infix);
    printf("Result: %d\n\n", evaluateInfix(infix));
    
    printf("Operator Precedence: * / > + -\n");
    printf("Complexity: O(n)\n");
    
    return 0;
}
