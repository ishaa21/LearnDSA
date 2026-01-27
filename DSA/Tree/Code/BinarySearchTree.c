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

// Insert into BST
Node* insert(Node* root, int data) {
    if (root == NULL) {
        return createNode(data);
    }
    
    if (data < root->data) {
        root->left = insert(root->left, data);
    } else if (data > root->data) {
        root->right = insert(root->right, data);
    }
    // If equal, don't insert (no duplicates)
    
    return root;
}

// Search in BST
Node* search(Node* root, int data) {
    if (root == NULL) {
        return NULL;
    }
    
    if (data == root->data) {
        return root;
    } else if (data < root->data) {
        return search(root->left, data);
    } else {
        return search(root->right, data);
    }
}

// Inorder traversal (gives sorted sequence)
void inorder(Node* root) {
    if (root == NULL) return;
    
    inorder(root->left);
    printf("%d ", root->data);
    inorder(root->right);
}

int main() {
    printf("=== Binary Search Tree (C) ===\n\n");
    
    Node* root = NULL;
    
    printf("Inserting: 50, 30, 70, 20, 40, 60, 80\n");
    root = insert(root, 50);
    root = insert(root, 30);
    root = insert(root, 70);
    root = insert(root, 20);
    root = insert(root, 40);
    root = insert(root, 60);
    root = insert(root, 80);
    
    printf("Inorder Traversal (Sorted): ");
    inorder(root);
    printf("\n\n");
    
    printf("Searching for 40: %s\n", search(root, 40) != NULL ? "Found" : "Not Found");
    printf("Searching for 25: %s\n\n", search(root, 25) != NULL ? "Found" : "Not Found");
    
    printf("=== BST Properties ===\n");
    printf("1. Left subtree < Root < Right subtree\n");
    printf("2. All nodes in left subtree < root\n");
    printf("3. All nodes in right subtree > root\n");
    printf("4. Inorder traversal gives sorted sequence\n");
    printf("5. No duplicate values\n\n");
    
    printf("=== BST Structure ===\n");
    printf("        50\n");
    printf("       /  \\\n");
    printf("      30   70\n");
    printf("     / \\  / \\\n");
    printf("    20 40 60 80\n\n");
    
    printf("=== Operations Complexity ===\n");
    printf("Average Case (Balanced):\n");
    printf("  Search:   O(log n)\n");
    printf("  Insert:   O(log n)\n");
    printf("  Delete:   O(log n)\n\n");
    
    printf("Worst Case (Skewed):\n");
    printf("  Search:   O(n)\n");
    printf("  Insert:   O(n)\n");
    printf("  Delete:   O(n)\n");
    
    return 0;
}
