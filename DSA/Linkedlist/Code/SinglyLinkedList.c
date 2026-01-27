#include <stdio.h>
#include <stdlib.h>

// Singly Linked List in C
// Complete implementation of singly linked list operations

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

Node* insertAtBeginning(Node* head, int data) {
    Node* newNode = createNode(data);
    newNode->next = head;
    return newNode;
}

Node* insertAtEnd(Node* head, int data) {
    Node* newNode = createNode(data);
    if (head == NULL) return newNode;
    
    Node* temp = head;
    while (temp->next != NULL)
        temp = temp->next;
    temp->next = newNode;
    return head;
}

Node* insertAtPosition(Node* head, int data, int pos) {
    if (pos == 0) return insertAtBeginning(head, data);
    
    Node* temp = head;
    for (int i = 0; i < pos - 1 && temp != NULL; i++)
        temp = temp->next;
    
    if (temp == NULL) return head;
    
    Node* newNode = createNode(data);
    newNode->next = temp->next;
    temp->next = newNode;
    return head;
}

Node* deleteNode(Node* head, int key) {
    if (head == NULL) return NULL;
    
    if (head->data == key) {
        Node* temp = head;
        head = head->next;
        free(temp);
        return head;
    }
    
    Node* temp = head;
    while (temp->next != NULL && temp->next->data != key)
        temp = temp->next;
    
    if (temp->next != NULL) {
        Node* nodeToDelete = temp->next;
        temp->next = nodeToDelete->next;
        free(nodeToDelete);
    }
    
    return head;
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
    
    printf("=== Singly Linked List Operations ===\n\n");
    
    // Insert at end
    head = insertAtEnd(head, 10);
    head = insertAtEnd(head, 20);
    head = insertAtEnd(head, 30);
    head = insertAtEnd(head, 40);
    
    printf("Initial List: ");
    display(head);
    
    // Insert at beginning
    head = insertAtBeginning(head, 5);
    printf("After inserting 5 at beginning: ");
    display(head);
    
    // Insert at position
    head = insertAtPosition(head, 15, 2);
    printf("After inserting 15 at position 2: ");
    display(head);
    
    // Delete node
    head = deleteNode(head, 15);
    printf("After deleting 15: ");
    display(head);
    
    head = deleteNode(head, 5);
    printf("After deleting 5: ");
    display(head);
    
    head = deleteNode(head, 40);
    printf("After deleting 40: ");
    display(head);
    
    printf("\nComplexity Analysis:\n");
    printf("Insert at beginning: O(1)\n");
    printf("Insert at end: O(n)\n");
    printf("Insert at position: O(n)\n");
    printf("Delete: O(n)\n");
    printf("Search: O(n)\n");
    printf("Space: O(n)\n");
    
    freeList(head);
    return 0;
}
