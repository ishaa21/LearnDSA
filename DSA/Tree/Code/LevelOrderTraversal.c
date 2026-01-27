#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node* left;
    struct Node* right;
} Node;

typedef struct {
    Node* data[100];
    int front;
    int rear;
} Queue;

Node* createNode(int data) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->data = data;
    node->left = NULL;
    node->right = NULL;
    return node;
}

Queue* createQueue() {
    Queue* q = (Queue*)malloc(sizeof(Queue));
    q->front = -1;
    q->rear = -1;
    return q;
}

void enqueue(Queue* q, Node* node) {
    if (q->rear < 99) {
        q->data[++q->rear] = node;
        if (q->front == -1) q->front = 0;
    }
}

Node* dequeue(Queue* q) {
    if (q->front <= q->rear) {
        return q->data[q->front++];
    }
    return NULL;
}

int isEmpty(Queue* q) {
    return q->front > q->rear;
}

// Level Order Traversal (BFS)
void levelOrderTraversal(Node* root) {
    Queue* q = createQueue();
    enqueue(q, root);
    
    while (!isEmpty(q)) {
        Node* node = dequeue(q);
        printf("%d ", node->data);
        
        if (node->left != NULL) {
            enqueue(q, node->left);
        }
        if (node->right != NULL) {
            enqueue(q, node->right);
        }
    }
}

int main() {
    printf("=== Level Order Traversal (C) ===\n\n");
    
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
    
    printf("Level Order Traversal (BFS): ");
    levelOrderTraversal(root);
    printf("\n\n");
    
    printf("=== Level Order Characteristics ===\n");
    printf("1. Visit all nodes at level k before level k+1\n");
    printf("2. Also called Breadth-First Search (BFS)\n");
    printf("3. Uses queue data structure\n");
    printf("4. Useful for finding shortest path in trees\n\n");
    
    printf("=== Complexity Analysis ===\n");
    printf("Time Complexity:  O(n) - visit each node once\n");
    printf("Space Complexity: O(w) - w = maximum width (max nodes at any level)\n");
    printf("                   O(n) in worst case\n");
    
    return 0;
}
