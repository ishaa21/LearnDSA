#include <stdio.h>
#include <stdlib.h>

// Insertion in Linked List in C
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

void insertAtPosition(Node** head, int data, int pos) {
    if (pos < 1) {
        printf("Invalid position\n");
        return;
    }
    
    Node* newNode = createNode(data);
    
    if (pos == 1) {
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
    temp->next = newNode;
}

// Insert in sorted order
void insertSorted(Node** head, int data) {
    Node* newNode = createNode(data);
    
    if (*head == NULL || (*head)->data >= data) {
        newNode->next = *head;
        *head = newNode;
        return;
    }
    
    Node* temp = *head;
    while (temp->next != NULL && temp->next->data < data)
        temp = temp->next;
    
    newNode->next = temp->next;
    temp->next = newNode;
}

void display(Node* head) {
    Node* temp = head;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
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
    
    printf("=== Insertion in Linked List ===\n\n");
    
    // Test 1: Insert at position
    insertAtPosition(&head, 10, 1);
    insertAtPosition(&head, 20, 2);
    insertAtPosition(&head, 30, 3);
    insertAtPosition(&head, 15, 2);
    
    printf("After position-based insertions: ");
    display(head);
    
    freeList(head);
    head = NULL;
    
    // Test 2: Insert in sorted order
    insertSorted(&head, 20);
    insertSorted(&head, 10);
    insertSorted(&head, 30);
    insertSorted(&head, 15);
    insertSorted(&head, 25);
    
    printf("After sorted insertions: ");
    display(head);
    
    printf("\nComplexity Analysis:\n");
    printf("Insert at position: O(n)\n");
    printf("Insert sorted: O(n)\n");
    printf("Space: O(1) for operation, O(n) for list\n");
    
    freeList(head);
    return 0;
}
