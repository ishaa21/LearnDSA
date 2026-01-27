#include <iostream>
using namespace std;

// Insertion in Linked List in C++
struct Node {
    int data;
    Node* next;
    Node(int data) : data(data), next(NULL) {}
};

class LinkedListInsertion {
private:
    Node* head;
    
public:
    LinkedListInsertion() : head(NULL) {}
    
    void insertAtPosition(int data, int pos) {
        if (pos < 1) {
            cout << "Invalid position\n";
            return;
        }
        
        Node* newNode = new Node(data);
        
        if (pos == 1) {
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
        temp->next = newNode;
    }
    
    // Insert in sorted order
    void insertSorted(int data) {
        Node* newNode = new Node(data);
        
        if (head == NULL || head->data >= data) {
            newNode->next = head;
            head = newNode;
            return;
        }
        
        Node* temp = head;
        while (temp->next != NULL && temp->next->data < data)
            temp = temp->next;
        
        newNode->next = temp->next;
        temp->next = newNode;
    }
    
    void display() {
        Node* temp = head;
        while (temp != NULL) {
            cout << temp->data << " -> ";
            temp = temp->next;
        }
        cout << "NULL\n";
    }
    
    ~LinkedListInsertion() {
        Node* temp;
        while (head != NULL) {
            temp = head;
            head = head->next;
            delete temp;
        }
    }
};

int main() {
    LinkedListInsertion list;
    
    cout << "=== Insertion in Linked List ===\n\n";
    
    // Test 1: Insert at position
    list.insertAtPosition(10, 1);
    list.insertAtPosition(20, 2);
    list.insertAtPosition(30, 3);
    list.insertAtPosition(15, 2);
    
    cout << "After position-based insertions: ";
    list.display();
    
    LinkedListInsertion list2;
    
    // Test 2: Insert in sorted order
    list2.insertSorted(20);
    list2.insertSorted(10);
    list2.insertSorted(30);
    list2.insertSorted(15);
    list2.insertSorted(25);
    
    cout << "After sorted insertions: ";
    list2.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Insert at position: O(n)\n";
    cout << "Insert sorted: O(n)\n";
    cout << "Space: O(1) for operation, O(n) for list\n";
    
    return 0;
}
