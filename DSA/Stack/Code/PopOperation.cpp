#include <iostream>
#include <vector>
using namespace std;

// Pop Operation in C++
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
    
    int pop() {
        if (isEmpty()) {
            cout << "Stack underflow - cannot pop\n";
            return -1;
        }
        int value = arr[top];
        cout << "Successfully popped: " << value << " (top = " << top - 1 << ")\n";
        top--;
        return value;
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
    
    cout << "=== Pop Operation ===\n\n";
    
    for (int i = 1; i <= 5; i++) {
        stack.push(i * 10);
    }
    
    stack.display();
    
    cout << "\nPopping elements:\n";
    stack.pop();
    stack.pop();
    
    stack.display();
    
    cout << "\nPopping all remaining:\n";
    while (!stack.isEmpty()) {
        stack.pop();
    }
    
    stack.display();
    stack.pop();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Time: O(1)\n";
    cout << "Space: O(1)\n";
    
    return 0;
}
