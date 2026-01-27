#include <iostream>
#include <vector>
using namespace std;

// Stack Implementation using Array in C++
class Stack {
private:
    vector<int> arr;
    int top;
    
public:
    Stack() : top(-1) {}
    
    bool isFull() {
        return top == (int)arr.size() - 1;
    }
    
    bool isEmpty() {
        return top == -1;
    }
    
    void push(int value) {
        if (arr.size() == 0) {
            arr.resize(100);
        }
        if (top < 99) {
            arr[++top] = value;
            cout << "Pushed: " << value << "\n";
        } else {
            cout << "Stack overflow\n";
        }
    }
    
    int pop() {
        if (isEmpty()) {
            cout << "Stack underflow\n";
            return -1;
        }
        return arr[top--];
    }
    
    int peek() {
        if (isEmpty()) {
            cout << "Stack is empty\n";
            return -1;
        }
        return arr[top];
    }
    
    void display() {
        if (isEmpty()) {
            cout << "Stack is empty\n";
            return;
        }
        
        cout << "Stack: ";
        for (int i = 0; i <= top; i++) {
            cout << arr[i] << " ";
        }
        cout << "\n";
    }
};

int main() {
    Stack stack;
    
    cout << "=== Stack Implementation (Array) ===\n\n";
    
    stack.push(10);
    stack.push(20);
    stack.push(30);
    stack.push(40);
    
    stack.display();
    
    cout << "\nPeek: " << stack.peek() << "\n";
    
    cout << "\nPopped: " << stack.pop() << "\n";
    cout << "Popped: " << stack.pop() << "\n";
    
    stack.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Push: O(1)\n";
    cout << "Pop: O(1)\n";
    cout << "Peek: O(1)\n";
    cout << "Space: O(n)\n";
    
    return 0;
}
