#include <iostream>
using namespace std;

// Doubly Linked List in C++
struct Node {
    int data;
    Node* next;
    Node* prev;
    Node(int data) : data(data), next(NULL), prev(NULL) {}
};

class DoublyLinkedList {
private:
    Node* head;
    
public:
    DoublyLinkedList() : head(NULL) {}
    
    void insertAtBeginning(int data) {
        Node* newNode = new Node(data);
        if (head != NULL)
            head->prev = newNode;
        newNode->next = head;
        head = newNode;
    }
    
    void insertAtEnd(int data) {
        Node* newNode = new Node(data);
        if (head == NULL) {
            head = newNode;
            return;
        }
        
        Node* temp = head;
        while (temp->next != NULL)
            temp = temp->next;
        
        temp->next = newNode;
        newNode->prev = temp;
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
    
    ~DoublyLinkedList() {
        Node* temp;
        while (head != NULL) {
            temp = head;
            head = head->next;
            delete temp;
        }
    }
};

int main() {
    DoublyLinkedList list;
    
    cout << "=== Doubly Linked List ===\n\n";
    
    list.insertAtEnd(10);
    list.insertAtEnd(20);
    list.insertAtEnd(30);
    
    cout << "Forward: ";
    list.displayForward();
    
    cout << "Backward: ";
    list.displayBackward();
    
    list.insertAtBeginning(5);
    cout << "\nAfter inserting 5 at beginning:\n";
    cout << "Forward: ";
    list.displayForward();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Insert at beginning: O(1)\n";
    cout << "Insert at end: O(n)\n";
    cout << "Delete: O(1) with pointer, O(n) without\n";
    cout << "Space: O(n)\n";
    
    return 0;
}
