#include <iostream>
#include <string>
#include <stack>
using namespace std;

// Postfix to Infix in C++
bool isOperator(char c) {
    return (c == '+' || c == '-' || c == '*' || c == '/');
}

string postfixToInfix(string postfix) {
    stack<string> s;
    
    for (char c : postfix) {
        if (isOperator(c)) {
            string op2 = s.top(); s.pop();
            string op1 = s.top(); s.pop();
            
            string temp = "(" + op1 + c + op2 + ")";
            s.push(temp);
        } else {
            string temp = "";
            temp += c;
            s.push(temp);
        }
    }
    
    return s.top();
}

int main() {
    string postfix = "ab+cd*-";
    
    cout << "=== Postfix to Infix ===\n\n";
    cout << "Postfix Expression: " << postfix << "\n";
    
    string infix = postfixToInfix(postfix);
    
    cout << "Infix Expression: " << infix << "\n\n";
    cout << "Complexity: O(n)\n";
    
    return 0;
}
