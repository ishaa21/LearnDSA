#include <iostream>
using namespace std;

// Traversal of Linked List in C++
struct Node {
    int data;
    Node* next;
    Node(int data) : data(data), next(NULL) {}
};

class LinkedListTraversal {
private:
    Node* head;
    
public:
    LinkedListTraversal() : head(NULL) {}
    
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
    
    void displayForward() {
        cout << "Forward: ";
        Node* temp = head;
        while (temp != NULL) {
            cout << temp->data << " -> ";
            temp = temp->next;
        }
        cout << "NULL\n";
    }
    
    void displayRecursive(Node* node = NULL) {
        static bool first = true;
        if (first) {
            cout << "Recursive: ";
            first = false;
            node = head;
        }
        if (node == NULL) {
            cout << "NULL\n";
            first = true;
            return;
        }
        cout << node->data << " -> ";
        displayRecursive(node->next);
    }
    
    int countNodes(Node* node = NULL) {
        if (node == NULL) node = head;
        if (node == NULL) return 0;
        return 1 + countNodes(node->next);
    }
    
    Node* getNode(int pos) {
        if (pos < 1) return NULL;
        Node* temp = head;
        for (int i = 1; i < pos && temp != NULL; i++)
            temp = temp->next;
        return temp;
    }
    
    ~LinkedListTraversal() {
        Node* temp;
        while (head != NULL) {
            temp = head;
            head = head->next;
            delete temp;
        }
    }
};

int main() {
    LinkedListTraversal list;
    
    cout << "=== Traversal of Linked List ===\n\n";
    
    // Build list
    for (int i = 1; i <= 5; i++)
        list.addNode(i * 10);
    
    // Test 1: Iterative forward traversal
    list.displayForward();
    
    // Test 2: Recursive traversal
    list.displayRecursive();
    
    // Test 3: Count nodes
    cout << "Total nodes: " << list.countNodes() << "\n";
    
    // Test 4: Get specific node
    Node* node = list.getNode(3);
    if (node != NULL)
        cout << "Node at position 3: " << node->data << "\n";
    
    cout << "\nComplexity Analysis:\n";
    cout << "Forward traversal: O(n)\n";
    cout << "Recursive traversal: O(n) time, O(n) space (call stack)\n";
    cout << "Count nodes: O(n)\n";
    cout << "Get at position: O(n)\n";
    
    return 0;
}
