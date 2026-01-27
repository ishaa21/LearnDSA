#include <iostream>
#include <string>
#include <stack>
using namespace std;

// Postfix to Prefix in C++
bool isOperator(char c) {
    return (c == '+' || c == '-' || c == '*' || c == '/');
}

string postfixToPrefix(string postfix) {
    stack<string> s;
    
    for (char c : postfix) {
        if (isOperator(c)) {
            string op2 = s.top(); s.pop();
            string op1 = s.top(); s.pop();
            
            string temp = "";
            temp += c;
            temp += op1;
            temp += op2;
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
    
    cout << "=== Postfix to Prefix ===\n\n";
    cout << "Postfix Expression: " << postfix << "\n";
    
    string prefix = postfixToPrefix(postfix);
    
    cout << "Prefix Expression: " << prefix << "\n\n";
    cout << "Complexity: O(n)\n";
    
    return 0;
}
