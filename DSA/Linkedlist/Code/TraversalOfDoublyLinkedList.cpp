#include <iostream>
using namespace std;

// Traversal of Doubly Linked List in C++
struct Node {
    int data;
    Node* next;
    Node* prev;
    Node(int data) : data(data), next(NULL), prev(NULL) {}
};

class DoublyLinkedListTraversal {
private:
    Node* head;
    
public:
    DoublyLinkedListTraversal() : head(NULL) {}
    
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
    
    void displayForward() {
        cout << "Forward: ";
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
        
        cout << "Backward: ";
        while (temp != NULL) {
            cout << temp->data << " <-> ";
            temp = temp->prev;
        }
        cout << "NULL\n";
    }
    
    int countNodes() {
        int count = 0;
        Node* temp = head;
        while (temp != NULL) {
            count++;
            temp = temp->next;
        }
        return count;
    }
    
    Node* getNode(int pos) {
        if (pos < 1) return NULL;
        Node* temp = head;
        for (int i = 1; i < pos && temp != NULL; i++)
            temp = temp->next;
        return temp;
    }
    
    ~DoublyLinkedListTraversal() {
        Node* temp;
        while (head != NULL) {
            temp = head;
            head = head->next;
            delete temp;
        }
    }
};

int main() {
    DoublyLinkedListTraversal list;
    
    cout << "=== Traversal of Doubly Linked List ===\n\n";
    
    // Build list
    for (int i = 1; i <= 5; i++)
        list.addNode(i * 10);
    
    // Test 1: Forward traversal
    list.displayForward();
    
    // Test 2: Backward traversal
    list.displayBackward();
    
    // Test 3: Count nodes
    cout << "Total nodes: " << list.countNodes() << "\n";
    
    // Test 4: Get at position
    Node* node = list.getNode(3);
    if (node != NULL)
        cout << "Node at position 3: " << node->data << "\n";
    
    cout << "\nComplexity Analysis:\n";
    cout << "Forward traversal: O(n)\n";
    cout << "Backward traversal: O(n)\n";
    cout << "Count nodes: O(n)\n";
    cout << "Get at position: O(n)\n";
    
    return 0;
}
