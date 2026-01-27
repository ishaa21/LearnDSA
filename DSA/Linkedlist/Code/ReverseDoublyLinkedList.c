#include <stdio.h>
#include <stdlib.h>

// Reverse Doubly Linked List in C
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

void reverseIterative(Node** head) {
    if (*head == NULL) return;
    
    Node* temp = NULL;
    Node* curr = *head;
    
    while (curr != NULL) {
        temp = curr->prev;
        curr->prev = curr->next;
        curr->next = temp;
        curr = curr->prev;
    }
    
    if (temp != NULL)
        *head = temp->prev;
}

void displayForward(Node* head) {
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
    
    while (temp != NULL) {
        printf("%d <-> ", temp->data);
        temp = temp->prev;
    }
    printf("NULL\n");
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
    
    printf("=== Reverse Doubly Linked List ===\n\n");
    
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
    
    printf("Original (Forward): ");
    displayForward(head);
    
    printf("Original (Backward): ");
    displayBackward(head);
    
    reverseIterative(&head);
    
    printf("\nAfter reverse (Forward): ");
    displayForward(head);
    
    printf("After reverse (Backward): ");
    displayBackward(head);
    
    printf("\nComplexity Analysis:\n");
    printf("Reverse: O(n) time, O(1) space\n");
    
    freeList(head);
    return 0;
}
