#include <stdio.h>
#include <stdlib.h>

// Insertion in Doubly Linked List in C
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

void insertAtPosition(Node** head, int data, int pos) {
    if (pos < 1) {
        printf("Invalid position\n");
        return;
    }
    
    Node* newNode = createNode(data);
    
    if (pos == 1) {
        if (*head != NULL)
            (*head)->prev = newNode;
        newNode->next = *head;
        *head = newNode;
        return;
    }
    
    Node* temp = *head;
    for (int i = 1; i < pos - 1 && temp != NULL; i++)
        temp = temp->next;
    
    if (temp == NULL) {
        printf("Position out of range\n");
        free(newNode);
        return;
    }
    
    newNode->next = temp->next;
    newNode->prev = temp;
    if (temp->next != NULL)
        temp->next->prev = newNode;
    temp->next = newNode;
}

void displayForward(Node* head) {
    Node* temp = head;
    while (temp != NULL) {
        printf("%d <-> ", temp->data);
        temp = temp->next;
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
    
    printf("=== Insertion in Doubly Linked List ===\n\n");
    
    insertAtEnd(&head, 10);
    insertAtEnd(&head, 20);
    insertAtEnd(&head, 30);
    
    printf("After end insertions: ");
    displayForward(head);
    
    insertAtBeginning(&head, 5);
    printf("After beginning insertion: ");
    displayForward(head);
    
    insertAtPosition(&head, 15, 2);
    printf("After position insertion: ");
    displayForward(head);
    
    printf("\nComplexity Analysis:\n");
    printf("Insert at beginning: O(1)\n");
    printf("Insert at end: O(n)\n");
    printf("Insert at position: O(n)\n");
    printf("Space: O(1) for operation\n");
    
    freeList(head);
    return 0;
}
