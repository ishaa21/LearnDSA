#include <iostream>
#include <string>
#include <stack>
using namespace std;

// Prefix to Postfix in C++
bool isOperator(char c) {
    return (c == '+' || c == '-' || c == '*' || c == '/');
}

string prefixToPostfix(string prefix) {
    stack<string> s;
    int len = prefix.length();
    
    for (int i = len - 1; i >= 0; i--) {
        char c = prefix[i];
        
        if (isOperator(c)) {
            string op1 = s.top(); s.pop();
            string op2 = s.top(); s.pop();
            
            string temp = op1 + op2 + c;
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
    string prefix = "-+ab*cd";
    
    cout << "=== Prefix to Postfix ===\n\n";
    cout << "Prefix Expression: " << prefix << "\n";
    
    string postfix = prefixToPostfix(prefix);
    
    cout << "Postfix Expression: " << postfix << "\n\n";
    cout << "Complexity: O(n)\n";
    
    return 0;
}
