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

// Calculate height of tree
int getHeight(Node* root) {
    if (root == NULL) {
        return 0;
    }
    
    int leftHeight = getHeight(root->left);
    int rightHeight = getHeight(root->right);
    
    int maxHeight = leftHeight > rightHeight ? leftHeight : rightHeight;
    return maxHeight + 1;
}

// Calculate depth (distance from root)
int getDepth(Node* root, Node* target, int depth) {
    if (root == NULL) {
        return -1;
    }
    
    if (root == target) {
        return depth;
    }
    
    int leftDepth = getDepth(root->left, target, depth + 1);
    if (leftDepth != -1) return leftDepth;
    
    return getDepth(root->right, target, depth + 1);
}

// Count total nodes
int countNodes(Node* root) {
    if (root == NULL) {
        return 0;
    }
    return 1 + countNodes(root->left) + countNodes(root->right);
}

int main() {
    printf("=== Height of Tree (C) ===\n\n");
    
    // Create tree
    Node* root = createNode(1);
    root->left = createNode(2);
    root->right = createNode(3);
    root->left->left = createNode(4);
    root->left->right = createNode(5);
    root->right->right = createNode(6);
    root->right->right->right = createNode(7);
    
    printf("Tree structure:\n");
    printf("         1\n");
    printf("        / \\\n");
    printf("       2   3\n");
    printf("      / \\   \\\n");
    printf("     4   5   6\n");
    printf("           \\\n");
    printf("            7\n\n");
    
    printf("Height of tree: %d\n", getHeight(root));
    printf("Number of nodes: %d\n\n", countNodes(root));
    
    printf("=== Height Analysis ===\n");
    printf("Minimum height of balanced tree with n nodes:\n");
    printf("  h_min = ceil(log₂(n+1)) - 1\n");
    printf("  h_min = ceil(log₂(7+1)) - 1 = 2\n\n");
    
    printf("Maximum height of skewed tree:\n");
    printf("  h_max = n - 1 (for n nodes)\n\n");
    
    printf("=== Height Definition ===\n");
    printf("Height of node: Distance from node to farthest leaf\n");
    printf("Height of tree: Height of root node\n");
    printf("Height of NULL: 0\n");
    printf("Height of leaf: 1\n\n");
    
    printf("=== Complexity Analysis ===\n");
    printf("Time Complexity:  O(n) - visit each node once\n");
    printf("Space Complexity: O(h) - h = height (recursion stack)\n");
    
    return 0;
}
