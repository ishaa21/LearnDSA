#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Edge {
    int u, v, weight;
} Edge;

typedef struct {
    int parent;
    int rank;
} DSU;

int findParent(DSU* dsu, int x) {
    if (dsu[x].parent != x) {
        dsu[x].parent = findParent(dsu, dsu[x].parent);
    }
    return dsu[x].parent;
}

void unionSets(DSU* dsu, int x, int y) {
    x = findParent(dsu, x);
    y = findParent(dsu, y);
    
    if (dsu[x].rank < dsu[y].rank) {
        dsu[x].parent = y;
    } else if (dsu[x].rank > dsu[y].rank) {
        dsu[y].parent = x;
    } else {
        dsu[y].parent = x;
        dsu[x].rank++;
    }
}

int compare(const void* a, const void* b) {
    return ((Edge*)a)->weight - ((Edge*)b)->weight;
}

void kruskalMST(int vertices, int edges, Edge* edgeList) {
    qsort(edgeList, edges, sizeof(Edge), compare);
    
    DSU* dsu = (DSU*)malloc(vertices * sizeof(DSU));
    for (int i = 0; i < vertices; i++) {
        dsu[i].parent = i;
        dsu[i].rank = 0;
    }
    
    printf("Minimum Spanning Tree (Kruskal's):\n");
    int mstWeight = 0;
    int mstEdges = 0;
    
    for (int i = 0; i < edges && mstEdges < vertices - 1; i++) {
        int x = findParent(dsu, edgeList[i].u);
        int y = findParent(dsu, edgeList[i].v);
        
        if (x != y) {
            printf("%d - %d: weight %d\n", edgeList[i].u, edgeList[i].v, edgeList[i].weight);
            mstWeight += edgeList[i].weight;
            mstEdges++;
            unionSets(dsu, x, y);
        }
    }
    
    printf("Total MST Weight: %d\n", mstWeight);
    free(dsu);
}

int main() {
    printf("=== Minimum Spanning Tree (C) ===\n\n");
    
    int vertices = 5;
    int edgesCount = 7;
    
    Edge edges[] = {
        {0, 1, 2},
        {0, 3, 6},
        {1, 2, 3},
        {1, 3, 8},
        {1, 4, 5},
        {2, 4, 7},
        {3, 4, 1}
    };
    
    printf("Graph (5 vertices, 7 edges)\n");
    printf("Edges with weights: 0-1(2), 0-3(6), 1-2(3), 1-3(8), 1-4(5), 2-4(7), 3-4(1)\n\n");
    
    kruskalMST(vertices, edgesCount, edges);
    
    printf("\n=== Kruskal's Algorithm ===\n");
    printf("1. Sort edges by weight\n");
    printf("2. Use Union-Find DSU\n");
    printf("3. For each edge (u,v):\n");
    printf("   - If u and v not connected: add to MST\n");
    printf("   - Union the two components\n");
    printf("4. Continue until V-1 edges added\n\n");
    
    printf("=== Complexity ===\n");
    printf("Time Complexity:  O(E log E)\n");
    printf("Space Complexity: O(V + E)\n");
    
    return 0;
}
