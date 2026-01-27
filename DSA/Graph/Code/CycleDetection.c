#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int hasCycleDFS(int** adjacencyMatrix, int vertices, int u, int parent, int* visited) {
    visited[u] = 1;
    
    for (int v = 0; v < vertices; v++) {
        if (adjacencyMatrix[u][v]) {
            if (!visited[v]) {
                if (hasCycleDFS(adjacencyMatrix, vertices, v, u, visited)) {
                    return 1;
                }
            } else if (v != parent) {
                return 1;
            }
        }
    }
    
    return 0;
}

int detectCycle(int** adjacencyMatrix, int vertices) {
    int* visited = (int*)malloc(vertices * sizeof(int));
    memset(visited, 0, vertices * sizeof(int));
    
    for (int i = 0; i < vertices; i++) {
        if (!visited[i]) {
            if (hasCycleDFS(adjacencyMatrix, vertices, i, -1, visited)) {
                free(visited);
                return 1;
            }
        }
    }
    
    free(visited);
    return 0;
}

int main() {
    printf("=== Cycle Detection (C) ===\n\n");
    
    printf("Graph 1 (With Cycle):\n");
    int vertices1 = 4;
    int** adj1 = (int**)malloc(vertices1 * sizeof(int*));
    for (int i = 0; i < vertices1; i++) {
        adj1[i] = (int*)malloc(vertices1 * sizeof(int));
        memset(adj1[i], 0, vertices1 * sizeof(int));
    }
    
    adj1[0][1] = adj1[1][0] = 1;
    adj1[1][2] = adj1[2][1] = 1;
    adj1[2][3] = adj1[3][2] = 1;
    adj1[3][0] = adj1[0][3] = 1;
    
    printf("Edges: 0-1, 1-2, 2-3, 3-0 (forms a cycle)\n");
    printf("Cycle Detected: %s\n\n", detectCycle(adj1, vertices1) ? "Yes" : "No");
    
    printf("Graph 2 (Acyclic):\n");
    int vertices2 = 4;
    int** adj2 = (int**)malloc(vertices2 * sizeof(int*));
    for (int i = 0; i < vertices2; i++) {
        adj2[i] = (int*)malloc(vertices2 * sizeof(int));
        memset(adj2[i], 0, vertices2 * sizeof(int));
    }
    
    adj2[0][1] = adj2[1][0] = 1;
    adj2[1][2] = adj2[2][1] = 1;
    adj2[2][3] = adj2[3][2] = 1;
    
    printf("Edges: 0-1, 1-2, 2-3 (no cycle)\n");
    printf("Cycle Detected: %s\n\n", detectCycle(adj2, vertices2) ? "Yes" : "No");
    
    printf("=== Algorithm ===\n");
    printf("1. Use DFS to traverse graph\n");
    printf("2. For each vertex, track parent\n");
    printf("3. If visited neighbor is not parent = cycle found\n");
    printf("4. Continue for all components\n\n");
    
    printf("=== Complexity ===\n");
    printf("Time Complexity:  O(V + E)\n");
    printf("Space Complexity: O(V)\n");
    
    return 0;
}
