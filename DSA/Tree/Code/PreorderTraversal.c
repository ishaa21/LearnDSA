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

// Recursive preorder traversal: Root-Left-Right
void preorderRecursive(Node* root) {
    if (root == NULL) return;
    
    printf("%d ", root->data);
    preorderRecursive(root->left);
    preorderRecursive(root->right);
}

// Iterative preorder traversal using stack
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

void preorderIterative(Node* root) {
    Stack* stack = createStack();
    push(stack, root);
    
    while (!isEmpty(stack)) {
        Node* node = pop(stack);
        printf("%d ", node->data);
        
        if (node->right != NULL) {
            push(stack, node->right);
        }
        if (node->left != NULL) {
            push(stack, node->left);
        }
    }
}

int main() {
    printf("=== Preorder Traversal (C) ===\n\n");
    
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
    
    printf("Recursive Preorder (Root-Left-Right): ");
    preorderRecursive(root);
    printf("\n");
    
    printf("Iterative Preorder (using stack):     ");
    preorderIterative(root);
    printf("\n\n");
    
    printf("=== Preorder Characteristics ===\n");
    printf("1. Root → Left subtree → Right subtree\n");
    printf("2. Root is processed first\n");
    printf("3. Useful for creating copy of tree\n");
    printf("4. Useful for prefix expression evaluation\n\n");
    
    printf("=== Complexity Analysis ===\n");
    printf("Time Complexity:  O(n) - visit each node once\n");
    printf("Space Complexity: O(h) - h = height (recursion/stack)\n");
    printf("                   O(n) worst case (skewed tree)\n");
    
    return 0;
}
