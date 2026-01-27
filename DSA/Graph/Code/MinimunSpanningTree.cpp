#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

typedef struct Edge {
    int u, v, weight;
    bool operator<(const Edge& other) const {
        return weight < other.weight;
    }
} Edge;

class DSU {
public:
    vector<int> parent, rank;
    
    DSU(int n) {
        parent.resize(n);
        rank.resize(n, 0);
        for (int i = 0; i < n; i++) {
            parent[i] = i;
        }
    }
    
    int findParent(int x) {
        if (parent[x] != x) {
            parent[x] = findParent(parent[x]);
        }
        return parent[x];
    }
    
    void unionSets(int x, int y) {
        x = findParent(x);
        y = findParent(y);
        
        if (x != y) {
            if (rank[x] < rank[y]) {
                parent[x] = y;
            } else if (rank[x] > rank[y]) {
                parent[y] = x;
            } else {
                parent[y] = x;
                rank[x]++;
            }
        }
    }
};

void kruskalMST(int vertices, vector<Edge>& edges) {
    sort(edges.begin(), edges.end());
    
    DSU dsu(vertices);
    cout << "Minimum Spanning Tree (Kruskal's):\n";
    int mstWeight = 0;
    int mstEdges = 0;
    
    for (const Edge& e : edges) {
        int x = dsu.findParent(e.u);
        int y = dsu.findParent(e.v);
        
        if (x != y && mstEdges < vertices - 1) {
            cout << e.u << " - " << e.v << ": weight " << e.weight << "\n";
            mstWeight += e.weight;
            mstEdges++;
            dsu.unionSets(x, y);
        }
    }
    
    cout << "Total MST Weight: " << mstWeight << "\n";
}

int main() {
    cout << "=== Minimum Spanning Tree (C++) ===\n\n";
    
    int vertices = 5;
    vector<Edge> edges = {
        {0, 1, 2},
        {0, 3, 6},
        {1, 2, 3},
        {1, 3, 8},
        {1, 4, 5},
        {2, 4, 7},
        {3, 4, 1}
    };
    
    cout << "Graph (5 vertices, 7 edges)\n";
    cout << "Edges with weights: 0-1(2), 0-3(6), 1-2(3), 1-3(8), 1-4(5), 2-4(7), 3-4(1)\n\n";
    
    kruskalMST(vertices, edges);
    
    cout << "\n=== Kruskal's Algorithm ===\n";
    cout << "1. Sort edges by weight\n";
    cout << "2. Use Union-Find DSU\n";
    cout << "3. For each edge (u,v):\n";
    cout << "   - If u and v not connected: add to MST\n";
    cout << "   - Union the two components\n";
    cout << "4. Continue until V-1 edges added\n\n";
    
    cout << "=== Complexity ===\n";
    cout << "Time Complexity:  O(E log E)\n";
    cout << "Space Complexity: O(V + E)\n";
    
    return 0;
}
