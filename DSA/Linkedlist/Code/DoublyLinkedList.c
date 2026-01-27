#include <stdio.h>
#include <stdlib.h>

// Doubly Linked List in C
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

void insertAtBeginning(Node** head, int data) {
    Node* newNode = createNode(data);
    if (*head != NULL)
        (*head)->prev = newNode;
    newNode->next = *head;
    *head = newNode;
}

void insertAtEnd(Node** head, int data) {
    Node* newNode = createNode(data);
    if (*head == NULL) {
        *head = newNode;
        return;
    }
    
    Node* temp = *head;
    while (temp->next != NULL)
        temp = temp->next;
    
    temp->next = newNode;
    newNode->prev = temp;
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
    
    printf("=== Doubly Linked List ===\n\n");
    
    insertAtEnd(&head, 10);
    insertAtEnd(&head, 20);
    insertAtEnd(&head, 30);
    
    printf("Forward: ");
    displayForward(head);
    
    printf("Backward: ");
    displayBackward(head);
    
    insertAtBeginning(&head, 5);
    printf("\nAfter inserting 5 at beginning:\n");
    printf("Forward: ");
    displayForward(head);
    
    printf("\nComplexity Analysis:\n");
    printf("Insert at beginning: O(1)\n");
    printf("Insert at end: O(n)\n");
    printf("Delete: O(1) with pointer, O(n) without\n");
    printf("Space: O(n)\n");
    
    freeList(head);
    return 0;
}
