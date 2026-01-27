#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Queue {
    int* items;
    int front;
    int rear;
} Queue;

Queue* createQueue(int size) {
    Queue* q = (Queue*)malloc(sizeof(Queue));
    q->items = (int*)malloc(size * sizeof(int));
    q->front = -1;
    q->rear = -1;
    return q;
}

void enqueue(Queue* q, int val) {
    q->items[++q->rear] = val;
    if (q->front == -1) q->front = 0;
}

int dequeue(Queue* q) {
    if (q->front != -1 && q->front <= q->rear) {
        return q->items[q->front++];
    }
    return -1;
}

void findConnectedComponents(int** adjacencyMatrix, int vertices) {
    int* visited = (int*)malloc(vertices * sizeof(int));
    memset(visited, 0, vertices * sizeof(int));
    
    int component = 0;
    printf("Connected Components:\n");
    
    for (int i = 0; i < vertices; i++) {
        if (!visited[i]) {
            printf("Component %d: ", ++component);
            
            Queue* q = createQueue(vertices);
            enqueue(q, i);
            visited[i] = 1;
            
            while (q->front != -1 && q->front <= q->rear) {
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
            free(q->items);
            free(q);
        }
    }
    
    free(visited);
}

int main() {
    printf("=== Connected Components (C) ===\n\n");
    
    int vertices = 6;
    int** adjacencyMatrix = (int**)malloc(vertices * sizeof(int*));
    for (int i = 0; i < vertices; i++) {
        adjacencyMatrix[i] = (int*)malloc(vertices * sizeof(int));
        memset(adjacencyMatrix[i], 0, vertices * sizeof(int));
    }
    
    adjacencyMatrix[0][1] = adjacencyMatrix[1][0] = 1;
    adjacencyMatrix[0][2] = adjacencyMatrix[2][0] = 1;
    adjacencyMatrix[3][4] = adjacencyMatrix[4][3] = 1;
    
    printf("Graph (6 vertices):\n");
    printf("Component 1: 0-1, 0-2\n");
    printf("Component 2: 3-4\n");
    printf("Isolated: 5\n\n");
    
    findConnectedComponents(adjacencyMatrix, vertices);
    
    printf("\n=== Algorithm ===\n");
    printf("1. Initialize all vertices as unvisited\n");
    printf("2. For each unvisited vertex:\n");
    printf("   a. Start BFS/DFS from that vertex\n");
    printf("   b. Mark all reachable vertices as visited\n");
    printf("   c. This forms one connected component\n");
    printf("3. Repeat until all vertices visited\n\n");
    
    printf("=== Complexity ===\n");
    printf("Time Complexity:  O(V + E)\n");
    printf("Space Complexity: O(V)\n");
    
    return 0;
}
