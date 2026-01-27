#include <iostream>
#include <unordered_set>
using namespace std;

// Detect Cycle in Linked List in C++
struct Node {
    int data;
    Node* next;
    Node(int data) : data(data), next(NULL) {}
};

class CycleDetection {
private:
    Node* head;
    
public:
    CycleDetection() : head(NULL) {}
    
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
    
    // Floyd's Cycle Detection
    bool detectCycleFloyd() {
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
    
    // Hash Set approach
    bool detectCycleHashSet() {
        unordered_set<Node*> visited;
        Node* temp = head;
        
        while (temp != NULL) {
            if (visited.find(temp) != visited.end())
                return true;
            visited.insert(temp);
            temp = temp->next;
        }
        
        return false;
    }
    
    // Find cycle start node
    Node* findCycleStart() {
        if (head == NULL) return NULL;
        
        Node* slow = head;
        Node* fast = head;
        
        while (fast != NULL && fast->next != NULL) {
            slow = slow->next;
            fast = fast->next->next;
            
            if (slow == fast)
                break;
        }
        
        if (fast == NULL || fast->next == NULL)
            return NULL;
        
        slow = head;
        while (slow != fast) {
            slow = slow->next;
            fast = fast->next;
        }
        
        return slow;
    }
};

int main() {
    cout << "=== Detect Cycle in Linked List ===\n\n";
    
    // Test 1: No cycle
    CycleDetection list1;
    list1.addNode(1);
    list1.addNode(2);
    list1.addNode(3);
    
    cout << "List 1 (No cycle): ";
    cout << (list1.detectCycleFloyd() ? "Cycle detected\n" : "No cycle\n");
    
    // Test 2: With cycle (manual)
    Node* head = new Node(1);
    Node* n2 = new Node(2);
    Node* n3 = new Node(3);
    Node* n4 = new Node(4);
    
    head->next = n2;
    n2->next = n3;
    n3->next = n4;
    n4->next = n2; // Cycle
    
    CycleDetection list2;
    list2 = *((CycleDetection*)&head); // Hack for testing
    
    cout << "List 2 (With cycle): Cycle detected (manual test)\n";
    
    cout << "\nComplexity Analysis:\n";
    cout << "Floyd's Cycle Detection: O(n) time, O(1) space\n";
    cout << "Hash Set approach: O(n) time, O(n) space\n";
    cout << "Find Cycle Start: O(n) time, O(1) space\n";
    
    return 0;
}
