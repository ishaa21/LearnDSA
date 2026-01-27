#include <iostream>
using namespace std;

// Insertion in Doubly Linked List in C++
struct Node {
    int data;
    Node* next;
    Node* prev;
    Node(int data) : data(data), next(NULL), prev(NULL) {}
};

class DoublyLinkedListInsertion {
private:
    Node* head;
    
public:
    DoublyLinkedListInsertion() : head(NULL) {}
    
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
    
    void insertAtPosition(int data, int pos) {
        if (pos < 1) {
            cout << "Invalid position\n";
            return;
        }
        
        Node* newNode = new Node(data);
        
        if (pos == 1) {
            if (head != NULL)
                head->prev = newNode;
            newNode->next = head;
            head = newNode;
            return;
        }
        
        Node* temp = head;
        for (int i = 1; i < pos - 1 && temp != NULL; i++)
            temp = temp->next;
        
        if (temp == NULL) {
            cout << "Position out of range\n";
            delete newNode;
            return;
        }
        
        newNode->next = temp->next;
        newNode->prev = temp;
        if (temp->next != NULL)
            temp->next->prev = newNode;
        temp->next = newNode;
    }
    
    void displayForward() {
        Node* temp = head;
        while (temp != NULL) {
            cout << temp->data << " <-> ";
            temp = temp->next;
        }
        cout << "NULL\n";
    }
    
    ~DoublyLinkedListInsertion() {
        Node* temp;
        while (head != NULL) {
            temp = head;
            head = head->next;
            delete temp;
        }
    }
};

int main() {
    DoublyLinkedListInsertion list;
    
    cout << "=== Insertion in Doubly Linked List ===\n\n";
    
    list.insertAtEnd(10);
    list.insertAtEnd(20);
    list.insertAtEnd(30);
    
    cout << "After end insertions: ";
    list.displayForward();
    
    list.insertAtBeginning(5);
    cout << "After beginning insertion: ";
    list.displayForward();
    
    list.insertAtPosition(15, 2);
    cout << "After position insertion: ";
    list.displayForward();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Insert at beginning: O(1)\n";
    cout << "Insert at end: O(n)\n";
    cout << "Insert at position: O(n)\n";
    cout << "Space: O(1) for operation\n";
    
    return 0;
}
