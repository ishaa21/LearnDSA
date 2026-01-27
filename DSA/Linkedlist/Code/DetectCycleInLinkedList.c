#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// Detect Cycle in Linked List in C
typedef struct Node {
    int data;
    struct Node* next;
} Node;

Node* createNode(int data) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->data = data;
    node->next = NULL;
    return node;
}

// Floyd's Cycle Detection (Tortoise & Hare)
bool detectCycleFloyd(Node* head) {
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

// Find cycle start node
Node* findCycleStart(Node* head) {
    if (head == NULL) return NULL;
    
    Node* slow = head;
    Node* fast = head;
    
    // Detect cycle
    while (fast != NULL && fast->next != NULL) {
        slow = slow->next;
        fast = fast->next->next;
        
        if (slow == fast)
            break;
    }
    
    if (fast == NULL || fast->next == NULL)
        return NULL; // No cycle
    
    // Find cycle start
    slow = head;
    while (slow != fast) {
        slow = slow->next;
        fast = fast->next;
    }
    
    return slow;
}

int main() {
    printf("=== Detect Cycle in Linked List ===\n\n");
    
    // Test 1: List without cycle
    Node* head = createNode(1);
    head->next = createNode(2);
    head->next->next = createNode(3);
    head->next->next->next = createNode(4);
    
    printf("List 1 (No cycle): ");
    if (detectCycleFloyd(head))
        printf("Cycle detected\n");
    else
        printf("No cycle\n");
    
    // Test 2: List with cycle
    Node* head2 = createNode(1);
    Node* node2 = createNode(2);
    Node* node3 = createNode(3);
    Node* node4 = createNode(4);
    
    head2->next = node2;
    node2->next = node3;
    node3->next = node4;
    node4->next = node2; // Creates cycle
    
    printf("List 2 (With cycle): ");
    if (detectCycleFloyd(head2))
        printf("Cycle detected\n");
    else
        printf("No cycle\n");
    
    Node* cycleStart = findCycleStart(head2);
    if (cycleStart != NULL)
        printf("Cycle starts at node with data: %d\n", cycleStart->data);
    
    printf("\nComplexity Analysis:\n");
    printf("Floyd's Cycle Detection: O(n) time, O(1) space\n");
    printf("Find Cycle Start: O(n) time, O(1) space\n");
    
    // Free memory (cycle list needs special handling)
    free(head);
    free(head2);
    free(node2);
    free(node3);
    free(node4);
    
    return 0;
}
