#include <iostream>
using namespace std;

// Reverse Doubly Linked List in C++
struct Node {
    int data;
    Node* next;
    Node* prev;
    Node(int data) : data(data), next(NULL), prev(NULL) {}
};

class ReverseDoublyLinkedList {
private:
    Node* head;
    
public:
    ReverseDoublyLinkedList() : head(NULL) {}
    
    void addNode(int data) {
        Node* newNode = new Node(data);
        if (head == NULL) {
            head = newNode;
            return;
        }
        Node* temp = head;
        while (temp->next != NULL) temp = temp->next;
        temp->next = newNode;
        newNode->prev = temp;
    }
    
    void reverseIterative() {
        if (head == NULL) return;
        
        Node* temp = NULL;
        Node* curr = head;
        
        while (curr != NULL) {
            temp = curr->prev;
            curr->prev = curr->next;
            curr->next = temp;
            curr = curr->prev;
        }
        
        if (temp != NULL)
            head = temp->prev;
    }
    
    void displayForward() {
        Node* temp = head;
        while (temp != NULL) {
            cout << temp->data << " <-> ";
            temp = temp->next;
        }
        cout << "NULL\n";
    }
    
    void displayBackward() {
        if (head == NULL) return;
        Node* temp = head;
        while (temp->next != NULL)
            temp = temp->next;
        
        while (temp != NULL) {
            cout << temp->data << " <-> ";
            temp = temp->prev;
        }
        cout << "NULL\n";
    }
    
    ~ReverseDoublyLinkedList() {
        Node* temp;
        while (head != NULL) {
            temp = head;
            head = head->next;
            delete temp;
        }
    }
};

int main() {
    ReverseDoublyLinkedList list;
    
    cout << "=== Reverse Doubly Linked List ===\n\n";
    
    // Build list
    for (int i = 1; i <= 5; i++)
        list.addNode(i * 10);
    
    cout << "Original (Forward): ";
    list.displayForward();
    
    cout << "Original (Backward): ";
    list.displayBackward();
    
    list.reverseIterative();
    
    cout << "\nAfter reverse (Forward): ";
    list.displayForward();
    
    cout << "After reverse (Backward): ";
    list.displayBackward();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Reverse: O(n) time, O(1) space\n";
    
    return 0;
}
