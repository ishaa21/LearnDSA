#include <iostream>
using namespace std;

// Introduction to Linked List in C++
// Basic structure and node operations

struct Node {
    int data;
    Node* next;
    
    Node(int data) : data(data), next(NULL) {}
};

// Create a new node
Node* createNode(int data) {
    return new Node(data);
}

// Insert at beginning
Node* insertAtBeginning(Node* head, int data) {
    Node* newNode = createNode(data);
    newNode->next = head;
    return newNode;
}

// Insert at end
Node* insertAtEnd(Node* head, int data) {
    Node* newNode = createNode(data);
    
    if (head == NULL)
        return newNode;
    
    Node* temp = head;
    while (temp->next != NULL)
        temp = temp->next;
    
    temp->next = newNode;
    return head;
}

// Display linked list
void display(Node* head) {
    Node* temp = head;
    while (temp != NULL) {
        cout << temp->data << " -> ";
        temp = temp->next;
    }
    cout << "NULL\n";
}

// Count nodes
int countNodes(Node* head) {
    int count = 0;
    Node* temp = head;
    while (temp != NULL) {
        count++;
        temp = temp->next;
    }
    return count;
}

// Search element
bool search(Node* head, int key) {
    Node* temp = head;
    while (temp != NULL) {
        if (temp->data == key)
            return true;
        temp = temp->next;
    }
    return false;
}

// Free memory
void freeList(Node* head) {
    Node* temp;
    while (head != NULL) {
        temp = head;
        head = head->next;
        delete temp;
    }
}

int main() {
    Node* head = NULL;
    
    // Create linked list: 10 -> 20 -> 30 -> NULL
    head = insertAtEnd(head, 10);
    head = insertAtEnd(head, 20);
    head = insertAtEnd(head, 30);
    
    cout << "Linked List: ";
    display(head);
    
    // Insert at beginning
    head = insertAtBeginning(head, 5);
    cout << "After inserting 5 at beginning: ";
    display(head);
    
    // Insert at end
    head = insertAtEnd(head, 40);
    cout << "After inserting 40 at end: ";
    display(head);
    
    // Count nodes
    cout << "Number of nodes: " << countNodes(head) << "\n";
    
    // Search
    cout << "Search 20: " << (search(head, 20) ? "Found" : "Not Found") << "\n";
    cout << "Search 50: " << (search(head, 50) ? "Found" : "Not Found") << "\n";
    
    cout << "\nComplexity Analysis:\n";
    cout << "Create Node: O(1)\n";
    cout << "Insert at beginning: O(1)\n";
    cout << "Insert at end: O(n)\n";
    cout << "Search: O(n)\n";
    cout << "Display/Traverse: O(n)\n";
    cout << "Space: O(n)\n";
    
    freeList(head);
    return 0;
}
