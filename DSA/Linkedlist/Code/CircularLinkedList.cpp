#include <iostream>
using namespace std;

// Circular Linked List in C++
struct Node {
    int data;
    Node* next;
    Node(int data) : data(data), next(NULL) {}
};

class CircularLinkedList {
private:
    Node* head;
    
public:
    CircularLinkedList() : head(NULL) {}
    
    void insertAtBeginning(int data) {
        Node* newNode = new Node(data);
        if (head == NULL) {
            newNode->next = newNode;
            head = newNode;
            return;
        }
        
        Node* temp = head;
        while (temp->next != head)
            temp = temp->next;
        
        newNode->next = head;
        temp->next = newNode;
        head = newNode;
    }
    
    void insertAtEnd(int data) {
        Node* newNode = new Node(data);
        if (head == NULL) {
            newNode->next = newNode;
            head = newNode;
            return;
        }
        
        Node* temp = head;
        while (temp->next != head)
            temp = temp->next;
        
        temp->next = newNode;
        newNode->next = head;
    }
    
    void display() {
        if (head == NULL) return;
        
        Node* temp = head;
        do {
            cout << temp->data << " -> ";
            temp = temp->next;
        } while (temp != head);
        cout << "(back to " << head->data << ")\n";
    }
    
    ~CircularLinkedList() {
        if (head == NULL) return;
        
        Node* temp = head->next;
        while (temp != head) {
            Node* toDelete = temp;
            temp = temp->next;
            delete toDelete;
        }
        delete head;
    }
};

int main() {
    CircularLinkedList list;
    
    cout << "=== Circular Linked List ===\n\n";
    
    list.insertAtEnd(10);
    list.insertAtEnd(20);
    list.insertAtEnd(30);
    
    cout << "List: ";
    list.display();
    
    list.insertAtBeginning(5);
    cout << "After inserting 5 at beginning: ";
    list.display();
    
    list.insertAtEnd(40);
    cout << "After inserting 40 at end: ";
    list.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Insert at beginning: O(n)\n";
    cout << "Insert at end: O(n)\n";
    cout << "Delete: O(n)\n";
    cout << "Space: O(n)\n";
    
    return 0;
}
