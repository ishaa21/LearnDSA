#include <iostream>
#include <string>
#include <stack>
#include <cmath>
using namespace std;

// Evaluation of Postfix Expression in C++
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

bool isOperator(char c) {
    return (c == '+' || c == '-' || c == '*' || c == '/' || c == '^');
}

int evaluatePostfix(string postfix) {
    stack<int> s;
    
    for (char c : postfix) {
        if (isdigit(c)) {
            s.push(c - '0');
        } else if (isOperator(c)) {
            int b = s.top(); s.pop();
            int a = s.top(); s.pop();
            s.push(evaluate(a, b, c));
        }
    }
    
    return s.top();
}

int main() {
    string postfix = "23+4*5-";
    
    cout << "=== Evaluation of Postfix Expression ===\n\n";
    cout << "Postfix Expression: " << postfix << "\n";
    cout << "Result: " << evaluatePostfix(postfix) << "\n\n";
    
    cout << "Steps (23+4*5-):\n";
    cout << "1. Push 2\n";
    cout << "2. Push 3\n";
    cout << "3. Pop 3,2; Compute 2+3=5; Push 5\n";
    cout << "4. Push 4\n";
    cout << "5. Pop 4,5; Compute 5*4=20; Push 20\n";
    cout << "6. Push 5\n";
    cout << "7. Pop 5,20; Compute 20-5=15; Push 15\n\n";
    
    cout << "Complexity: O(n)\n";
    
    return 0;
}
