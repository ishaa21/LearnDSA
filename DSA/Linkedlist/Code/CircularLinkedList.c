#include <stdio.h>
#include <stdlib.h>

// Circular Linked List in C
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

void insertAtBeginning(Node** head, int data) {
    Node* newNode = createNode(data);
    if (*head == NULL) {
        newNode->next = newNode;
        *head = newNode;
        return;
    }
    
    Node* temp = *head;
    while (temp->next != *head)
        temp = temp->next;
    
    newNode->next = *head;
    temp->next = newNode;
    *head = newNode;
}

void insertAtEnd(Node** head, int data) {
    Node* newNode = createNode(data);
    if (*head == NULL) {
        newNode->next = newNode;
        *head = newNode;
        return;
    }
    
    Node* temp = *head;
    while (temp->next != *head)
        temp = temp->next;
    
    temp->next = newNode;
    newNode->next = *head;
}

void display(Node* head) {
    if (head == NULL) return;
    
    Node* temp = head;
    do {
        printf("%d -> ", temp->data);
        temp = temp->next;
    } while (temp != head);
    printf("(back to %d)\n", head->data);
}

void freeList(Node* head) {
    if (head == NULL) return;
    
    Node* temp = head->next;
    while (temp != head) {
        Node* toDelete = temp;
        temp = temp->next;
        free(toDelete);
    }
    free(head);
}

int main() {
    Node* head = NULL;
    
    printf("=== Circular Linked List ===\n\n");
    
    insertAtEnd(&head, 10);
    insertAtEnd(&head, 20);
    insertAtEnd(&head, 30);
    
    printf("List: ");
    display(head);
    
    insertAtBeginning(&head, 5);
    printf("After inserting 5 at beginning: ");
    display(head);
    
    insertAtEnd(&head, 40);
    printf("After inserting 40 at end: ");
    display(head);
    
    printf("\nComplexity Analysis:\n");
    printf("Insert at beginning: O(n)\n");
    printf("Insert at end: O(n)\n");
    printf("Delete: O(n)\n");
    printf("Space: O(n)\n");
    
    freeList(head);
    return 0;
}
