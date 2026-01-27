#include <stdio.h>
#include <stdlib.h>

typedef struct Graph {
    int vertices;
    int edges;
    int** adjacencyMatrix;
} Graph;

Graph* createGraph(int vertices) {
    Graph* graph = (Graph*)malloc(sizeof(Graph));
    graph->vertices = vertices;
    graph->edges = 0;
    
    graph->adjacencyMatrix = (int**)malloc(vertices * sizeof(int*));
    for (int i = 0; i < vertices; i++) {
        graph->adjacencyMatrix[i] = (int*)malloc(vertices * sizeof(int));
        for (int j = 0; j < vertices; j++) {
            graph->adjacencyMatrix[i][j] = 0;
        }
    }
    
    return graph;
}

void addEdge(Graph* graph, int u, int v) {
    graph->adjacencyMatrix[u][v] = 1;
    graph->adjacencyMatrix[v][u] = 1;
    graph->edges++;
}

void printAdjacencyMatrix(Graph* graph) {
    printf("Adjacency Matrix:\n");
    for (int i = 0; i < graph->vertices; i++) {
        for (int j = 0; j < graph->vertices; j++) {
            printf("%d ", graph->adjacencyMatrix[i][j]);
        }
        printf("\n");
    }
}

typedef struct {
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
    if (q->front <= q->rear) {
        return q->items[q->front++];
    }
    return -1;
}

void printAdjacencyList(Graph* graph) {
    printf("Adjacency List:\n");
    for (int i = 0; i < graph->vertices; i++) {
        printf("%d -> ", i);
        for (int j = 0; j < graph->vertices; j++) {
            if (graph->adjacencyMatrix[i][j]) {
                printf("%d ", j);
            }
        }
        printf("\n");
    }
}

int main() {
    printf("=== Graph Representation (C) ===\n\n");
    
    Graph* graph = createGraph(5);
    
    addEdge(graph, 0, 1);
    addEdge(graph, 0, 4);
    addEdge(graph, 1, 2);
    addEdge(graph, 1, 3);
    addEdge(graph, 1, 4);
    addEdge(graph, 2, 3);
    addEdge(graph, 3, 4);
    
    printf("Vertices: %d, Edges: %d\n\n", graph->vertices, graph->edges);
    
    printAdjacencyMatrix(graph);
    printf("\n");
    printAdjacencyList(graph);
    
    printf("\n=== Graph Representation Methods ===\n");
    printf("1. Adjacency Matrix\n");
    printf("   - 2D array where arr[i][j] = 1 if edge exists\n");
    printf("   - Space: O(V²)\n");
    printf("   - Edge lookup: O(1)\n\n");
    
    printf("2. Adjacency List\n");
    printf("   - Array of linked lists\n");
    printf("   - Space: O(V + E)\n");
    printf("   - Edge lookup: O(degree)\n\n");
    
    printf("=== Complexity Comparison ===\n");
    printf("Operation        | Adjacency Matrix | Adjacency List\n");
    printf("Space           | O(V²)           | O(V + E)\n");
    printf("Add Edge        | O(1)            | O(1)\n");
    printf("Remove Edge     | O(1)            | O(degree)\n");
    printf("Check Edge      | O(1)            | O(degree)\n");
    printf("Get Neighbors   | O(V)            | O(degree)\n");
    
    return 0;
}
