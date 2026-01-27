#include <stdio.h>
#include <stdlib.h>

// Reverse Linked List in C
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

// Iterative reversal
Node* reverseIterative(Node* head) {
    Node* prev = NULL;
    Node* curr = head;
    Node* next = NULL;
    
    while (curr != NULL) {
        next = curr->next;
        curr->next = prev;
        prev = curr;
        curr = next;
    }
    
    return prev;
}

// Recursive reversal
Node* reverseRecursive(Node* head) {
    if (head == NULL || head->next == NULL)
        return head;
    
    Node* newHead = reverseRecursive(head->next);
    head->next->next = head;
    head->next = NULL;
    
    return newHead;
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
    printf("=== Reverse Linked List ===\n\n");
    
    // Create list
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
    
    // Test 1: Iterative reverse
    head = reverseIterative(head);
    printf("After iterative reverse: ");
    display(head);
    
    // Create another list for recursive test
    head = NULL;
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
    
    // Test 2: Recursive reverse
    head = reverseRecursive(head);
    printf("After recursive reverse: ");
    display(head);
    
    printf("\nComplexity Analysis:\n");
    printf("Iterative reverse: O(n) time, O(1) space\n");
    printf("Recursive reverse: O(n) time, O(n) space (call stack)\n");
    
    freeList(head);
    return 0;
}
