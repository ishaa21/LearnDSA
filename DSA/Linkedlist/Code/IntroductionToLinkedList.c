#include <stdio.h>
#include <stdlib.h>

// Introduction to Linked List in C
// Basic structure and node operations

typedef struct Node {
    int data;
    struct Node* next;
} Node;

// Create a new node
Node* createNode(int data) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->data = data;
    node->next = NULL;
    return node;
}

// Insert at beginning
Node* insertAtBeginning(Node* head, int data) {
    Node* newNode = createNode(data);
    newNode->next = head;
    return newNode;
}

// Insert at end
Node* insertAtEnd(Node* head, int data) {
    Node* newNode = createNode(data);
    
    if (head == NULL)
        return newNode;
    
    Node* temp = head;
    while (temp->next != NULL)
        temp = temp->next;
    
    temp->next = newNode;
    return head;
}

// Display linked list
void display(Node* head) {
    Node* temp = head;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

// Count nodes
int countNodes(Node* head) {
    int count = 0;
    Node* temp = head;
    while (temp != NULL) {
        count++;
        temp = temp->next;
    }
    return count;
}

// Search element
int search(Node* head, int key) {
    Node* temp = head;
    while (temp != NULL) {
        if (temp->data == key)
            return 1;
        temp = temp->next;
    }
    return 0;
}

// Free memory
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
    
    // Create linked list: 10 -> 20 -> 30 -> NULL
    head = insertAtEnd(head, 10);
    head = insertAtEnd(head, 20);
    head = insertAtEnd(head, 30);
    
    printf("Linked List: ");
    display(head);
    
    // Insert at beginning
    head = insertAtBeginning(head, 5);
    printf("After inserting 5 at beginning: ");
    display(head);
    
    // Insert at end
    head = insertAtEnd(head, 40);
    printf("After inserting 40 at end: ");
    display(head);
    
    // Count nodes
    printf("Number of nodes: %d\n", countNodes(head));
    
    // Search
    printf("Search 20: %s\n", search(head, 20) ? "Found" : "Not Found");
    printf("Search 50: %s\n", search(head, 50) ? "Found" : "Not Found");
    
    printf("\nComplexity Analysis:\n");
    printf("Create Node: O(1)\n");
    printf("Insert at beginning: O(1)\n");
    printf("Insert at end: O(n)\n");
    printf("Search: O(n)\n");
    printf("Display/Traverse: O(n)\n");
    printf("Space: O(n)\n");
    
    freeList(head);
    return 0;
}
