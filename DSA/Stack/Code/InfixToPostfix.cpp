#include <iostream>
#include <string>
#include <cctype>
#include <stack>
using namespace std;

// Infix to Postfix in C++
int precedence(char c) {
    if (c == '+' || c == '-') return 1;
    if (c == '*' || c == '/') return 2;
    if (c == '^') return 3;
    return 0;
}

bool isOperator(char c) {
    return (c == '+' || c == '-' || c == '*' || c == '/' || c == '^');
}

string infixToPostfix(string infix) {
    stack<char> s;
    string postfix = "";
    
    for (char c : infix) {
        if (isalnum(c)) {
            postfix += c;
        } else if (c == '(') {
            s.push(c);
        } else if (c == ')') {
            while (!s.empty() && s.top() != '(') {
                postfix += s.top();
                s.pop();
            }
            s.pop(); // Remove '('
        } else if (isOperator(c)) {
            while (!s.empty() && precedence(s.top()) >= precedence(c)) {
                postfix += s.top();
                s.pop();
            }
            s.push(c);
        }
    }
    
    while (!s.empty()) {
        postfix += s.top();
        s.pop();
    }
    
    return postfix;
}

int main() {
    string infix = "a+b*c-d/e";
    
    cout << "=== Infix to Postfix ===\n\n";
    cout << "Infix Expression: " << infix << "\n";
    
    string postfix = infixToPostfix(infix);
    
    cout << "Postfix Expression: " << postfix << "\n\n";
    
    cout << "Algorithm: Shunting-yard\n";
    cout << "Complexity: O(n)\n";
    
    return 0;
}
