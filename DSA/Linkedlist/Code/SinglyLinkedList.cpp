#include <iostream>
using namespace std;

// Singly Linked List in C++
// Complete implementation of singly linked list operations

struct Node {
    int data;
    Node* next;
    Node(int data) : data(data), next(NULL) {}
};

class SinglyLinkedList {
private:
    Node* head;
    
public:
    SinglyLinkedList() : head(NULL) {}
    
    void insertAtBeginning(int data) {
        Node* newNode = new Node(data);
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
    }
    
    void insertAtPosition(int data, int pos) {
        if (pos == 0) {
            insertAtBeginning(data);
            return;
        }
        
        Node* temp = head;
        for (int i = 0; i < pos - 1 && temp != NULL; i++)
            temp = temp->next;
        
        if (temp == NULL) return;
        
        Node* newNode = new Node(data);
        newNode->next = temp->next;
        temp->next = newNode;
    }
    
    void deleteNode(int key) {
        if (head == NULL) return;
        
        if (head->data == key) {
            Node* temp = head;
            head = head->next;
            delete temp;
            return;
        }
        
        Node* temp = head;
        while (temp->next != NULL && temp->next->data != key)
            temp = temp->next;
        
        if (temp->next != NULL) {
            Node* nodeToDelete = temp->next;
            temp->next = nodeToDelete->next;
            delete nodeToDelete;
        }
    }
    
    void display() {
        Node* temp = head;
        while (temp != NULL) {
            cout << temp->data << " -> ";
            temp = temp->next;
        }
        cout << "NULL\n";
    }
    
    ~SinglyLinkedList() {
        Node* temp;
        while (head != NULL) {
            temp = head;
            head = head->next;
            delete temp;
        }
    }
};

int main() {
    SinglyLinkedList list;
    
    cout << "=== Singly Linked List Operations ===\n\n";
    
    // Insert at end
    list.insertAtEnd(10);
    list.insertAtEnd(20);
    list.insertAtEnd(30);
    list.insertAtEnd(40);
    
    cout << "Initial List: ";
    list.display();
    
    // Insert at beginning
    list.insertAtBeginning(5);
    cout << "After inserting 5 at beginning: ";
    list.display();
    
    // Insert at position
    list.insertAtPosition(15, 2);
    cout << "After inserting 15 at position 2: ";
    list.display();
    
    // Delete nodes
    list.deleteNode(15);
    cout << "After deleting 15: ";
    list.display();
    
    list.deleteNode(5);
    cout << "After deleting 5: ";
    list.display();
    
    list.deleteNode(40);
    cout << "After deleting 40: ";
    list.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Insert at beginning: O(1)\n";
    cout << "Insert at end: O(n)\n";
    cout << "Insert at position: O(n)\n";
    cout << "Delete: O(n)\n";
    cout << "Search: O(n)\n";
    cout << "Space: O(n)\n";
    
    return 0;
}
