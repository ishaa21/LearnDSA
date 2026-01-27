#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node* left;
    struct Node* right;
} Node;

Node* createNode(int data) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->data = data;
    node->left = NULL;
    node->right = NULL;
    return node;
}

// Recursive insertion
Node* insertRecursive(Node* root, int data) {
    if (root == NULL) {
        return createNode(data);
    }
    
    if (data < root->data) {
        root->left = insertRecursive(root->left, data);
    } else if (data > root->data) {
        root->right = insertRecursive(root->right, data);
    }
    
    return root;
}

// Iterative insertion
Node* insertIterative(Node* root, int data) {
    Node* newNode = createNode(data);
    
    if (root == NULL) {
        return newNode;
    }
    
    Node* current = root;
    Node* parent = NULL;
    
    while (current != NULL) {
        parent = current;
        if (data < current->data) {
            current = current->left;
        } else if (data > current->data) {
            current = current->right;
        } else {
            return root; // Duplicate, don't insert
        }
    }
    
    if (data < parent->data) {
        parent->left = newNode;
    } else {
        parent->right = newNode;
    }
    
    return root;
}

void inorder(Node* root) {
    if (root == NULL) return;
    inorder(root->left);
    printf("%d ", root->data);
    inorder(root->right);
}

int main() {
    printf("=== Insertion in BST (C) ===\n\n");
    
    Node* root1 = NULL;
    printf("Recursive Insertion:\n");
    root1 = insertRecursive(root1, 50);
    root1 = insertRecursive(root1, 30);
    root1 = insertRecursive(root1, 70);
    root1 = insertRecursive(root1, 20);
    root1 = insertRecursive(root1, 40);
    root1 = insertRecursive(root1, 60);
    root1 = insertRecursive(root1, 80);
    printf("Inorder: ");
    inorder(root1);
    printf("\n\n");
    
    Node* root2 = NULL;
    printf("Iterative Insertion:\n");
    root2 = insertIterative(root2, 50);
    root2 = insertIterative(root2, 30);
    root2 = insertIterative(root2, 70);
    root2 = insertIterative(root2, 20);
    root2 = insertIterative(root2, 40);
    root2 = insertIterative(root2, 60);
    root2 = insertIterative(root2, 80);
    printf("Inorder: ");
    inorder(root2);
    printf("\n\n");
    
    printf("=== Insertion Steps ===\n");
    printf("1. Start at root\n");
    printf("2. If data < current, go left\n");
    printf("3. If data > current, go right\n");
    printf("4. If NULL found, insert new node\n");
    printf("5. If duplicate, don't insert\n\n");
    
    printf("=== Insertion Complexity ===\n");
    printf("Time Complexity:  O(log n) avg, O(n) worst\n");
    printf("Space Complexity: O(h) for recursion\n");
    printf("                  O(1) for iteration\n");
    
    return 0;
}
