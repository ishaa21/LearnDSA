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

// Recursive inorder traversal: Left-Root-Right
void inorderRecursive(Node* root) {
    if (root == NULL) return;
    
    inorderRecursive(root->left);
    printf("%d ", root->data);
    inorderRecursive(root->right);
}

// Iterative inorder traversal using stack
typedef struct {
    Node* data[100];
    int top;
} Stack;

Stack* createStack() {
    Stack* stack = (Stack*)malloc(sizeof(Stack));
    stack->top = -1;
    return stack;
}

void push(Stack* stack, Node* node) {
    if (stack->top < 99) {
        stack->data[++stack->top] = node;
    }
}

Node* pop(Stack* stack) {
    if (stack->top >= 0) {
        return stack->data[stack->top--];
    }
    return NULL;
}

int isEmpty(Stack* stack) {
    return stack->top == -1;
}

void inorderIterative(Node* root) {
    Stack* stack = createStack();
    Node* current = root;
    
    while (current != NULL || !isEmpty(stack)) {
        while (current != NULL) {
            push(stack, current);
            current = current->left;
        }
        
        current = pop(stack);
        printf("%d ", current->data);
        current = current->right;
    }
}

int main() {
    printf("=== Inorder Traversal (C) ===\n\n");
    
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
    
    printf("Recursive Inorder (Left-Root-Right): ");
    inorderRecursive(root);
    printf("\n");
    
    printf("Iterative Inorder (using stack):     ");
    inorderIterative(root);
    printf("\n\n");
    
    printf("=== Inorder Characteristics ===\n");
    printf("1. Left subtree → Root → Right subtree\n");
    printf("2. For BST: Produces sorted sequence\n");
    printf("3. Recursive approach: Clean and simple\n");
    printf("4. Iterative approach: Explicit stack management\n\n");
    
    printf("=== Complexity Analysis ===\n");
    printf("Time Complexity:  O(n) - visit each node once\n");
    printf("Space Complexity: O(h) - h = height (recursion/stack)\n");
    printf("                   O(n) worst case (skewed tree)\n");
    
    return 0;
}
