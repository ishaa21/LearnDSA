#include <iostream>
#include <string>
#include <algorithm>
#include <stack>
using namespace std;

// Infix to Prefix in C++
int precedence(char c) {
    if (c == '+' || c == '-') return 1;
    if (c == '*' || c == '/') return 2;
    if (c == '^') return 3;
    return 0;
}

bool isOperator(char c) {
    return (c == '+' || c == '-' || c == '*' || c == '/' || c == '^');
}

string infixToPrefix(string infix) {
    // Reverse the string
    reverse(infix.begin(), infix.end());
    
    // Swap ( and )
    for (char& c : infix) {
        if (c == '(') c = ')';
        else if (c == ')') c = '(';
    }
    
    // Convert to postfix
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
            s.pop();
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
    
    // Reverse result
    reverse(postfix.begin(), postfix.end());
    return postfix;
}

int main() {
    cout << "=== Infix to Prefix ===\n\n";
    cout << "Algorithm: Reverse -> Convert to Postfix -> Reverse\n";
    cout << "Steps:\n";
    cout << "1. Reverse the infix expression\n";
    cout << "2. Swap ( and )\n";
    cout << "3. Convert to postfix\n";
    cout << "4. Reverse result\n\n";
    
    string infix = "a+b*c-d/e";
    cout << "Infix: " << infix << "\n";
    cout << "Prefix: " << infixToPrefix(infix) << "\n\n";
    cout << "Complexity: O(n)\n";
    
    return 0;
}
