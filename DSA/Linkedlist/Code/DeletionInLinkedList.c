#include <stdio.h>
#include <stdlib.h>

// Deletion in Linked List in C
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

void deleteAtPosition(Node** head, int pos) {
    if (*head == NULL) return;
    
    if (pos == 1) {
        Node* temp = *head;
        *head = (*head)->next;
        free(temp);
        return;
    }
    
    Node* temp = *head;
    for (int i = 1; i < pos - 1 && temp != NULL; i++)
        temp = temp->next;
    
    if (temp == NULL || temp->next == NULL) return;
    
    Node* toDelete = temp->next;
    temp->next = toDelete->next;
    free(toDelete);
}

void deleteByValue(Node** head, int value) {
    if (*head == NULL) return;
    
    if ((*head)->data == value) {
        Node* temp = *head;
        *head = (*head)->next;
        free(temp);
        return;
    }
    
    Node* temp = *head;
    while (temp->next != NULL && temp->next->data != value)
        temp = temp->next;
    
    if (temp->next != NULL) {
        Node* toDelete = temp->next;
        temp->next = toDelete->next;
        free(toDelete);
    }
}

void deleteAllOccurrences(Node** head, int value) {
    while (*head != NULL && (*head)->data == value) {
        Node* temp = *head;
        *head = (*head)->next;
        free(temp);
    }
    
    if (*head == NULL) return;
    
    Node* temp = *head;
    while (temp->next != NULL) {
        if (temp->next->data == value) {
            Node* toDelete = temp->next;
            temp->next = toDelete->next;
            free(toDelete);
        } else {
            temp = temp->next;
        }
    }
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
    printf("=== Deletion in Linked List ===\n\n");
    
    // Test 1: Delete at position
    Node* head = NULL;
    for (int i = 1; i <= 5; i++) {
        Node* newNode = createNode(i * 10);
        if (head == NULL) head = newNode;
        else {
            Node* temp = head;
            while (temp->next != NULL) temp = temp->next;
            temp->next = newNode;
        }
    }
    
    printf("Original list: ");
    display(head);
    
    deleteAtPosition(&head, 2);
    printf("After deleting position 2: ");
    display(head);
    
    // Test 2: Delete by value
    deleteByValue(&head, 40);
    printf("After deleting value 40: ");
    display(head);
    
    // Test 3: Delete all occurrences
    head->next->next->data = 10;
    deleteAllOccurrences(&head, 10);
    printf("After deleting all 10s: ");
    display(head);
    
    printf("\nComplexity Analysis:\n");
    printf("Delete at position: O(n)\n");
    printf("Delete by value: O(n)\n");
    printf("Delete all occurrences: O(n)\n");
    printf("Space: O(1)\n");
    
    freeList(head);
    return 0;
}
