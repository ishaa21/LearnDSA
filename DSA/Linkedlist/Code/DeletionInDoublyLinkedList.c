#include <stdio.h>
#include <stdlib.h>

// Deletion in Doubly Linked List in C
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

void deleteAtPosition(Node** head, int pos) {
    if (*head == NULL) return;
    
    if (pos == 1) {
        Node* temp = *head;
        *head = (*head)->next;
        if (*head != NULL)
            (*head)->prev = NULL;
        free(temp);
        return;
    }
    
    Node* temp = *head;
    for (int i = 1; i < pos && temp != NULL; i++)
        temp = temp->next;
    
    if (temp == NULL) return;
    
    if (temp->next != NULL)
        temp->next->prev = temp->prev;
    if (temp->prev != NULL)
        temp->prev->next = temp->next;
    free(temp);
}

void deleteByValue(Node** head, int value) {
    if (*head == NULL) return;
    
    if ((*head)->data == value) {
        Node* temp = *head;
        *head = (*head)->next;
        if (*head != NULL)
            (*head)->prev = NULL;
        free(temp);
        return;
    }
    
    Node* temp = *head;
    while (temp != NULL && temp->data != value)
        temp = temp->next;
    
    if (temp == NULL) return;
    
    if (temp->next != NULL)
        temp->next->prev = temp->prev;
    if (temp->prev != NULL)
        temp->prev->next = temp->next;
    free(temp);
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
    
    printf("=== Deletion in Doubly Linked List ===\n\n");
    
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
    
    printf("Original list: ");
    displayForward(head);
    
    deleteAtPosition(&head, 2);
    printf("After deleting position 2: ");
    displayForward(head);
    
    deleteByValue(&head, 40);
    printf("After deleting value 40: ");
    displayForward(head);
    
    printf("\nComplexity Analysis:\n");
    printf("Delete at position: O(n)\n");
    printf("Delete by value: O(n)\n");
    printf("Space: O(1)\n");
    
    freeList(head);
    return 0;
}
