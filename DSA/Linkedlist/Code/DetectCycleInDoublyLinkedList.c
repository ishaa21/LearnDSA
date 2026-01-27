#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// Detect Cycle in Doubly Linked List in C
typedef struct Node {
    int data;
    struct Node* next;
    struct Node* prev;
} Node;

Node* createNode(int data) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->data = data;
    node->next = NULL;
    node->prev = NULL;
    return node;
}

// Detect cycle using two pointers
bool detectCycle(Node* head) {
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

// Detect cycle using backward pointers
bool detectCycleBackward(Node* head) {
    if (head == NULL) return false;
    
    Node* temp = head;
    while (temp->next != NULL)
        temp = temp->next;
    
    // Check if back pointer of last node points to some node in list
    Node* slow = head;
    Node* fast = head;
    
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

int main() {
    printf("=== Detect Cycle in Doubly Linked List ===\n\n");
    
    // Test 1: No cycle
    Node* head = createNode(1);
    Node* n2 = createNode(2);
    Node* n3 = createNode(3);
    
    head->next = n2;
    n2->prev = head;
    n2->next = n3;
    n3->prev = n2;
    
    printf("List 1 (No cycle): ");
    printf("%s\n", detectCycle(head) ? "Cycle detected" : "No cycle");
    
    // Test 2: With cycle
    Node* head2 = createNode(1);
    Node* m2 = createNode(2);
    Node* m3 = createNode(3);
    Node* m4 = createNode(4);
    
    head2->next = m2;
    m2->prev = head2;
    m2->next = m3;
    m3->prev = m2;
    m3->next = m4;
    m4->prev = m3;
    m4->next = m2; // Create cycle
    m2->prev = m4; // Backward pointer
    
    printf("List 2 (With cycle): ");
    printf("%s\n", detectCycle(head2) ? "Cycle detected" : "No cycle");
    
    printf("\nComplexity Analysis:\n");
    printf("Forward pointer detection: O(n) time, O(1) space\n");
    printf("Backward pointer detection: O(n) time, O(1) space\n");
    
    free(head);
    free(n2);
    free(n3);
    free(head2);
    free(m2);
    free(m3);
    free(m4);
    
    return 0;
}
