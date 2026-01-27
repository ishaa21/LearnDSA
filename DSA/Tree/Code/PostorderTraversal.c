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

// Recursive postorder traversal: Left-Right-Root
void postorderRecursive(Node* root) {
    if (root == NULL) return;
    
    postorderRecursive(root->left);
    postorderRecursive(root->right);
    printf("%d ", root->data);
}

// Iterative postorder using two stacks
void postorderIterative(Node* root) {
    Node* stack1[100], * stack2[100];
    int top1 = -1, top2 = -1;
    
    stack1[++top1] = root;
    
    while (top1 >= 0) {
        Node* node = stack1[top1--];
        stack2[++top2] = node;
        
        if (node->left != NULL) stack1[++top1] = node->left;
        if (node->right != NULL) stack1[++top1] = node->right;
    }
    
    while (top2 >= 0) {
        printf("%d ", stack2[top2--]->data);
    }
}

int main() {
    printf("=== Postorder Traversal (C) ===\n\n");
    
    // Create tree
    Node* root = createNode(1);
    root->left = createNode(2);
    root->right = createNode(3);
    root->left->left = createNode(4);
    root->left->right = createNode(5);
    root->right->left = createNode(6);
    root->right->right = createNode(7);
    
    printf("Tree structure:\n");
    printf("         1\n");
    printf("        / \\\n");
    printf("       2   3\n");
    printf("      / \\ / \\\n");
    printf("     4  5 6  7\n\n");
    
    printf("Recursive Postorder (Left-Right-Root): ");
    postorderRecursive(root);
    printf("\n");
    
    printf("Iterative Postorder (two stacks):      ");
    postorderIterative(root);
    printf("\n\n");
    
    printf("=== Postorder Characteristics ===\n");
    printf("1. Left subtree → Right subtree → Root\n");
    printf("2. Root is processed last\n");
    printf("3. Useful for deleting tree\n");
    printf("4. Useful for postfix expression evaluation\n\n");
    
    printf("=== Complexity Analysis ===\n");
    printf("Time Complexity:  O(n) - visit each node once\n");
    printf("Space Complexity: O(h) - h = height (recursion/stack)\n");
    printf("                   O(n) worst case (skewed tree)\n");
    
    return 0;
}
