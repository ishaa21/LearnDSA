#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node* left;
    struct Node* right;
} Node;

typedef struct {
    int diameter;
} Result;

Node* createNode(int data) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->data = data;
    node->left = NULL;
    node->right = NULL;
    return node;
}

// Get height of tree
int getHeight(Node* root) {
    if (root == NULL) {
        return 0;
    }
    
    int leftHeight = getHeight(root->left);
    int rightHeight = getHeight(root->right);
    
    return (leftHeight > rightHeight ? leftHeight : rightHeight) + 1;
}

// Naive approach: Calculate diameter at each node
int getDiameterNaive(Node* root) {
    if (root == NULL) {
        return 0;
    }
    
    int leftHeight = getHeight(root->left);
    int rightHeight = getHeight(root->right);
    int diameterThroughRoot = leftHeight + rightHeight + 1;
    
    int leftDiameter = getDiameterNaive(root->left);
    int rightDiameter = getDiameterNaive(root->right);
    
    int maxDiameter = diameterThroughRoot;
    if (leftDiameter > maxDiameter) maxDiameter = leftDiameter;
    if (rightDiameter > maxDiameter) maxDiameter = rightDiameter;
    
    return maxDiameter;
}

// Optimized approach: Track diameter while computing height
int getDiameterOptimized(Node* root, int* diameter) {
    if (root == NULL) {
        return 0;
    }
    
    int leftHeight = getDiameterOptimized(root->left, diameter);
    int rightHeight = getDiameterOptimized(root->right, diameter);
    
    int currentDiameter = leftHeight + rightHeight + 1;
    if (currentDiameter > *diameter) {
        *diameter = currentDiameter;
    }
    
    int height = (leftHeight > rightHeight ? leftHeight : rightHeight) + 1;
    return height;
}

int main() {
    printf("=== Diameter of Tree (C) ===\n\n");
    
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
    
    printf("Diameter (Naive approach): %d\n", getDiameterNaive(root));
    
    int diameter = 0;
    getDiameterOptimized(root, &diameter);
    printf("Diameter (Optimized approach): %d\n\n", diameter);
    
    printf("=== Diameter Definition ===\n");
    printf("Diameter: Longest path between any two nodes in tree\n");
    printf("Includes: Number of edges in the path\n\n");
    
    printf("Possible cases for diameter:\n");
    printf("1. Path passes through root\n");
    printf("   diameter = leftHeight + rightHeight + 1\n");
    printf("2. Path entirely in left subtree\n");
    printf("3. Path entirely in right subtree\n\n");
    
    printf("=== Complexity Analysis ===\n");
    printf("Naive Approach:\n");
    printf("  Time Complexity:  O(n²) - getHeight called for each node\n");
    printf("  Space Complexity: O(h) - recursion stack\n\n");
    
    printf("Optimized Approach:\n");
    printf("  Time Complexity:  O(n) - single pass\n");
    printf("  Space Complexity: O(h) - recursion stack\n");
    
    return 0;
}
