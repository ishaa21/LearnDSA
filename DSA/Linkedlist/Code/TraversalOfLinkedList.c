#include <stdio.h>
#include <stdlib.h>

// Traversal of Linked List in C
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

void displayForward(Node* head) {
    printf("Forward: ");
    Node* temp = head;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

void displayRecursive(Node* head) {
    if (head == NULL) {
        printf("NULL\n");
        return;
    }
    printf("%d -> ", head->data);
    displayRecursive(head->next);
}

int countNodes(Node* head) {
    int count = 0;
    Node* temp = head;
    while (temp != NULL) {
        count++;
        temp = temp->next;
    }
    return count;
}

Node* getNode(Node* head, int pos) {
    if (pos < 1) return NULL;
    Node* temp = head;
    for (int i = 1; i < pos && temp != NULL; i++)
        temp = temp->next;
    return temp;
}

void freeList(Node* head) {
    Node* temp;
    while (head != NULL) {
        temp = head;
        head = head->next;
        free(temp);
    }
}

int main() {
    Node* head = NULL;
    
    printf("=== Traversal of Linked List ===\n\n");
    
    // Build list
    for (int i = 1; i <= 5; i++) {
        Node* newNode = createNode(i * 10);
        if (head == NULL) head = newNode;
        else {
            Node* temp = head;
            while (temp->next != NULL) temp = temp->next;
            temp->next = newNode;
        }
    }
    
    // Test 1: Iterative forward traversal
    displayForward(head);
    
    // Test 2: Recursive traversal
    printf("Recursive: ");
    displayRecursive(head);
    
    // Test 3: Count nodes
    printf("Total nodes: %d\n", countNodes(head));
    
    // Test 4: Get specific node
    Node* node = getNode(head, 3);
    if (node != NULL)
        printf("Node at position 3: %d\n", node->data);
    
    printf("\nComplexity Analysis:\n");
    printf("Forward traversal: O(n)\n");
    printf("Recursive traversal: O(n) time, O(n) space (call stack)\n");
    printf("Count nodes: O(n)\n");
    printf("Get at position: O(n)\n");
    
    freeList(head);
    return 0;
}
