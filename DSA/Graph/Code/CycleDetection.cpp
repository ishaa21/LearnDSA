#include <iostream>
#include <vector>
using namespace std;

class CycleDetection {
private:
    int vertices;
    vector<vector<int>> adjacencyMatrix;
    
    bool hasCycleDFS(int u, int parent, vector<bool>& visited) {
        visited[u] = true;
        
        for (int v = 0; v < vertices; v++) {
            if (adjacencyMatrix[u][v]) {
                if (!visited[v]) {
                    if (hasCycleDFS(v, u, visited)) {
                        return true;
                    }
                } else if (v != parent) {
                    return true;
                }
            }
        }
        
        return false;
    }
    
public:
    CycleDetection(int v) : vertices(v) {
        adjacencyMatrix.assign(v, vector<int>(v, 0));
    }
    
    void addEdge(int u, int v) {
        adjacencyMatrix[u][v] = 1;
        adjacencyMatrix[v][u] = 1;
    }
    
    bool detectCycle() {
        vector<bool> visited(vertices, false);
        
        for (int i = 0; i < vertices; i++) {
            if (!visited[i]) {
                if (hasCycleDFS(i, -1, visited)) {
                    return true;
                }
            }
        }
        
        return false;
    }
};

int main() {
    cout << "=== Cycle Detection (C++) ===\n\n";
    
    cout << "Graph 1 (With Cycle):\n";
    CycleDetection graph1(4);
    graph1.addEdge(0, 1);
    graph1.addEdge(1, 2);
    graph1.addEdge(2, 3);
    graph1.addEdge(3, 0);
    
    cout << "Edges: 0-1, 1-2, 2-3, 3-0 (forms a cycle)\n";
    cout << "Cycle Detected: " << (graph1.detectCycle() ? "Yes" : "No") << "\n\n";
    
    cout << "Graph 2 (Acyclic):\n";
    CycleDetection graph2(4);
    graph2.addEdge(0, 1);
    graph2.addEdge(1, 2);
    graph2.addEdge(2, 3);
    
    cout << "Edges: 0-1, 1-2, 2-3 (no cycle)\n";
    cout << "Cycle Detected: " << (graph2.detectCycle() ? "Yes" : "No") << "\n\n";
    
    cout << "=== Algorithm ===\n";
    cout << "1. Use DFS to traverse graph\n";
    cout << "2. For each vertex, track parent\n";
    cout << "3. If visited neighbor is not parent = cycle found\n";
    cout << "4. Continue for all components\n\n";
    
    cout << "=== Complexity ===\n";
    cout << "Time Complexity:  O(V + E)\n";
    cout << "Space Complexity: O(V)\n";
    
    return 0;
}
