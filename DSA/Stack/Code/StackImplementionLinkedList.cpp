#include <iostream>
using namespace std;

// Stack Implementation using Linked List in C++
struct Node {
    int data;
    Node* next;
    Node(int data) : data(data), next(NULL) {}
};

class Stack {
private:
    Node* top;
    
public:
    Stack() : top(NULL) {}
    
    bool isEmpty() {
        return top == NULL;
    }
    
    void push(int value) {
        Node* newNode = new Node(value);
        newNode->next = top;
        top = newNode;
        cout << "Pushed: " << value << "\n";
    }
    
    int pop() {
        if (isEmpty()) {
            cout << "Stack underflow\n";
            return -1;
        }
        Node* temp = top;
        int value = temp->data;
        top = top->next;
        delete temp;
        return value;
    }
    
    int peek() {
        if (isEmpty()) {
            cout << "Stack is empty\n";
            return -1;
        }
        return top->data;
    }
    
    void display() {
        if (isEmpty()) {
            cout << "Stack is empty\n";
            return;
        }
        
        cout << "Stack: ";
        Node* temp = top;
        while (temp != NULL) {
            cout << temp->data << " -> ";
            temp = temp->next;
        }
        cout << "NULL\n";
    }
    
    ~Stack() {
        Node* temp;
        while (top != NULL) {
            temp = top;
            top = top->next;
            delete temp;
        }
    }
};

int main() {
    Stack stack;
    
    cout << "=== Stack Implementation (Linked List) ===\n\n";
    
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
