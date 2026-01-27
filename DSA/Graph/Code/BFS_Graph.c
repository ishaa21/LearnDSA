#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Queue {
    int* items;
    int front;
    int rear;
    int size;
} Queue;

Queue* createQueue(int size) {
    Queue* q = (Queue*)malloc(sizeof(Queue));
    q->items = (int*)malloc(size * sizeof(int));
    q->front = -1;
    q->rear = -1;
    q->size = size;
    return q;
}

void enqueue(Queue* q, int val) {
    if (q->rear < q->size - 1) {
        q->items[++q->rear] = val;
        if (q->front == -1) q->front = 0;
    }
}

int dequeue(Queue* q) {
    if (q->front != -1 && q->front <= q->rear) {
        return q->items[q->front++];
    }
    return -1;
}

int isEmpty(Queue* q) {
    return q->front == -1 || q->front > q->rear;
}

void bfs(int** adjacencyMatrix, int vertices, int start) {
    int* visited = (int*)malloc(vertices * sizeof(int));
    memset(visited, 0, vertices * sizeof(int));
    
    Queue* q = createQueue(vertices);
    visited[start] = 1;
    enqueue(q, start);
    
    printf("BFS Traversal: ");
    while (!isEmpty(q)) {
        int u = dequeue(q);
        printf("%d ", u);
        
        for (int v = 0; v < vertices; v++) {
            if (adjacencyMatrix[u][v] && !visited[v]) {
                visited[v] = 1;
                enqueue(q, v);
            }
        }
    }
    printf("\n");
    
    free(visited);
    free(q->items);
    free(q);
}

int main() {
    printf("=== BFS in Graph (C) ===\n\n");
    
    int vertices = 5;
    int** adjacencyMatrix = (int**)malloc(vertices * sizeof(int*));
    for (int i = 0; i < vertices; i++) {
        adjacencyMatrix[i] = (int*)malloc(vertices * sizeof(int));
        memset(adjacencyMatrix[i], 0, vertices * sizeof(int));
    }
    
    adjacencyMatrix[0][1] = adjacencyMatrix[1][0] = 1;
    adjacencyMatrix[0][4] = adjacencyMatrix[4][0] = 1;
    adjacencyMatrix[1][2] = adjacencyMatrix[2][1] = 1;
    adjacencyMatrix[1][3] = adjacencyMatrix[3][1] = 1;
    adjacencyMatrix[1][4] = adjacencyMatrix[4][1] = 1;
    adjacencyMatrix[2][3] = adjacencyMatrix[3][2] = 1;
    adjacencyMatrix[3][4] = adjacencyMatrix[4][3] = 1;
    
    printf("Graph (5 vertices, 7 edges)\n");
    printf("Edges: 0-1, 0-4, 1-2, 1-3, 1-4, 2-3, 3-4\n\n");
    
    bfs(adjacencyMatrix, vertices, 0);
    
    printf("\n=== BFS Algorithm ===\n");
    printf("1. Initialize queue with start vertex\n");
    printf("2. Mark start vertex as visited\n");
    printf("3. While queue is not empty:\n");
    printf("   a. Dequeue and process vertex\n");
    printf("   b. For all unvisited neighbors:\n");
    printf("      - Mark as visited\n");
    printf("      - Enqueue the neighbor\n");
    printf("4. Continue until queue is empty\n\n");
    
    printf("=== BFS Complexity ===\n");
    printf("Time Complexity:  O(V + E)\n");
    printf("Space Complexity: O(V)\n");
    printf("Applications: Shortest path, Level-order, Connected components\n");
    
    return 0;
}
