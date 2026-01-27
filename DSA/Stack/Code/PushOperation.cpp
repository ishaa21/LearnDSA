#include <iostream>
#include <vector>
using namespace std;

// Push Operation in C++
class Stack {
private:
    vector<int> arr;
    int top;
    
public:
    Stack() : top(-1) { arr.resize(100); }
    
    bool isFull() {
        return top == 99;
    }
    
    void push(int value) {
        if (isFull()) {
            cout << "Stack overflow - cannot push " << value << "\n";
            return;
        }
        arr[++top] = value;
        cout << "Successfully pushed: " << value << " (top = " << top << ")\n";
    }
    
    void display() {
        if (top == -1) {
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
    
    cout << "=== Push Operation ===\n\n";
    
    stack.display();
    
    for (int i = 1; i <= 5; i++) {
        stack.push(i * 10);
    }
    
    stack.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Time: O(1)\n";
    cout << "Space: O(1)\n";
    
    return 0;
}
