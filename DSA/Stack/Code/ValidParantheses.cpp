#include <iostream>
#include <string>
#include <stack>
using namespace std;

// Valid Parentheses in C++
bool isValidParentheses(string str) {
    stack<char> s;
    
    for (char c : str) {
        if (c == '(' || c == '{' || c == '[') {
            s.push(c);
        } else if (c == ')' || c == '}' || c == ']') {
            if (s.empty()) return false;
            
            char top = s.top();
            s.pop();
            
            if ((c == ')' && top != '(') ||
                (c == '}' && top != '{') ||
                (c == ']' && top != '[')) {
                return false;
            }
        }
    }
    
    return s.empty();
}

int main() {
    cout << "=== Valid Parentheses ===\n\n";
    
    string tests[] = {
        "()",
        "(){}[]",
        "([{}])",
        "([)]",
        "{[}",
        "(((",
        ")"
    };
    
    for (string test : tests) {
        cout << "Expression: " << test << " -> " 
             << (isValidParentheses(test) ? "Valid" : "Invalid") << "\n";
    }
    
    cout << "\nComplexity: O(n)\n";
    cout << "Space: O(n)\n";
    
    return 0;
}
