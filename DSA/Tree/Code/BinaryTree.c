#include <stdio.h>
#include <stdlib.h>

// Binary Tree Node
typedef struct Node {
    int data;
    struct Node* left;
    struct Node* right;
} Node;

// Create a new node
Node* createNode(int data) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->data = data;
    node->left = NULL;
    node->right = NULL;
    return node;
}

// Insert node in binary tree
Node* insertBT(Node* root, int data) {
    if (root == NULL) {
        return createNode(data);
    }
    
    if (root->left == NULL) {
        root->left = insertBT(root->left, data);
    } else if (root->right == NULL) {
        root->right = insertBT(root->right, data);
    } else {
        root->left = insertBT(root->left, data);
    }
    
    return root;
}

// Inorder traversal
void inorder(Node* root) {
    if (root == NULL) return;
    
    inorder(root->left);
    printf("%d ", root->data);
    inorder(root->right);
}

// Preorder traversal
void preorder(Node* root) {
    if (root == NULL) return;
    
    printf("%d ", root->data);
    preorder(root->left);
    preorder(root->right);
}

// Postorder traversal
void postorder(Node* root) {
    if (root == NULL) return;
    
    postorder(root->left);
    postorder(root->right);
    printf("%d ", root->data);
}

// Search element
Node* search(Node* root, int data) {
    if (root == NULL) {
        return NULL;
    }
    
    if (root->data == data) {
        return root;
    }
    
    Node* left = search(root->left, data);
    if (left != NULL) return left;
    
    return search(root->right, data);
}

int main() {
    printf("=== Binary Tree (C) ===\n\n");
    
    // Create binary tree
    Node* root = NULL;
    printf("Inserting elements: 1, 2, 3, 4, 5, 6, 7\n");
    root = insertBT(root, 1);
    root = insertBT(root, 2);
    root = insertBT(root, 3);
    root = insertBT(root, 4);
    root = insertBT(root, 5);
    root = insertBT(root, 6);
    root = insertBT(root, 7);
    
    printf("\nInorder Traversal (Left-Root-Right): ");
    inorder(root);
    printf("\n");
    
    printf("Preorder Traversal (Root-Left-Right): ");
    preorder(root);
    printf("\n");
    
    printf("Postorder Traversal (Left-Right-Root): ");
    postorder(root);
    printf("\n\n");
    
    // Search operations
    printf("Searching for 5: %s\n", search(root, 5) != NULL ? "Found" : "Not Found");
    printf("Searching for 10: %s\n\n", search(root, 10) != NULL ? "Found" : "Not Found");
    
    printf("=== Binary Tree Structure ===\n");
    printf("Tree structure (array representation):\n");
    printf("         1\n");
    printf("        / \\\n");
    printf("       2   3\n");
    printf("      / \\ / \\\n");
    printf("     4  5 6  7\n\n");
    
    printf("=== Operations Complexity ===\n");
    printf("Insert:     O(n) in worst case\n");
    printf("Search:     O(n) in worst case\n");
    printf("Traversal:  O(n) for all traversals\n");
    printf("Space:      O(h) where h = height (recursion stack)\n");
    
    return 0;
}
