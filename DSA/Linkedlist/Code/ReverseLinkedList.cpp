#include <iostream>
using namespace std;

// Reverse Linked List in C++
struct Node {
    int data;
    Node* next;
    Node(int data) : data(data), next(NULL) {}
};

class ReverseLinkedList {
private:
    Node* head;
    
    Node* reverseRecursiveHelper(Node* node) {
        if (node == NULL || node->next == NULL)
            return node;
        
        Node* newHead = reverseRecursiveHelper(node->next);
        node->next->next = node;
        node->next = NULL;
        
        return newHead;
    }
    
public:
    ReverseLinkedList() : head(NULL) {}
    
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
    
    // Iterative reversal
    void reverseIterative() {
        Node* prev = NULL;
        Node* curr = head;
        Node* next = NULL;
        
        while (curr != NULL) {
            next = curr->next;
            curr->next = prev;
            prev = curr;
            curr = next;
        }
        
        head = prev;
    }
    
    // Recursive reversal
    void reverseRecursive() {
        head = reverseRecursiveHelper(head);
    }
    
    void display() {
        Node* temp = head;
        while (temp != NULL) {
            cout << temp->data << " -> ";
            temp = temp->next;
        }
        cout << "NULL\n";
    }
    
    ~ReverseLinkedList() {
        Node* temp;
        while (head != NULL) {
            temp = head;
            head = head->next;
            delete temp;
        }
    }
};

int main() {
    ReverseLinkedList list;
    
    cout << "=== Reverse Linked List ===\n\n";
    
    // Test 1: Iterative reverse
    for (int i = 1; i <= 5; i++)
        list.addNode(i * 10);
    
    cout << "Original list: ";
    list.display();
    
    list.reverseIterative();
    cout << "After iterative reverse: ";
    list.display();
    
    // Test 2: Recursive reverse
    ReverseLinkedList list2;
    for (int i = 1; i <= 5; i++)
        list2.addNode(i * 10);
    
    cout << "\nOriginal list: ";
    list2.display();
    
    list2.reverseRecursive();
    cout << "After recursive reverse: ";
    list2.display();
    
    cout << "\nComplexity Analysis:\n";
    cout << "Iterative reverse: O(n) time, O(1) space\n";
    cout << "Recursive reverse: O(n) time, O(n) space (call stack)\n";
    
    return 0;
}
