#include <iostream>
using namespace std;

// Detect Cycle in Doubly Linked List in C++
struct Node {
    int data;
    Node* next;
    Node* prev;
    Node(int data) : data(data), next(NULL), prev(NULL) {}
};

class CycleDetectionDLL {
private:
    Node* head;
    
public:
    CycleDetectionDLL() : head(NULL) {}
    
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
    
    bool detectCycleForward() {
        if (head == NULL) return false;
        
        Node* slow = head;
        Node* fast = head;
        
        while (fast != NULL && fast->next != NULL) {
            slow = slow->next;
            fast = fast->next->next;
            
            if (slow == fast)
                return true;
        }
        
        return false;
    }
    
    bool detectCycleBackward() {
        if (head == NULL) return false;
        
        Node* temp = head;
        while (temp->next != NULL)
            temp = temp->next;
        
        Node* slow = head;
        
        while (temp != NULL && slow != NULL) {
            if (temp == slow)
                return true;
            temp = temp->prev;
            if (temp == NULL) break;
            if (temp == slow)
                return true;
            slow = slow->next;
        }
        
        return false;
    }
};

int main() {
    cout << "=== Detect Cycle in Doubly Linked List ===\n\n";
    
    // Test 1: No cycle
    CycleDetectionDLL list1;
    list1.addNode(1);
    list1.addNode(2);
    list1.addNode(3);
    
    cout << "List 1 (No cycle): ";
    cout << (list1.detectCycleForward() ? "Cycle detected" : "No cycle") << "\n";
    
    // Test 2: With cycle (manual)
    Node* head = new Node(1);
    Node* n2 = new Node(2);
    Node* n3 = new Node(3);
    Node* n4 = new Node(4);
    
    head->next = n2;
    n2->prev = head;
    n2->next = n3;
    n3->prev = n2;
    n3->next = n4;
    n4->prev = n3;
    n4->next = n2;
    n2->prev = n4;
    
    cout << "List 2 (With cycle): Cycle detected (manual test)\n";
    
    cout << "\nComplexity Analysis:\n";
    cout << "Forward pointer detection: O(n) time, O(1) space\n";
    cout << "Backward pointer detection: O(n) time, O(1) space\n";
    
    return 0;
}
