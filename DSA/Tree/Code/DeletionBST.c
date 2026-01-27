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

Node* findMin(Node* node) {
    while (node->left != NULL) {
        node = node->left;
    }
    return node;
}

Node* deleteNode(Node* root, int data) {
    if (root == NULL) {
        return NULL;
    }
    
    if (data < root->data) {
        root->left = deleteNode(root->left, data);
    } else if (data > root->data) {
        root->right = deleteNode(root->right, data);
    } else {
        // Case 1: Leaf node
        if (root->left == NULL && root->right == NULL) {
            free(root);
            return NULL;
        }
        
        // Case 2: One child
        if (root->left == NULL) {
            Node* temp = root->right;
            free(root);
            return temp;
        }
        if (root->right == NULL) {
            Node* temp = root->left;
            free(root);
            return temp;
        }
        
        // Case 3: Two children
        Node* successor = findMin(root->right);
        root->data = successor->data;
        root->right = deleteNode(root->right, successor->data);
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
    printf("=== Deletion in BST (C) ===\n\n");
    
    Node* root = NULL;
    root = createNode(50);
    root->left = createNode(30);
    root->right = createNode(70);
    root->left->left = createNode(20);
    root->left->right = createNode(40);
    root->right->left = createNode(60);
    root->right->right = createNode(80);
    
    printf("Original Tree (Inorder): ");
    inorder(root);
    printf("\n\n");
    
    printf("Delete Leaf (20):\n");
    root = deleteNode(root, 20);
    inorder(root);
    printf("\n\n");
    
    printf("Delete Node with One Child (30):\n");
    root = deleteNode(root, 30);
    inorder(root);
    printf("\n\n");
    
    printf("Delete Node with Two Children (50):\n");
    root = deleteNode(root, 50);
    inorder(root);
    printf("\n\n");
    
    printf("=== Deletion Cases ===\n");
    printf("Case 1: Leaf Node\n");
    printf("  - Simply remove the node\n");
    printf("  - Update parent's pointer to NULL\n\n");
    
    printf("Case 2: Node with One Child\n");
    printf("  - Replace node with its child\n");
    printf("  - Update parent's pointer\n\n");
    
    printf("Case 3: Node with Two Children\n");
    printf("  - Find inorder successor (min in right subtree)\n");
    printf("  - Replace node's data with successor's data\n");
    printf("  - Delete successor node\n\n");
    
    printf("=== Deletion Complexity ===\n");
    printf("Time Complexity:  O(log n) avg, O(n) worst\n");
    printf("Space Complexity: O(h) for recursion\n");
    
    return 0;
}
