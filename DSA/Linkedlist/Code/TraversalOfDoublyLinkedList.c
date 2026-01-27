#include <stdio.h>
#include <stdlib.h>

// Traversal of Doubly Linked List in C
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

void displayForward(Node* head) {
    printf("Forward: ");
    Node* temp = head;
    while (temp != NULL) {
        printf("%d <-> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

void displayBackward(Node* head) {
    if (head == NULL) return;
    
    Node* temp = head;
    while (temp->next != NULL)
        temp = temp->next;
    
    printf("Backward: ");
    while (temp != NULL) {
        printf("%d <-> ", temp->data);
        temp = temp->prev;
    }
    printf("NULL\n");
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
    
    printf("=== Traversal of Doubly Linked List ===\n\n");
    
    // Build list
    for (int i = 1; i <= 5; i++) {
        Node* newNode = createNode(i * 10);
        if (head == NULL) head = newNode;
        else {
            Node* temp = head;
            while (temp->next != NULL) temp = temp->next;
            temp->next = newNode;
            newNode->prev = temp;
        }
    }
    
    // Test 1: Forward traversal
    displayForward(head);
    
    // Test 2: Backward traversal
    displayBackward(head);
    
    // Test 3: Count nodes
    printf("Total nodes: %d\n", countNodes(head));
    
    // Test 4: Get at position
    Node* node = getNode(head, 3);
    if (node != NULL)
        printf("Node at position 3: %d\n", node->data);
    
    printf("\nComplexity Analysis:\n");
    printf("Forward traversal: O(n)\n");
    printf("Backward traversal: O(n)\n");
    printf("Count nodes: O(n)\n");
    printf("Get at position: O(n)\n");
    
    freeList(head);
    return 0;
}
