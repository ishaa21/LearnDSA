#include <iostream>
#include <string>
#include <stack>
using namespace std;

// Evaluation of Infix Expression in C++
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

int evaluateInfix(string infix) {
    stack<int> nums;
    stack<char> ops;
    
    for (char c : infix) {
        if (isdigit(c)) {
            nums.push(c - '0');
        } else if (c == '(') {
            ops.push(c);
        } else if (c == ')') {
            while (!ops.empty() && ops.top() != '(') {
                char op = ops.top(); ops.pop();
                int b = nums.top(); nums.pop();
                int a = nums.top(); nums.pop();
                nums.push(evaluate(a, b, op));
            }
            ops.pop(); // Remove '('
        } else if (c == '+' || c == '-' || c == '*' || c == '/') {
            while (!ops.empty() && ops.top() != '(' && 
                   precedence(ops.top()) >= precedence(c)) {
                char op = ops.top(); ops.pop();
                int b = nums.top(); nums.pop();
                int a = nums.top(); nums.pop();
                nums.push(evaluate(a, b, op));
            }
            ops.push(c);
        }
    }
    
    while (!ops.empty()) {
        char op = ops.top(); ops.pop();
        int b = nums.top(); nums.pop();
        int a = nums.top(); nums.pop();
        nums.push(evaluate(a, b, op));
    }
    
    return nums.top();
}

int main() {
    string infix = "2+3*4-5";
    
    cout << "=== Evaluation of Infix Expression ===\n\n";
    cout << "Infix Expression: " << infix << "\n";
    cout << "Result: " << evaluateInfix(infix) << "\n\n";
    
    cout << "Operator Precedence: * / > + -\n";
    cout << "Complexity: O(n)\n";
    
    return 0;
}
