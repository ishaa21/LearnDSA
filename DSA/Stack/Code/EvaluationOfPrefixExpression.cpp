#include <iostream>
#include <string>
#include <stack>
#include <cmath>
using namespace std;

// Evaluation of Prefix Expression in C++
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

int evaluatePrefix(string prefix) {
    stack<int> s;
    int len = prefix.length();
    
    for (int i = len - 1; i >= 0; i--) {
        char c = prefix[i];
        
        if (isdigit(c)) {
            s.push(c - '0');
        } else if (isOperator(c)) {
            int a = s.top(); s.pop();
            int b = s.top(); s.pop();
            s.push(evaluate(a, b, c));
        }
    }
    
    return s.top();
}

int main() {
    string prefix = "-*+2345";
    
    cout << "=== Evaluation of Prefix Expression ===\n\n";
    cout << "Prefix Expression: " << prefix << "\n";
    cout << "Result: " << evaluatePrefix(prefix) << "\n\n";
    
    cout << "Steps (-*+2345):\n";
    cout << "1. Process 5: Push 5\n";
    cout << "2. Process 4: Push 4\n";
    cout << "3. Process 3: Push 3\n";
    cout << "4. Process +: Pop 3,4; Compute 3+4=7; Push 7\n";
    cout << "5. Process 2: Push 2\n";
    cout << "6. Process *: Pop 2,7; Compute 2*7=14; Push 14\n";
    cout << "7. Process -: Pop 14,5; Compute 14-5=9; Push 9\n\n";
    
    cout << "Complexity: O(n)\n";
    
    return 0;
}
