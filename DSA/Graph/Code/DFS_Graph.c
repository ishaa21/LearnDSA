#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void dfs(int** adjacencyMatrix, int vertices, int u, int* visited) {
    visited[u] = 1;
    printf("%d ", u);
    
    for (int v = 0; v < vertices; v++) {
        if (adjacencyMatrix[u][v] && !visited[v]) {
            dfs(adjacencyMatrix, vertices, v, visited);
        }
    }
}

void dfsIterative(int** adjacencyMatrix, int vertices, int start) {
    int* visited = (int*)malloc(vertices * sizeof(int));
    memset(visited, 0, vertices * sizeof(int));
    
    int* stack = (int*)malloc(vertices * sizeof(int));
    int top = -1;
    
    stack[++top] = start;
    visited[start] = 1;
    
    printf("DFS Traversal (Iterative): ");
    while (top >= 0) {
        int u = stack[top--];
        printf("%d ", u);
        
        for (int v = 0; v < vertices; v++) {
            if (adjacencyMatrix[u][v] && !visited[v]) {
                visited[v] = 1;
                stack[++top] = v;
            }
        }
    }
    printf("\n");
    
    free(visited);
    free(stack);
}

int main() {
    printf("=== DFS in Graph (C) ===\n\n");
    
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
    
    int* visited = (int*)malloc(vertices * sizeof(int));
    memset(visited, 0, vertices * sizeof(int));
    
    printf("DFS Traversal (Recursive): ");
    dfs(adjacencyMatrix, vertices, 0, visited);
    printf("\n\n");
    
    dfsIterative(adjacencyMatrix, vertices, 0);
    
    printf("\n=== DFS Algorithm (Recursive) ===\n");
    printf("1. Mark current vertex as visited\n");
    printf("2. Process current vertex\n");
    printf("3. For all unvisited neighbors:\n");
    printf("   - Recursively call DFS\n");
    printf("4. Backtrack\n\n");
    
    printf("=== DFS Complexity ===\n");
    printf("Time Complexity:  O(V + E)\n");
    printf("Space Complexity: O(V)\n");
    printf("Applications: Cycle detection, Topological sort, Connectivity\n");
    
    return 0;
}
