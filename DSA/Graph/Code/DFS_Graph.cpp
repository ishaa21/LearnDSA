#include <iostream>
#include <vector>
#include <stack>
using namespace std;

class DFSGraph {
private:
    int vertices;
    vector<vector<int>> adjacencyMatrix;
    
    void dfsHelper(int u, vector<bool>& visited) {
        visited[u] = true;
        cout << u << " ";
        
        for (int v = 0; v < vertices; v++) {
            if (adjacencyMatrix[u][v] && !visited[v]) {
                dfsHelper(v, visited);
            }
        }
    }
    
public:
    DFSGraph(int v) : vertices(v) {
        adjacencyMatrix.assign(v, vector<int>(v, 0));
    }
    
    void addEdge(int u, int v) {
        adjacencyMatrix[u][v] = 1;
        adjacencyMatrix[v][u] = 1;
    }
    
    void dfsRecursive(int start) {
        vector<bool> visited(vertices, false);
        cout << "DFS Traversal (Recursive): ";
        dfsHelper(start, visited);
        cout << "\n";
    }
    
    void dfsIterative(int start) {
        vector<bool> visited(vertices, false);
        stack<int> s;
        
        s.push(start);
        visited[start] = true;
        
        cout << "DFS Traversal (Iterative): ";
        while (!s.empty()) {
            int u = s.top();
            s.pop();
            cout << u << " ";
            
            for (int v = 0; v < vertices; v++) {
                if (adjacencyMatrix[u][v] && !visited[v]) {
                    visited[v] = true;
                    s.push(v);
                }
            }
        }
        cout << "\n";
    }
};

int main() {
    cout << "=== DFS in Graph (C++) ===\n\n";
    
    DFSGraph graph(5);
    
    graph.addEdge(0, 1);
    graph.addEdge(0, 4);
    graph.addEdge(1, 2);
    graph.addEdge(1, 3);
    graph.addEdge(1, 4);
    graph.addEdge(2, 3);
    graph.addEdge(3, 4);
    
    cout << "Graph (5 vertices, 7 edges)\n";
    cout << "Edges: 0-1, 0-4, 1-2, 1-3, 1-4, 2-3, 3-4\n\n";
    
    graph.dfsRecursive(0);
    cout << "\n";
    graph.dfsIterative(0);
    
    cout << "\n=== DFS Algorithm ===\n";
    cout << "1. Mark current vertex as visited\n";
    cout << "2. Process current vertex\n";
    cout << "3. For all unvisited neighbors:\n";
    cout << "   - Recursively call DFS\n";
    cout << "4. Backtrack\n\n";
    
    cout << "=== DFS Complexity ===\n";
    cout << "Time Complexity:  O(V + E)\n";
    cout << "Space Complexity: O(V)\n";
    cout << "Applications: Cycle detection, Topological sort, Connectivity\n";
    
    return 0;
}
