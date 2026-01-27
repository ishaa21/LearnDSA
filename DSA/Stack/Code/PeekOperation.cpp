#include <iostream>
#include <vector>
using namespace std;

// Peek Operation in C++
class Stack {
private:
    vector<int> arr;
    int top;
    
public:
    Stack() : top(-1) { arr.resize(100); }
    
    bool isEmpty() {
        return top == -1;
    }
    
    void push(int value) {
        arr[++top] = value;
    }
    
    int peek() {
        if (isEmpty()) {
            cout << "Stack is empty - cannot peek\n";
            return -1;
        }
        cout << "Peeked: " << arr[top] << " (at position " << top << ")\n";
        return arr[top];
    }
    
    void display() {
        if (isEmpty()) {
            cout << "Stack is empty\n";
            return;
        }
        cout << "Current stack: ";
        for (int i = 0; i <= top; i++) {
            cout << arr[i] << " ";
        }
        cout << "\n";
    }
};

int main() {
    Stack stack;
    
    cout << "=== Peek Operation ===\n\n";
    
    stack.peek();
    
    cout << "\nPushing elements:\n";
    for (int i = 1; i <= 5; i++) {
        stack.push(i * 10);
    }
    
    stack.display();
    
    cout << "\nPeeking without removing:\n";
    for (int i = 0; i < 3; i++) {
        stack.peek();
    }
    
    stack.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Time: O(1)\n";
    cout << "Space: O(1)\n";
    
    return 0;
}
