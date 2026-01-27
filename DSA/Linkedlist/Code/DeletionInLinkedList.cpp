#include <iostream>
using namespace std;

// Deletion in Linked List in C++
struct Node {
    int data;
    Node* next;
    Node(int data) : data(data), next(NULL) {}
};

class LinkedListDeletion {
private:
    Node* head;
    
public:
    LinkedListDeletion() : head(NULL) {}
    
    void addNode(int data) {
        Node* newNode = new Node(data);
        if (head == NULL) {
            head = newNode;
            return;
        }
        Node* temp = head;
        while (temp->next != NULL) temp = temp->next;
        temp->next = newNode;
    }
    
    void deleteAtPosition(int pos) {
        if (head == NULL) return;
        
        if (pos == 1) {
            Node* temp = head;
            head = head->next;
            delete temp;
            return;
        }
        
        Node* temp = head;
        for (int i = 1; i < pos - 1 && temp != NULL; i++)
            temp = temp->next;
        
        if (temp == NULL || temp->next == NULL) return;
        
        Node* toDelete = temp->next;
        temp->next = toDelete->next;
        delete toDelete;
    }
    
    void deleteByValue(int value) {
        if (head == NULL) return;
        
        if (head->data == value) {
            Node* temp = head;
            head = head->next;
            delete temp;
            return;
        }
        
        Node* temp = head;
        while (temp->next != NULL && temp->next->data != value)
            temp = temp->next;
        
        if (temp->next != NULL) {
            Node* toDelete = temp->next;
            temp->next = toDelete->next;
            delete toDelete;
        }
    }
    
    void deleteAllOccurrences(int value) {
        while (head != NULL && head->data == value) {
            Node* temp = head;
            head = head->next;
            delete temp;
        }
        
        if (head == NULL) return;
        
        Node* temp = head;
        while (temp->next != NULL) {
            if (temp->next->data == value) {
                Node* toDelete = temp->next;
                temp->next = toDelete->next;
                delete toDelete;
            } else {
                temp = temp->next;
            }
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
    
    ~LinkedListDeletion() {
        Node* temp;
        while (head != NULL) {
            temp = head;
            head = head->next;
            delete temp;
        }
    }
};

int main() {
    LinkedListDeletion list;
    
    cout << "=== Deletion in Linked List ===\n\n";
    
    // Test 1: Delete at position
    for (int i = 1; i <= 5; i++)
        list.addNode(i * 10);
    
    cout << "Original list: ";
    list.display();
    
    list.deleteAtPosition(2);
    cout << "After deleting position 2: ";
    list.display();
    
    // Test 2: Delete by value
    list.deleteByValue(40);
    cout << "After deleting value 40: ";
    list.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Delete at position: O(n)\n";
    cout << "Delete by value: O(n)\n";
    cout << "Delete all occurrences: O(n)\n";
    cout << "Space: O(1)\n";
    
    return 0;
}
